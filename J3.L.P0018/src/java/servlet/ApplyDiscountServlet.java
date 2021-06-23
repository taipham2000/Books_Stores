/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ProductDao;
import dto.Discount;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phamv
 */
@WebServlet(name = "ApplyDiscountServlet", urlPatterns = {"/ApplyDiscountServlet"})
public class ApplyDiscountServlet extends HttpServlet {

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
        ProductDao dao=new ProductDao();
        String action= request.getParameter("action");
        String discountID=request.getParameter("txtdiscountID");
        request.setAttribute("tdiscoutID", discountID);
        List<Discount> listDiscount = new ArrayList<Discount>();
        String description="";
        float percent=0;
        try{
            request.setAttribute("ListDiscount", listDiscount);
           if(action.equals("DiscountApply")){
               listDiscount = dao.getListDiscount();
               for(Discount d: listDiscount){
                   if(discountID.equals(d.getDiscountID())){
                       percent = d.getPercent();
                       description = d.getDiscountDescription();
                   }
               }
               request.setAttribute("discountID", discountID);
               request.setAttribute("Percent", percent);
               request.setAttribute("Description", description);
               request.getRequestDispatcher("showcart.jsp").forward(request, response);
           }
        }
        catch(Exception e){
            
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
