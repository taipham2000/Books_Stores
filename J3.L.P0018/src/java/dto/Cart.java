package dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Cart implements Serializable {

    private Product sanpham;
    private int quantities;
    public Cart() {
    }



    public Cart(Product sanpham, int quantities) {
        this.sanpham = sanpham;
        this.quantities = quantities;
    }

    public Product getSanpham() {
        return sanpham;
    }

    public void setSanpham(Product sanpham) {
        this.sanpham = sanpham;
    }

    public int getQuantities() {
        return quantities;
    }

    public void setQuantities(int quantities) {
        this.quantities = quantities;
    }

    @Override
    public String toString() {
        return "Cart{" + ", sanpham=" + sanpham + ", quantities=" + quantities + '}';
    }
   
    
}
