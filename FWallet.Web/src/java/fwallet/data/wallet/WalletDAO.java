/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.wallet;

import fwallet.data.user.UserDTO;
import fwallet.data.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author pphuh
 */
public class WalletDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    
    public WalletDTO getUserWallet(UserDTO user) throws SQLException{
        WalletDTO wallet = null;
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID"
                        + " FROM tblWallet"
                        + " WHERE userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                rs=stm.executeQuery();
                while(rs.next()){
                    String walletID = rs.getString("walletID");
                    String userID = rs.getString("userID");
                    String walletName = rs.getString("walletName");
                    float balance = rs.getFloat("balance");
                    int walletPoint = rs.getInt("walletPoint");
                    boolean walletStatus = rs.getBoolean("walletStatus");
                    String rewardID = rs.getString("rewardID");
                    wallet = new WalletDTO(walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID);
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
        return wallet;
    }
    
    public WalletDTO getUserWalletByID(String userId) throws SQLException{
        WalletDTO wallet = null;
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID"
                        + " FROM tblWallet"
                        + " WHERE userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userId);
                rs=stm.executeQuery();
                while(rs.next()){
                    String walletID = rs.getString("walletID");
                    String userID = rs.getString("userID");
                    String walletName = rs.getString("walletName");
                    float balance = rs.getFloat("balance");
                    int walletPoint = rs.getInt("walletPoint");
                    boolean walletStatus = rs.getBoolean("walletStatus");
                    String rewardID = rs.getString("rewardID");
                    wallet = new WalletDTO(walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID);
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
        return wallet;
    }
    
    public boolean updateWallet(UserDTO user, int minusPoint) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                String sql ="UPDATE tblWallet"
                        + " SET walletPoint=?"
                        + " WHERE userID=?";
                stm=conn.prepareStatement(sql);
                
                stm.setInt(1, minusPoint);
                stm.setString(2, user.getUserID());
                check=stm.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return check;
    }
}
