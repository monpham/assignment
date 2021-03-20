package cart;

import entity.Products;

/**
 *
 * @author TVD
 */

public class CartEntity {
    private Products products;
    private int quantity;

    public CartEntity() {
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
