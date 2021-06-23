/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDao;
import dto.Account;
import dto.AccountError;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import java.util.Vector;
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
public class AccountServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        Random generator=new Random();
        try {
                if(action == null){
                    request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
                }
                if(action.equals("register")){
                    String userID="";
                    AccountDao daoU = new AccountDao();
                    List<Account> listUser = daoU.getAllUserID();
                    do{
                        
                    }while(userID.equals(listUser.get(0).getUserID()));
                    
                    String name= request.getParameter("userName");
                    String password = request.getParameter("password");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    int role = 2;
                    
                    
                    Account user = new Account(userID, name, password, address, phone, role);
                    AccountError error = new AccountError();
                    boolean valid =true;
                    
                    for(Account names : listUser){
                        String listNa = names.getUsername();
                        if(name.equals(names.getUsername())){
                            error.setUserNameError("User name is exist");
                            valid = false;
                        }
                    }
                    if(name.trim().isEmpty()){
                        error.setUserNameError("User name is 3 character");
                        valid = false;
                    }
                    if(password.trim().isEmpty() && !password.matches("[a-zA-Z0-9]{8}")){
                        error.setPasswordError("Password 8 digits");
                        valid = false;
                    }
                    if(address.trim().isEmpty()){
                        error.setAddressError("Address is not empty");
                    }
                    if(valid){
                        if(daoU.createAccount(user)){
                            request.getRequestDispatcher("Login.jsp").forward(request, response);
                        }
                    }else{
                        request.setAttribute("INVALID", error);
                        request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
                    }
                }
        } catch (Exception e) {
            System.out.println("Eror: "+e.getMessage());
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
