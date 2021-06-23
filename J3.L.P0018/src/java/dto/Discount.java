/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;

/**
 *
 * @author phamv
 */
public class Discount {
   private String discountID;
   private String discountDescription;
   private int percent;
   private boolean status;
   

    public Discount() {
    }

    public Discount(String discountID, String discountDescription, int percent, boolean status) {
        this.discountID = discountID;
        this.discountDescription = discountDescription;
        this.percent = percent;
        this.status = status;
    }

    public String getDiscountID() {
        return discountID;
    }

    public void setDiscountID(String discountID) {
        this.discountID = discountID;
    }

    public String getDiscountDescription() {
        return discountDescription;
    }

    public void setDiscountDescription(String discountDescription) {
        this.discountDescription = discountDescription;
    }

    public float getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Discount{" + "discountID=" + discountID + ", discountDescription=" + discountDescription + ", percent=" + percent + ", status=" + status + '}';
    }
    
}
