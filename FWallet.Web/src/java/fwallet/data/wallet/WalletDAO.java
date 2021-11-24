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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pphuh
 */
public class WalletDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    
    public List<WalletDTO> getWalletByWalletName(String search) throws SQLException{
        List<WalletDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID"
                        + " FROM tblWallet"
                        + " WHERE walletName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String walletID = rs.getString("walletID");
                    String userID = rs.getString("userID");
                    String walletName = rs.getString("walletName");
                    float balance = rs.getFloat("balance");
                    int walletPoint = rs.getInt("walletPoint");
                    boolean walletStatus = rs.getBoolean("walletStatus");
                    String rewardID = rs.getString("rewardID");
                    list.add(new WalletDTO(walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID));
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
    
    public List<WalletDTO> getDeleteWalletByWalletName(String search) throws SQLException{
        List<WalletDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID"
                        + " FROM tblWallet"
                        + " WHERE walletStatus = 0 AND walletName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String walletID = rs.getString("walletID");
                    String userID = rs.getString("userID");
                    String walletName = rs.getString("walletName");
                    float balance = rs.getFloat("balance");
                    int walletPoint = rs.getInt("walletPoint");
                    boolean walletStatus = rs.getBoolean("walletStatus");
                    String rewardID = rs.getString("rewardID");
                    list.add(new WalletDTO(walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID));
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
    
    public List<WalletDTO> getActiveWalletByWalletName(String search) throws SQLException{
        List<WalletDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID"
                        + " FROM tblWallet"
                        + " WHERE walletStatus = 1 AND walletName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String walletID = rs.getString("walletID");
                    String userID = rs.getString("userID");
                    String walletName = rs.getString("walletName");
                    float balance = rs.getFloat("balance");
                    int walletPoint = rs.getInt("walletPoint");
                    boolean walletStatus = rs.getBoolean("walletStatus");
                    String rewardID = rs.getString("rewardID");
                    list.add(new WalletDTO(walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID));
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
    
    public WalletDTO getUserNameByWalletID(String id) throws SQLException{
        WalletDTO wallet = null;
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT tblWallet.userID, tblStudent.studentName"
                        + " FROM tblStudent"
                        + " INNER JOIN tblWallet ON tblStudent.userID = tblWallet.userID"
                        + " WHERE tblWallet.userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs=stm.executeQuery();
                while(rs.next()){
                    String userID = rs.getString("userID");
                    String studentName = rs.getString("studentName");
                    wallet = new WalletDTO(userID, studentName);
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
    
    public WalletDTO getWalletByWalletID(String id) throws SQLException{
        WalletDTO wallet = null;
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT walletID, userID, walletName, balance, walletPoint, walletStatus, rewardID"
                        + " FROM tblWallet"
                        + " WHERE walletID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
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
    
    public boolean updateWalletFiveInfo(WalletDTO wallet) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                String sql ="UPDATE tblWallet"
                        + " SET userID =?, walletName=?, walletPoint=?, walletStatus=?"
                        + " WHERE walletID=?";
                stm=conn.prepareStatement(sql);
                
                stm.setString(1, wallet.getUserID());
                stm.setString(2, wallet.getWalletName());
                stm.setInt(3, wallet.getWalletPoint());
                stm.setBoolean(4, wallet.isWalletStatus());
                stm.setString(5, wallet.getWalletID());
                
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
    
    public boolean insertWallet(WalletDTO wallet) throws SQLException, ClassNotFoundException{
        boolean check = false;
        float temp = 1;
        try {
            conn=DBUtil.getConnection();
            if(conn!=null){
                String sql ="INSERT INTO tblWallet(walletID, userID, walletName, balance, walletPoint, walletStatus)"
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, wallet.getWalletID());
                stm.setString(2, wallet.getUserID());
                stm.setString(3, wallet.getWalletName());
                stm.setFloat(4, temp);
                stm.setInt(5, wallet.getWalletPoint());
                stm.setBoolean(6, check);
                check = stm.executeUpdate()>0;
            }
        }catch(Exception ex){
            ex.printStackTrace();
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
    
    public boolean removeWallet(String id) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                String sql ="UPDATE tblWallet"
                        + " SET walletStatus=?"
                        + " WHERE walletID=?";
                stm=conn.prepareStatement(sql);
                stm.setBoolean(1, check);
                stm.setNString(2, id);
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
