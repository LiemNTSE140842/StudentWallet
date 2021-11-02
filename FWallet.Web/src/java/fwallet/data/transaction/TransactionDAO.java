/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.transaction;

import fwallet.data.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pphuh
 */
public class TransactionDAO implements Serializable{
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    
    public boolean insertMinusTransaction(TransactionDTO transaction) throws SQLException, ClassNotFoundException{
        boolean check=false;
        try {
            conn=DBUtil.getConnection();
            if(conn!=null){
                String sql ="INSERT INTO tblTransaction(transactionID, walletID, orderID, minusPoint, orderDate)"
                        + " VALUES(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, transaction.getTransactionID());
                stm.setString(2, transaction.getWalletID());
                stm.setString(3, transaction.getOrderID());
                stm.setInt(4, transaction.getMinusPoint());
                stm.setTimestamp(5, transaction.getOrderDate());
                check = stm.executeUpdate()>0;
            }
        }finally{
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }
        return check;
    }
    
    public boolean insertAddPointTransaction(TransactionDTO transaction) throws SQLException, ClassNotFoundException{
        boolean check=false;
        try {
            conn=DBUtil.getConnection();
            if(conn!=null){
                String sql ="INSERT INTO tblTransaction(transactionID, studentRewardID, walletID, plusPoint, orderDate)"
                        + " VALUES(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, transaction.getTransactionID());
                stm.setString(2, transaction.getStudentRewardID());
                stm.setString(3, transaction.getWalletID());
                stm.setInt(4, transaction.getPlusPoint());
                stm.setTimestamp(5, transaction.getOrderDate());
                check = stm.executeUpdate()>0;
            }
        }finally{
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }
        return check;
    }
    public List<TransactionDTO> getAllTransaction() throws SQLException{
     List<TransactionDTO> list = new ArrayList();
      try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT transactionID, studentRewardID, walletID, orderID, minusPoint, plusPoint, orderDate"
                        +" FROM tblTransaction";
                stm = conn.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    String transactionID = rs.getString("transactionID");
                    String studentrewardID = rs.getString("studentRewardID");
                    String walletID = rs.getString("walletID");
                    double orderID = rs.getDouble("orderID");
                    int minusPoint = rs.getInt("minusPoint");
                    int plusPoint = rs.getInt("plusPoint");
                    Timestamp orderDate  = rs.getTimestamp("orderDate");
                    list.add(new TransactionDTO(transactionID, studentrewardID, walletID, walletID, minusPoint, plusPoint, orderDate));
                }
            }
        } catch (Exception e) {
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }

        return list;
    }
        
        
    }
