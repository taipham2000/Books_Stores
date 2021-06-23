/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.OrderDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import dto.Account;
import dto.Cart;
import dto.Discount;
import dto.Order;
import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phamv
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String action = request.getParameter("action");
        float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));
        String discountID = (String) request.getAttribute("tdiscountID");
        System.out.println("Discount ID:"+discountID);
        float total = 0;
        Account user = (Account) session.getAttribute("user");
        OrderDao daoO = new OrderDao();
        ProductDao dao = new ProductDao();
        OrderDetailDao daoOD = new OrderDetailDao();
        Order order = new Order();
        Account daoA = new Account();

        try {
            int oID = daoO.getLastOrder();
            int orderID = oID + 1;
            int oDID = daoO.getLastRecordOrderDetail();
            int orderDetailID = oDID + 1;
            List<Cart> listCart = (List<Cart>) session.getAttribute("cart");
            System.out.println("Price1 :" + totalPrice);
            if (action.equals("checkout")) {
                System.out.println("Price2 :" + totalPrice);

                if (user != null) {
                    int insertOrder = daoO.insertOrder(orderID, user.getUserID(), totalPrice, discountID);
                    
                    if (insertOrder > 0) {

                        int orderIDs = daoO.getLastOrder();
                        int insertOrderDetail = 0;
                        for (Cart cart : listCart) {
                            insertOrderDetail = 0;
                            if(cart.getSanpham().getQuantity() < cart.getQuantities()){
                                request.setAttribute("ERROR", "The number of books is not enough");
                                request.getRequestDispatcher("CheckoutSuccess.jsp").forward(request, response);
                            }else{
                            insertOrderDetail = daoO.insertDetail(orderDetailID, orderID, cart.getSanpham().getProductID(), totalPrice, cart.getQuantities());
                            System.out.println("liscart1:" + listCart);
                            dao.setQuantityBook(cart.getSanpham().getProductID(), cart.getQuantities());
                            }
                            orderDetailID++;
                            System.out.println("OrderIDDetail 2:" + orderDetailID);
                            System.out.println("liscart2:" + listCart);
                        }
                        if (insertOrderDetail > 0) {
                            if (discountID != null) {
                                int removeDiscount = dao.removeDiscount(discountID);
                                if (removeDiscount > 0) {
                                    request.setAttribute("SUCCESS", "CheckOut Susccess");

                                }
                            } else {
                                request.setAttribute("SUCCESS", "Checkout Success!");
                                request.getRequestDispatcher("CheckoutSuccess.jsp").forward(request, response);
                            }
                        }

                    }
                }
                listCart.clear();
            }
        } catch (Exception e) {

        } finally {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
