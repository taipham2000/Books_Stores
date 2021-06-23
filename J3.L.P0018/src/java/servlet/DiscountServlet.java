/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ProductDao;
import dto.Discount;
import dto.DiscountError;
import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "DiscountServlet", urlPatterns = {"/DiscountServlet"})
public class DiscountServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
       String discountID=request.getParameter("txtdiscountID");
       String discountDescription = request.getParameter("txtdiscountDescription");
       int percent = Integer.parseInt(request.getParameter("txtpercent"));
       boolean status = true;
       String action = request.getParameter("action");
       ProductDao dao = new ProductDao();
       DiscountError errorD = new DiscountError();
       List<Discount> listDiscount = dao.getListCreateDiscount();
       try{
           if(action.equals("CreateDiscount")){
               boolean valid = true;
               for(Discount dis : listDiscount){
                   if(discountID.equals(dis.getDiscountID())){
                       errorD.setDiscountIDError("ID is Exist");
                       valid = false;
                   }
               }
               if(percent < 0 || percent >100){
                   errorD.setPercentDiscountError("Percent musst be greater than 0 and less than 100");
                   valid = false;
               }
               if(valid){
                   dao.createDiscount(discountID, discountDescription, percent, status);
                   List<Product> listProduct = dao.getAllBook();
                   request.setAttribute("listBook", listProduct);
                   request.getRequestDispatcher("index.jsp").forward(request, response);
               }
               else{
                   request.setAttribute("INVALID", errorD);
                   request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
               }
           }
       }catch(Exception e){
           
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DiscountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DiscountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
