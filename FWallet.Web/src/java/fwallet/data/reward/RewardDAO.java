/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.reward;

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
public class RewardDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    
    public List<RewardDTO> getAllReward() throws SQLException{
        List<RewardDTO> list = new ArrayList<RewardDTO>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT rewardID, rewardName, rewardPoint, description"
                        +" FROM tblReward";
                stm = conn.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    String rewardID = rs.getString("rewardID");
                    String rewardName = rs.getString("rewardName");
//                    int age = rs.getInt("rewardPoint");
                    String description = rs.getString("description");
                    list.add(new RewardDTO(rewardID, rewardName, description));
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
    
    public List<RewardDTO> getRewardByName(String search) throws SQLException{
        List<RewardDTO> list = new ArrayList<RewardDTO>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT rewardID, rewardName, rewardPoint, description"
                        +" FROM tblReward"
                        + " WHERE rewardName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String rewardID = rs.getString("rewardID");
                    String rewardName = rs.getString("rewardName");
                    int rewardPoint = rs.getInt("rewardPoint");
                    String description = rs.getString("description");
                    list.add(new RewardDTO(rewardID, rewardName, rewardPoint, description));
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
    
    public RewardDTO getRewardByID(String ID) throws SQLException{
        RewardDTO reward = new RewardDTO();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT rewardID, rewardName, rewardPoint, description"
                        +" FROM tblReward"
                        + " WHERE rewardID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ID);
                rs=stm.executeQuery();
                while(rs.next()){
                    String rewardID = rs.getString("rewardID");
                    String rewardName = rs.getString("rewardName");
                    int rewardPoint = rs.getInt("rewardPoint");
                    String description = rs.getString("description");
                    reward = new RewardDTO(rewardID, rewardName, rewardPoint, description);
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
        return reward;
    }
    public boolean updateReward(RewardDTO reward) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                boolean status = false;
                String sql ="UPDATE tblReward"
                        + " SET rewardName=?, rewardPoint=?, description=?"
                        + " WHERE rewardID=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, reward.getRewardName());
                stm.setInt(2, reward.getRewardPoint());
                stm.setString(3, reward.getDescription());
                stm.setString(4, reward.getRewardID());
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
    
    public boolean removeReward(String ID) throws SQLException{
        boolean check = false;
        boolean status = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                String sql ="DELETE FROM tblReward"
                        + " WHERE rewardID=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, ID);
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
