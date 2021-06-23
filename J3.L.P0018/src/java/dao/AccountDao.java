/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUItis;

/**
 *
 * @author phamv
 */
public class AccountDao {
     Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    Vector<Account> listUser;
     public void Closefinally() throws SQLException{
        if(rs!=null){
        rs.close();
    }if(ps!=null){
        ps.close();
    }if(con!=null){
        con.close();
    }
    }
    public Account check(String user,String password) throws SQLException{
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Select * from Users where username=? and password=?";
               ps=con.prepareStatement(sql);
               ps.setString(1, user);
               ps.setString(2, password);
               rs=ps.executeQuery();
               while(rs.next()){
                   return new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
               }
               
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Closefinally();
        }
        return null;
    }
    
    public Account checkLogin(String name, String password) {
        try {
            getAllUser();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (name == null || password == null) {
            return null;
        }
        for (Account user: listUser) {
            if (name.equals(user.getUsername()) && password.equals(user.getPassword())) {
                return user;
            }
        }
        return null;
    }
    public Vector<Account> getAllUser() throws SQLException {
        Connection con = null; // Đối tượng tạo kết nối với CSDL
        PreparedStatement ps = null; // đối tượng tạo câu truy vấn
        ResultSet rs = null; // Đối tượng nhận kết quả truy vấn
        listUser.clear();

        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "SELECT * FROM Users";

                ps = con.prepareStatement(sql); // tạo đối trượng truy vấn
                rs = ps.executeQuery(); // 

                while (rs.next()) {
                    listUser.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
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
        System.out.println("Load Successful!");
        return listUser;
    }
    public Account getUserByID(String userID) throws SQLException {
        if (listUser.size() == 0) {
            getAllUser();
        }
        for (int i = 0; i < listUser.size(); i++) {
            if (listUser.get(i).getUserID().equals(userID)) {
                return listUser.get(i);
            }
        }
        return null;
    }
     public String getRoleOfUser(Account user) throws SQLException{
        Connection con = null; // Đối tượng tạo kết nối với CSDL
        PreparedStatement ps = null; // đối tượng tạo câu truy vấn
        ResultSet rs = null; // Đối tượng nhận kết quả truy vấn
        listUser.clear();
        String role = null;

        try {
            con = DBUItis.openConnection();
            if (con != null) {
                String sql = "SELECT roleName FROM Roles WHERE roleID= (SELECT roleID FROM Users WHERE userID=N'"+user.getUserID()+"')";

                ps = con.prepareStatement(sql); // tạo đối trượng truy vấn
                rs = ps.executeQuery(); // 

                rs.next();
                role = rs.getString(1);
                }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
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
        System.out.println("Load Successful!");
        return role;
    }
    public static void main(String[] args) throws SQLException {
        AccountDao dao=new AccountDao();
        System.out.println(dao.getAllUserID());
    }
    public boolean createAccount(Account ac) throws SQLException{
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Insert Users values(?,?,?,?,?,?)";
                ps= con.prepareStatement(sql);
                ps.setString(1, ac.getUserID());
                ps.setString(2, ac.getUsername());         
                ps.setString(3, ac.getPassword());
                ps.setString(4, ac.getAdddresss());
                ps.setString(5, ac.getPhone());
                ps.setString(6, "2");
                ps.executeUpdate();
            }
        }catch(Exception e){
            
        }
        finally{
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
        return true;
    }
    public List<Account> getAllUserID() throws SQLException{
         List<Account> list = new ArrayList<Account>();
        list.clear();
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Select * from Users Where roleID=2";
                ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
                while (rs.next()) {
                    list.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
                }
            }
            
        }catch(Exception e){
            
        }finally{
            Closefinally();
        }
        return list;
    }
}
