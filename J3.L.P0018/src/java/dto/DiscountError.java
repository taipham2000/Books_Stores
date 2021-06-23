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
public class DiscountError {
    private String discountIDError;
    private String discountDescriptionError;
    private int percentDiscountError;

    public DiscountError() {
    }

    public DiscountError(String discountIDError, String discountDescriptionError, int percentDiscountError) {
        this.discountIDError = discountIDError;
        this.discountDescriptionError = discountDescriptionError;
        this.percentDiscountError = percentDiscountError;
    }

    public String getDiscountIDError() {
        return discountIDError;
    }

    public void setDiscountIDError(String discountIDError) {
        this.discountIDError = discountIDError;
    }

    public String getDiscountDescriptionError() {
        return discountDescriptionError;
    }

    public void setDiscountDescriptionError(String discountDescriptionError) {
        this.discountDescriptionError = discountDescriptionError;
    }

    public int getPercentDiscountError() {
        return percentDiscountError;
    }

    public void setPercentDiscountError(int percentDiscountError) {
        this.percentDiscountError = percentDiscountError;
    }

    public void setPercentDiscountError(String percent__0_or_Percent_100) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
