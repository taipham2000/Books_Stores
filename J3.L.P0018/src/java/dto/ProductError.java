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
public class ProductError {
    private String productIDError;
    private String productNameError;
    private float priceError;
    private int quantityError;
    private String shortDescriptionError;
    private String productDescriptionError;
    private String imageUrlError;

    public ProductError() {
    }

    public ProductError(String productIDError, String productNameError, float priceError, int quantityError, String shortDescription, String productDescription, String imageUrl) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.shortDescriptionError = shortDescription;
        this.productDescriptionError = productDescription;
        this.imageUrlError = imageUrl;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public float getPriceError() {
        return priceError;
    }

    public void setPriceError(float priceError) {
        this.priceError = priceError;
    }

    public int getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(int quantityError) {
        this.quantityError = quantityError;
    }

    public String getShortDescriptionError() {
        return shortDescriptionError;
    }

    public void setShortDescriptionError(String shortDescription) {
        this.shortDescriptionError = shortDescription;
    }

    public String getProductDescriptionError() {
        return productDescriptionError;
    }

    public void setProductDescriptionError(String productDescription) {
        this.productDescriptionError = productDescription;
    }

    public String getImageUrlError() {
        return imageUrlError;
    }

    public void setImageUrlError(String imageUrl) {
        this.imageUrlError = imageUrl;
    }

    @Override
    public String toString() {
        return "ProductError{" + "productIDError=" + productIDError + ", productNameError=" + productNameError + ", priceError=" + priceError + ", quantityError=" + quantityError + ", shortDescriptionError=" + shortDescriptionError + ", productDescriptionError=" + productDescriptionError + ", imageUrlError=" + imageUrlError + '}';
    }
    
}
