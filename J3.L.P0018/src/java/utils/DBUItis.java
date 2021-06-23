
package utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBUItis implements Serializable{
    public static Connection openConnection(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url= "jdbc:sqlserver://localhost:1433; databaseName=BookStores";
            Connection con= DriverManager.getConnection(url,"sa","123");
//            System.out.println("Connect Successful!!");
            return con;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        DBUItis db=new DBUItis();
        System.out.println(db.openConnection());
    }
}
