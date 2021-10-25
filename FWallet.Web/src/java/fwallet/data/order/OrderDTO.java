/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.order;

import java.sql.Timestamp;

/**
 *
 * @author pphuh
 */
public class OrderDTO {
    private String orderID;
    private String userID;
    private String productID;
    private int usedPoint;
    private Timestamp orderDate;
    private String orderStatus;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String userID, String productID, int usedPoint, Timestamp orderDate, String orderStatus) {
        this.orderID = orderID;
        this.userID = userID;
        this.productID = productID;
        this.usedPoint = usedPoint;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getUsedPoint() {
        return usedPoint;
    }

    public void setUsedPoint(int usedPoint) {
        this.usedPoint = usedPoint;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
    
}
