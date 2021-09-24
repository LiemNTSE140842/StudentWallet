/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.user;

import fwallet.data.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
