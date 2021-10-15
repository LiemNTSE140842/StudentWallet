/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.studentreward;

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
public class StudentRewardDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    public List<StudentRewardDTO> getAllProduct() throws SQLException{
        List<StudentRewardDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT studentRewardID, studentID, rewardID, studentRewardStatus"
                        +" FROM StudentReward";
                stm = conn.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    String studentRewardID = rs.getString("studentRewardID");
                    String studentID = rs.getString("studentID");
                    String rewardID = rs.getString("rewardID");
                    boolean studentRewardStatus = rs.getBoolean("studentRewardStatus");
                    list.add(new StudentRewardDTO(studentRewardID, studentID, rewardID, studentRewardStatus));
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
    
    public List<StudentRewardDTO> getStudentRewardByEmail(String search) throws SQLException{
        List<StudentRewardDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT studentRewardID, StudentReward.studentID, StudentReward.rewardID, studentRewardStatus, email, tblReward.rewardName"
                        +" FROM StudentReward"
                        +" INNER JOIN tblStudent ON StudentReward.studentID = tblStudent.userID"
                        +" INNER JOIN tblReward ON StudentReward.rewardID = tblReward.rewardID"
                        + " WHERE email like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String studentRewardID = rs.getString("studentRewardID");
                    String studentID = rs.getString("studentID");
                    String rewardID = rs.getString("rewardID");
                    boolean studentRewardStatus = rs.getBoolean("studentRewardStatus");
                    String email = rs.getString("email");
                    String rewardName = rs.getString("rewardName");
                    list.add(new StudentRewardDTO(studentRewardID, studentID, rewardID, studentRewardStatus, email));
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
