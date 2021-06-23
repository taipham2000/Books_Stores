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
public class Product {
    private String productID;
    private String productName;
    private float price;
    private int quantity;
    private String shortDescription;
    private String productDescription;
    private String imageUrl;
    private boolean status;
    private String categoryID;

    public Product() {
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public Product(String productID, String productName, float price, int quantity, String shortDescription, String productDescription, String imageUrl, boolean status, String categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.shortDescription = shortDescription;
        this.productDescription = productDescription;
        this.imageUrl = imageUrl;
        this.status = status;
        this.categoryID = categoryID;
    }
    
    public Product(String productID, String productName, float price, int quantity, String shortDescription, String productDescription, String imageUrl, String categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.shortDescription = shortDescription;
        this.productDescription = productDescription;
        this.imageUrl = imageUrl;
        this.categoryID = categoryID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", price=" + price + ", quantity=" + quantity + ", shortDescription=" + shortDescription + ", productDescription=" + productDescription + ", imageUrl=" + imageUrl + ", categoryID=" + categoryID + '}';
    }
    
                            
}
