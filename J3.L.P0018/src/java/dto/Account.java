/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author phamv
 */
public class Account {
    private String userID,username,password,adddresss,phone;
    int roleID;

    public Account(String userID, String username) {
        this.userID = userID;
        this.username = username;
    }

    public Account() {
    }
    
    public Account(String userID, String username, String password, String adddresss, String phone, int roleID) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.adddresss = adddresss;
        this.phone = phone;
        this.roleID = roleID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getAdddresss() {
        return adddresss;
    }

    public void setAdddresss(String adddresss) {
        this.adddresss = adddresss;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
   

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Account{" + "userID=" + userID + ", username=" + username + ", password=" + password + ", adddresss=" + adddresss + ", phone=" + phone + ", roleID=" + roleID + '}';
    }

   
    
}
