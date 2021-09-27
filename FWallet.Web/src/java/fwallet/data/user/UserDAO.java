/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.user;

import fwallet.data.google.UserGoogleDTO;
import fwallet.data.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author pphuh
 */
public class UserDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    public UserDTO checkLogin(String userID, String uni) throws SQLException{
        UserDTO user = null;
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql= "SELECT studentName, roleID, status "
                        +" FROM tblStudent "
                        +" WHERE userID=? AND universityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, uni);
                rs = stm.executeQuery();
                if(rs.next()){
                    String name = rs.getString("studentName");
                    String roleID = rs.getString("roleID");
                    String statusID = rs.getString("status");
                    user = new UserDTO(userID, uni, name, roleID, statusID);
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
        return user;
    }
    
    public UserDTO checkLoginGmail(String userID) throws SQLException{
        UserDTO user =null;
        try {
            conn=DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT userID, studentName, roleID, status"
                        + " FROM tblStudent"
                        + " WHERE userID=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if(rs.next()){
                    String ID = rs.getString("userID");
                    String name = rs.getString("studentName");
                    String roleID = rs.getString("roleID");
                    String statusID = rs.getString("status");
                    user = new UserDTO(userID, name, roleID, statusID);
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
        return user;
    }
    
    public boolean updateGoogleUser(UserGoogleDTO user) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                String sql ="INSERT INTO tblStudent(userID, universityID, studentName, age, gender, address, email, dateCreate, roleID, status)"
                        + " VALUES(?,?,?,?,?,?,?,?,?,?)";
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                stm=conn.prepareStatement(sql);
                stm.setString(1, user.getId());
                stm.setString(2, "unregistered");
                stm.setString(3, "unregistered");
                stm.setInt(4, 26);
                stm.setBoolean(5, check);
                stm.setString(6, "unregistered");
                stm.setString(7, user.getEmail());
                stm.setTimestamp(8, timestamp);
                stm.setString(9, "US");
                stm.setBoolean(10, check);
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
