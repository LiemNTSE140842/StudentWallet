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
}
