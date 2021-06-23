/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Category;
import dto.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUItis;

/**
 *
 * @author phamv
 */
public class CategoryDao {
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    List<Category> listCategory=new ArrayList<Category>();
    public void closeFinally() throws SQLException{
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
    public List<Category> getAllCategory() throws SQLException{
        try{
            con=DBUItis.openConnection();
            String sql="Select * from Categories";
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                listCategory.add(new Category(rs.getString(1), rs.getString(2)));
            }
        }catch(Exception e){
            System.out.println("Error Message: "+e.getMessage());
        }finally{
            closeFinally();
        }
        return listCategory;
    }
}
