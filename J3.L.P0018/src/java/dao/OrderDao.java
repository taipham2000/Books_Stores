/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import dto.Order;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.Vector;
import javax.naming.NamingException;
import static org.apache.coyote.ContainerThreadMarker.clear;
import utils.DBUItis;

/**
 *
 * @author phamv
 */
public class OrderDao implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void Closefinally() throws SQLException {
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
public int insertOrder(int order, String userID,float total,String discount) throws SQLException, ClassNotFoundException {
        try {
            //get Current Date
            java.util.Date date = new java.util.Date();
            java.sql.Date beginDate = new java.sql.Date(date.getTime());

            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "insert into Orders\n"
                        + "values (?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(5, discount);
                ps.setDate(3, beginDate);
                ps.setFloat(4, total);
                ps.setString(2, userID);
                ps.setInt(1, order);

                int r = ps.executeUpdate();
                if (r > 0) {
                    return r;
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
    public int  createOrder(int orderID, String userID, float price) throws NamingException, SQLException {
       java.util.Date today = new java.util.Date();
        Date createDate = new Date(today.getTime());
        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "Insert Orders values(?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, orderID);
                ps.setString(2, userID);
                ps.setDate(3, createDate);
                ps.setFloat(4, price);
                ps.executeUpdate();
                
            }
        } catch (Exception e) {

        } finally {
            Closefinally();
        }
        return 0;
    }
           public int insertDetail(int orderDetailID,int oderID,  String productID,float price , int detailQuantity) throws SQLException, ClassNotFoundException {
        
               clear();
                       try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "insert OrderDetail (OrderDetailID,OrderID,productID,price,quantity)\n"
                        + "values (?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, orderDetailID);
                ps.setInt(2, oderID);
                ps.setString(3, productID);
                ps.setFloat(4, price);
                ps.setInt(5, detailQuantity);

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
    public static void main(String[] args) throws SQLException, ClassNotFoundException, NamingException {
        OrderDao o=new OrderDao();
        
        System.out.println(o.insertOrder(29, "U04",178000,"CT"));
    }
  public int getLastOrder() throws SQLException, ClassNotFoundException {
        int result = 0;
        try {        
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "SELECT MAX(OrderID) as OrderID\n"
                        + "FROM Orders";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                
                if(rs.next()){
                    result = rs.getInt("OrderID");
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
        return result;

    }
 
    public int getLastRecordOrderDetail() throws NamingException, SQLException {

        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "SELECT OrderDetailID FROM OrderDetail ORDER BY orderDetailID DESC";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("orderDetailID");
                }
            }
        } finally {
            Closefinally();
        }
        return -1;
    }
    
}
