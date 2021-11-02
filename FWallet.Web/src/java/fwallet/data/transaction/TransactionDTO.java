/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.transaction;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author pphuh
 */
public class TransactionDTO implements Serializable{
    private String transactionID;
    private String studentRewardID;
    private String walletID;
    private String orderID;
    private int minusPoint;
    private int plusPoint;
    private Timestamp orderDate;

    public TransactionDTO() {
    }

    public TransactionDTO(String transactionID, String studentRewardID, String walletID, int plusPoint, Timestamp orderDate) {
        this.transactionID = transactionID;
        this.studentRewardID = studentRewardID;
        this.walletID = walletID;
        this.plusPoint = plusPoint;
        this.orderDate = orderDate;
    }

    public TransactionDTO(String transactionID, String studentRewardID, String walletID, String orderID, int minusPoint, Timestamp orderDate) {
        this.transactionID = transactionID;
        this.studentRewardID = studentRewardID;
        this.walletID = walletID;
        this.orderID = orderID;
        this.minusPoint = minusPoint;
        this.orderDate = orderDate;
        
    }

    public TransactionDTO(String transactionID, String studentRewardID, String walletID, String orderID, int minusPoint, int plusPoint, Timestamp orderDate) {
        this.transactionID = transactionID;
        this.studentRewardID = studentRewardID;
        this.walletID = walletID;
        this.orderID = orderID;
        this.minusPoint = minusPoint;
        this.plusPoint = plusPoint;
        this.orderDate = orderDate;
    }
    
    public String getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(String transactionID) {
        this.transactionID = transactionID;
    }

    public String getStudentRewardID() {
        return studentRewardID;
    }

    public void setStudentRewardID(String studentRewardID) {
        this.studentRewardID = studentRewardID;
    }

    public String getWalletID() {
        return walletID;
    }

    public void setWalletID(String walletID) {
        this.walletID = walletID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public int getMinusPoint() {
        return minusPoint;
    }

    public void setMinusPoint(int minusPoint) {
        this.minusPoint = minusPoint;
    }

    public int getPlusPoint() {
        return plusPoint;
    }

    public void setPlusPoint(int plusPoint) {
        this.plusPoint = plusPoint;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
    
    
}
