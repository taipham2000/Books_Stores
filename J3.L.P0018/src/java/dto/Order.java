/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author phamv
 */
public class Order implements Serializable{
    private int orderID;
    private String userID;
    private List<Cart> listCart;
    private float price;
    private Date date;
    

    public Order() {
    }

    public Order(int orderID, String userID, List<Cart> listCart, float price, Date date) {
        this.orderID = orderID;
        this.userID = userID;
        this.listCart = listCart;
        this.price = price;
        this.date = date;
    }

    public List<Cart> getListCart() {
        return listCart;
    }

    public void setListCart(List<Cart> listCart) {
        this.listCart = listCart;
    }
    
    public Order(int orderID, String userID, float price, Date date) {
        this.orderID = orderID;
        this.userID = userID;
        this.price = price;
        this.date = date;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", userID=" + userID + ", price=" + price + ", date=" + date + '}';
    }
    
}
