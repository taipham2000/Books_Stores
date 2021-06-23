/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDao;
import dao.CategoryDao;
import dao.HistoryDao;
import dao.ProductDao;
import dto.Account;
import dto.Category;
import dto.History;
import dto.Product;
import dto.ProductError;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author phamv
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "images";
    private String ImageURLAfter = "";

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
        String action = request.getParameter("action");
        ProductDao dao = new ProductDao();
        AccountDao daoA = new AccountDao();
        List<Category> category = new ArrayList<Category>();
        List<Account> listAccount = new ArrayList<Account>();
        List<Product> listPro = new ArrayList<Product>();
        CategoryDao daoC = new CategoryDao();
        String Error = "pageError";
        String pageBook = "index.jsp";
        String control = "ProductServlet";
        String Login = "Login.jsp";
        String searchP = "Search.jsp";
        String AddProduct = "AddProduct.jsp";
        HttpSession httpSession = request.getSession();
        httpSession.setMaxInactiveInterval(3000);
        listPro = dao.getAllBook();
        try {
            if (action == null) {
                List<Product> listProduct = dao.getAllBook();
                request.setAttribute("listBook", listProduct);
                RequestDispatcher rd = request.getRequestDispatcher(pageBook);
                rd.forward(request, response);
            } else if (action.equals("search")) {
                String search = request.getParameter("search");
                List<Product> listProductSearch = dao.getProductNameSearch(search);
                if (listProductSearch != null) {
                    request.setAttribute("ListProductSearch", listProductSearch);

                }
                request.getRequestDispatcher(searchP).forward(request, response);
            } else if (action.equals("Login")) {
                RequestDispatcher rd = request.getRequestDispatcher(Login);
                rd.forward(request, response);
            } else if (action.equals("logout")) {
                httpSession.invalidate();
                response.sendRedirect(control);
            } else if (action.equals("Create")) {

                String productID = request.getParameter("productID").trim();
                String productName = request.getParameter("productName").trim();
                String shortDescription = request.getParameter("shortDescription").trim();
                String productDescription = request.getParameter("productDescription").trim();
                String quantity = request.getParameter("quantity").trim();
                String price = request.getParameter("price").trim();
                String categoryID = request.getParameter("categoryID").trim();
                String url = request.getParameter("txtimage");

                boolean valid = true;
                
                ProductError errorP = new ProductError(productID, productName, Float.parseFloat(price), Integer.parseInt(quantity), shortDescription, productDescription, url);

                if (productID.trim().isEmpty()) {
                    errorP.setProductIDError("Book ID is not supposed to be empty");
                    valid = false;
                }
                for (Product pro : listPro) {
                    if (productID.equals(pro.getProductID())) {
                        errorP.setProductIDError("Book ID is exist");
                        valid = false;
                        System.out.println("productID1:" + productID);
                        System.out.println("productID2:" + pro.getProductID());
                    }

                }
                if (productName.trim().isEmpty()) {
                    errorP.setProductNameError("Book Name is not supposed to be empty");
                    valid = false;
                }

                
                    Product pro = new Product(productID, productName, Float.parseFloat(price), Integer.parseInt(quantity), shortDescription, productDescription, url, categoryID);
                    if (valid) {
                        if (dao.createBook(productID, productName, Float.parseFloat(price), Integer.parseInt(quantity), shortDescription, productDescription, url, categoryID)) {

                            List<Product> listProduct = dao.getAllBook();
                            request.setAttribute("listBook", listProduct);
                            //request.getRequestDispatcher("index.jsp").forward(request, response);
                            response.sendRedirect(control);
                        }
                    } else {
                        System.out.println("ert"+errorP);
                        request.setAttribute("INVALID", errorP);
                        request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
                    }
                    //response.sendRedirect(control);
                

                
            } else if (action.equals("update")) {
                String productId = request.getParameter("productID");
                Product pro = dao.getAllBookByID(productId);
                request.setAttribute("product", pro);
                List<Category> cate = new ArrayList<Category>();
                cate = daoC.getAllCategory();
                request.setAttribute("listCategory", cate);
                request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
            } else if (action.equals("Updates")) {
                String productID = request.getParameter("productID");
                String productName = request.getParameter("productName");
                String shortDescription = request.getParameter("shortDescription");
                String productDescription = request.getParameter("productDescription");
                String quantity = request.getParameter("quantity");
                String price = request.getParameter("price");
                String categoryID = request.getParameter("categoryID");
                String url = request.getParameter("txtimage");
                boolean valid = true;
                ProductError errorP = new ProductError(productID, productName, Float.parseFloat(price), Integer.parseInt(quantity), shortDescription, productDescription, url);
                
                for (Product pro : listPro) {
                    if (!productID.equals(pro.getProductID())) {
                        errorP.setProductIDError("Not the orriginal id");
                        valid = false;
                        System.out.println("productID1:" + productID);
                        System.out.println("productID2:" + pro.getProductID());
                    }

                }
                if (productID.trim().isEmpty()) {
                    errorP.setProductIDError("Book ID is not supposed to be empty");
                    valid = false;
                }
                if (productName.trim().isEmpty()) {
                    errorP.setProductNameError("Book Name is not supposed to be empty");
                    valid = false;
                }
                if (shortDescription.trim().isEmpty()) {
                    errorP.setShortDescriptionError("Short descrip is not supposed to be empty");
                    valid = false;
                }
                if (productDescription.trim().isEmpty()) {
                    errorP.setProductDescriptionError("Product Descrip is not supposed to be empty");
                    valid = false;
                }
                if (url.trim().isEmpty()) {
                    errorP.setImageUrlError("Image is not supposed to be empty");
                    valid = false;
                }
                Product pro = new Product(productID, productName, Float.parseFloat(price), Integer.parseInt(quantity), shortDescription, productDescription, url, categoryID);
                if (valid) {
                    if (dao.updateBook(productID, productName, Float.parseFloat(price), Integer.parseInt(quantity), shortDescription, productDescription, url, categoryID)) {
                        System.out.println("valid:" + valid);
                        List<Product> listProduct = dao.getAllBook();
                        request.setAttribute("listBook", listProduct);
                        //request.getRequestDispatcher("index.jsp").forward(request, response);
                        response.sendRedirect(control);
                    }
                } else {
                    System.out.println("ErrorP:"+errorP);
                    request.setAttribute("INVALID", errorP);
                    request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
                }
                // response.sendRedirect(control);
            } else if (action.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                Account account = daoA.check(username, password);
                if (account != null) {
                    httpSession.setAttribute("user", account);
                    response.sendRedirect(control);
                } else {
                    String error = "User hoặc password không đúng!";
                    request.setAttribute("error", error);
                    request.setAttribute("userName", username);
                    request.setAttribute("password", password);

                    RequestDispatcher rd = request.getRequestDispatcher(Login);
                    rd.forward(request, response);
                    return;
                }
            } else if (action.equals("addproduct")) {
                Product product = new Product("", "", 0, 0, "", "", "", "");
                request.setAttribute("product", product);
                category = daoC.getAllCategory();
                request.setAttribute("listCategory", category);
                RequestDispatcher rd = request.getRequestDispatcher(AddProduct);
                rd.forward(request, response);
            } else if (action.equals("view")) {
                listAccount = daoA.getAllUserID();
                request.setAttribute("listA", listAccount);

                RequestDispatcher rd = request.getRequestDispatcher("ViewOrder.jsp");
                rd.forward(request, response);
            } else if (action.equals("ViewOrderOfCustomer")) {
                String userID = request.getParameter("userID");
                HistoryDao daoH = new HistoryDao();
                List<History> listH = daoH.loadHistory(userID);
                if (listH != null) {
                    request.setAttribute("listH", listH);
                    request.getRequestDispatcher("ViewOrderOfCustomer.jsp").forward(request, response);
                }
            } else if (action.equals("Find")) {
                String userID = request.getParameter("userID");
                listAccount = daoA.getAllUserID();
                HistoryDao daoH = new HistoryDao();
                List<History> listH = daoH.loadHistory(userID);
                if (listH != null) {
                    request.setAttribute("listH", listH);
                    request.setAttribute("listA", listAccount);
                    request.getRequestDispatcher("HistoryOrder.jsp").forward(request, response);
                }
            } else if (action.equals("delete")) {
                String productID = request.getParameter("productID");
                dao.deleteStatus(productID);
                response.sendRedirect(control);
            }
        } catch (Exception e) {
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("photo");
            fileName = (String) getFileName(filePart);

            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }
        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
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
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
