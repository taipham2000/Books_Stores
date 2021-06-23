/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDetail;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUItis;

/**
 *
 * @author phamv
 */
public class OrderDetailDao implements Serializable{
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
     public void Closefinally() throws SQLException{
        if(rs!=null){
        rs.close();
    }if(ps!=null){
        ps.close();
    }if(con!=null){
        con.close();
    }
    }
     public int createOrderDetailDao(int orderID, String productID, float price, int quantity) throws SQLException{
         try{
             con=DBUItis.openConnection();
             if(con!=null){
                 String sql="Insert OrderDetail values(?,?,?,?)";
                 ps=con.prepareStatement(sql);
                 ps.setInt(1, orderID);
                 ps.setString(2, productID);
                 ps.setFloat(3, price);
                 ps.setInt(4, quantity);
                 
                 int r = ps.executeUpdate();
                 return r;
             }
         }catch(Exception e){
             
         }finally{
             Closefinally();
         }
         return 0;
     }
     public List<OrderDetail> getHistoryOrderDetail(int orderID) throws SQLException{
         List<OrderDetail> listOrderDetail = new ArrayList<>();
         try{
             con=DBUItis.openConnection();
             if(con!=null){
                 String sql="Select * from OrderDetail Where orderID=?";
                 ps.setInt(1, orderID);
                 rs=ps.executeQuery();
                 while(rs.next()){
                     listOrderDetail.add(new OrderDetail(rs.getInt("orderDetailID"), rs.getInt("orderID"),
                             rs.getString("productID"), rs.getFloat("price"), rs.getInt("quantity")));
                 }
             }
         }catch(Exception e){
             
         }finally{
             Closefinally();
         }
         return listOrderDetail;
     }
}
