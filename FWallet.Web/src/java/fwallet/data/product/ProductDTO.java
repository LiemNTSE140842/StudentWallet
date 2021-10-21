/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.product;

import java.sql.Timestamp;

/**
 *
 * @author pphuh
 */
public class ProductDTO {
    private String productID;
    private String categoryID;
    private String productName;
    private String description;
    private double price;
    private int quantity;
    private boolean statusID;
    private Timestamp createDate;
    private String image;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, double price, int quantity, boolean statusID, String image) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
        this.image = image;
    }

    public ProductDTO(String productName, String description, double price, int quantity, boolean statusID) {
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
    }
    
    public ProductDTO(String categoryID, String productName, String description, double price, int quantity, boolean statusID, String image) {
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
        this.image = image;
    }

    public ProductDTO(String productID, String categoryID, String productName, String description, double price, int quantity, boolean statusID, String image) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
        this.image = image;
    }

    public ProductDTO(String productID, String categoryID, String productName, String description, double price, int quantity, boolean statusID, Timestamp createDate, String image) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
        this.createDate = createDate;
        this.image = image;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatusID() {
        return statusID;
    }

    public void setStatusID(boolean statusID) {
        this.statusID = statusID;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
