/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.university;

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
public class UniversityDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    
    public List<UniversityDTO> getAllUniversity() throws SQLException{
        List<UniversityDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT universityID, universityName, address, phoneNumber, email"
                        +" FROM tblUniversity";
                stm = conn.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    String universityID = rs.getString("universityID");
                    String universityName = rs.getString("universityName");
                    String address = rs.getString("address");
                    String phoneNumber = rs.getString("phoneNumber");
                    String email = rs.getString("email");
                    list.add(new UniversityDTO(universityID, universityName, address, phoneNumber, email));
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
