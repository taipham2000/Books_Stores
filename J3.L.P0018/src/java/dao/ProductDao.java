/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Discount;
import dto.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.naming.NamingException;
import utils.DBUItis;

/**
 *
 * @author phamv
 */
public class ProductDao {
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    List<Product> listProduct=new ArrayList<Product>();
    
    private void closeconnected() throws SQLException{
        if(rs!=null){
                rs.close();
            }
        if(ps!=null){
                ps.close();
            }
        if(con!=null){
                con.close();
            }
    }

    public ProductDao() {
         try{
        this.listProduct=getAllBook();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public Product getProductByID(String productID) throws SQLException{
        getAllBook();
        for (int i=0; i<listProduct.size(); i++){
            if(listProduct.get(i).getProductID().equals(productID)){
                return listProduct.get(i);
            }
        }
        return null;
    }
    
    public List<Product> getAllBook() throws SQLException{
        listProduct.clear();
        try{
           con=DBUItis.openConnection();
           if(con!=null){
               String sql="Select * From Products Where status = 1 and quantity > 0";
               ps=con.prepareStatement(sql);
              
               rs=ps.executeQuery();
               while(rs.next()){
                    String ProductId= rs.getString("productID");
                    String Productname = rs.getString("productname");
                    int Quantity = rs.getInt("quantity");
                    float Price = rs.getFloat("price");
                    String shortDescription=rs.getString("shortDescription");
                    String productDescription=rs.getString("productDescription");
                    String imageUrl=rs.getString("imageUrl");
                    String categoryId = rs.getString("categoryID");
               listProduct.add(new Product(ProductId, Productname, Price, Quantity, shortDescription, productDescription, imageUrl, categoryId));
           }
           }
        }catch(Exception e){
            
        }finally{
            closeconnected();
        }
        return listProduct;
    }
    public Product find(String id){
    for(Product product : this.listProduct){
        if(product.getProductID().equalsIgnoreCase(id)){
            return product;
        }
    }
    return null;
}
    public int setQuantityBook(String bookID, int quantity) throws SQLException, ClassNotFoundException {
        try {
            con = DBUItis.openConnection();

            if (con != null) {
                String sql = "update Products\n"
                        + "set quantity = quantity - ?\n"
                        + "where productID = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, quantity);
                ps.setString(2, bookID);
                int result = ps.executeUpdate();
                if (result > 0) {
                    return result;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }
     public int getQuantityProductByID(String productID) throws SQLException, NamingException {
        ArrayList<Product> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "SELECT quantity FROM Products WHERE productID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, productID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("quantity");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return -1;
    }
      public boolean updateQuantityAfterCheckout(String productID, int quantityContain) throws SQLException, NamingException {
        ArrayList<Product> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "UPDATE Products SET quantity = ? "
                        + "WHERE productID = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, quantityContain);
                ps.setString(2, productID);
                int row = ps.executeUpdate();
                if (row>0) {
                    return true;
                }
            }
        } finally {
     
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return false;
    }
     
    public boolean createBook(String productID, String productName, Float price, int quantity, String shortDescription, String productDescription, String image, String categoryID) throws SQLException{
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        boolean status = true;
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Insert Products Values(?,?,?,?,?,?,?,?,?)";
                ps=con.prepareStatement(sql);
                ps.setString(1, productID);
                ps.setString(2, productName);
                ps.setFloat(3, price);
                ps.setInt(4, quantity);
                ps.setString(5, shortDescription);
                ps.setString(6, productDescription);
                ps.setBoolean(7, status);
                ps.setString(8, image);
                ps.setString(9, categoryID);
                ps.executeUpdate();
            }
        }catch(Exception e){
            System.out.println("Message error: "+e.getMessage());
        }finally{
            closeconnected();
        }
        return true;
    }
              public static void main(String[] args) throws SQLException, NamingException, ClassNotFoundException {
        ProductDao dao=new ProductDao();
                  System.out.println(dao.updateBook("T001", "Truyen Tam Cam", 18000, 23, "Truyen ke ve ngoai truyen", "truyen truyen thuyet", "tamcam1.png", "TT"));
    }
    public boolean updateBook(String productID, String productName, float price, int quantity, String shortDescription, String productDescription, String image, String categoryID) throws SQLException{
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        boolean status = true;
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Update Products Set productName=?, price=?, quantity=?, shortDescription=?,"
                        + " productDescription=?, status=?, imageUrl=?, categoryID=? where productID=?";
                ps=con.prepareStatement(sql);
                System.out.println("productIDDao:"+productID);
                ps.setString(1, productName);
                ps.setFloat(2, price);
                ps.setInt(3, quantity);
                ps.setString(4, shortDescription);
                ps.setString(5, productDescription);
                ps.setBoolean(6, status);
                ps.setString(7, image);
                ps.setString(8, categoryID);
                ps.setString(9, productID);
                ps.executeUpdate();
                
            }
        }catch(Exception e){
            System.out.println("Message error: "+e.getMessage());
        }
        finally{
            closeconnected();
        }
        return true;
    }
    public boolean deleteStatus(String productID) throws SQLException{
         Connection con=null;
        PreparedStatement ps=null;
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Update Products set status=0 Where productID=?";
                ps=con.prepareStatement(sql);
                ps.setString(1,productID);
                ps.executeUpdate();
            }
        }catch(Exception e){
            System.out.println("Message error: "+e.getMessage());
        }finally{
            closeconnected();
        }
        return true;
    }
    public boolean deleteBook(String productID) throws SQLException{
        Connection con=null;
        PreparedStatement ps=null;
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Delete from Products Where productID=?";
                ps=con.prepareStatement(sql);
                ps.setString(1,productID);
                ps.executeUpdate();
            }
        }catch(Exception e){
            System.out.println("Message error: "+e.getMessage());
        }finally{
            closeconnected();
        }
        return true;
    }
    public List<Product> getProductNameSearch(String search) throws SQLException{
        List<Product> list =null;
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
       
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Select * \n"+
                        "from Products\n"+
                        "Where productname like ?";
                ps=con.prepareStatement(sql);
                ps.setString(1, "%"+search+"%");
                rs=ps.executeQuery();
                while(rs.next()){
                     String ProductId= rs.getString("productID");
                    String Productname = rs.getString("productname");
                    int Quantity = rs.getInt("quantity");
                    float Price = rs.getFloat("price");
                    String shortDescription=rs.getString("shortDescription");
                    String productDescription=rs.getString("productDescription");
                    String imageUrl=rs.getString("imageUrl");
                    String categoryId = rs.getString("categoryID");//"******";
                    if(list == null){
                        list = new ArrayList<>();
                    }
                    list.add(new Product(ProductId, Productname, Price, Quantity, shortDescription, productDescription, imageUrl, categoryId));
                }
              
            }
        
        return list;
    }
    public Product getAllBookByID(String productID) throws SQLException{
        List<Product> list =null;
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql = "SELECT * FROM Products WHERE productID=?";
        try {
            con = DBUItis.openConnection();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, productID);
                rs = ps.executeQuery();

                if (rs.next()) {
                    String id=rs.getString("productID");
                    String productName=rs.getString("productName");
                    float price=rs.getFloat("price");
                    int quantity=rs.getInt("quantity");
                    String shortDescription=rs.getString("shortDescription");
                    String productDescription=rs.getString("productDescription");
                    String image=rs.getString("imageUrl");
                    String categoryID=rs.getString("categoryID");
                    
                    Product pro=new Product(productID, productName, price, quantity, shortDescription, productDescription, image, categoryID);
                    
                    return pro;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
    
         public int removeDiscount(String discountID) throws SQLException, ClassNotFoundException {
        try {
            //get Current Date
            java.util.Date date = new java.util.Date();
            java.sql.Date beginDate = new java.sql.Date(date.getTime());

            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "update Discount\n"
                        + "set status = 0\n"
                        + "where discountID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, discountID);

                int rs = ps.executeUpdate();
                if (rs > 0) {
                    return rs;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;

    }
          public List<Discount> getListCreateDiscount() throws SQLException  {
        List<Discount> list = new ArrayList<>();
        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from Discount\n";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String discountID = rs.getString("discountID");
                    String discountDescription = rs.getString("discountDescription");
                    int prercent = rs.getInt("percentDiscount");
                    boolean status = rs.getBoolean("status");

                    list.add(new Discount(discountID, discountDescription, prercent, status));
                }

            }
        }catch(Exception e){
        }
        
            finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
        public List<Discount> getListDiscount() throws SQLException, ClassNotFoundException {
        List<Discount> list = new ArrayList<>();
        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from Discount\n"
                        + "where status = 1";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String discountID = rs.getString("discountID");
                    String discountDescription = rs.getString("discountDescription");
                    int prercent = rs.getInt("percentDiscount");
                    boolean status = rs.getBoolean("status");

                    list.add(new Discount(discountID, discountDescription, prercent, status));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
          public Discount getListDiscountByID(String discountID) throws SQLException, ClassNotFoundException {
        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from Discount\n"
                        + "where discountID=?";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String ID = rs.getString("discountID");
                    String discountDescription = rs.getString("discountDescription");
                    int prercent = rs.getInt("percentDiscount");
                    boolean status = rs.getBoolean("status");

                    Discount dis = new Discount(ID, discountDescription, prercent, status);
                    return dis;
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
        public int createDiscount(String idDiscount,String discountDescription,int percent,boolean status) throws SQLException, ClassNotFoundException {

        try {

            //get Current Date
            java.util.Date date = new java.util.Date();
            java.sql.Date beginDate = new java.sql.Date(date.getTime());

            //parse String to DateSQL
           // java.sql.Date endDateSQL = Date.valueOf(endDate);

            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "insert into Discount(discountID,discountDescription,percentDiscount,status)\n"
                        + "values (?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, idDiscount);
                ps.setString(2, discountDescription);
                ps.setInt(3, percent);
                ps.setBoolean(4, status);

                int rs = ps.executeUpdate();
                if (rs > 0) {
                    return rs;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }
    public List<Product>  getProductByPrices(int price1, int price2) throws SQLException{
        
        listProduct.clear();
        
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Select * from Products Where price BETWEEN ? AND ?";
                ps=con.prepareStatement(sql);
                ps.setInt(1, price1);
                ps.setInt(2, price2);
                rs = ps.executeQuery();
                
                while(rs.next()){
                    String id=rs.getString("productID");
                    String productName=rs.getString("productName");
                    float price=rs.getFloat("price");
                    int quantity=rs.getInt("quantity");
                    String shortDescription=rs.getString("shortDescription");
                    String productDescription=rs.getString("productDescription");
                    String image=rs.getString("imageUrl");
                    String categoryID=rs.getString("categoryID");
                    
                    listProduct.add(new Product(id, productName, price,
                            quantity, shortDescription, productDescription, image, categoryID));
                }
            }
        }catch(Exception e){
            
        }finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listProduct;
    }

    
  
}
