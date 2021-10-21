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
import java.util.ArrayList;
import java.util.List;

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
                stm.setString(2, "ni1");
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
    
    public List<UserDTO> getAllUser() throws SQLException{
        List<UserDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT universityID, studentName, age, gender, email, status"
                        +" FROM tblStudent";
                stm = conn.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    String uni = rs.getString("universityID");
                    String name = rs.getString("studentName");
                    int age = rs.getInt("age");
                    boolean gender = rs.getBoolean("gender");
                    String email = rs.getString("email");
                    String statusID = rs.getString("status");
                    list.add(new UserDTO(uni, name, email, statusID, age, gender));
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
    
    public List<UserDTO> getUserByEmail(String search) throws SQLException{
        List<UserDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT universityID, studentName, age, gender, email, status"
                        + " FROM tblStudent"
                        + " WHERE email like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String uni = rs.getString("universityID");
                    String name = rs.getString("studentName");
                    int age = rs.getInt("age");
                    boolean gender = rs.getBoolean("gender");
                    String email = rs.getString("email");
                    String statusID = rs.getString("status");
                    list.add(new UserDTO(uni, name, email, statusID, age, gender));
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
    
    public List<UserDTO> getDeletedUserByEmail(String search) throws SQLException{
        List<UserDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT universityID, studentName, age, gender, email, status"
                        + " FROM tblStudent"
                        + " WHERE status= 0 AND email like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String uni = rs.getString("universityID");
                    String name = rs.getString("studentName");
                    int age = rs.getInt("age");
                    boolean gender = rs.getBoolean("gender");
                    String email = rs.getString("email");
                    String statusID = rs.getString("status");
                    list.add(new UserDTO(uni, name, email, statusID, age, gender));
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
    
    public List<UserDTO> getActivatedUserByEmail(String search) throws SQLException{
        List<UserDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT universityID, studentName, age, gender, email, status"
                        + " FROM tblStudent"
                        + " WHERE status= 1 AND email like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String uni = rs.getString("universityID");
                    String name = rs.getString("studentName");
                    int age = rs.getInt("age");
                    boolean gender = rs.getBoolean("gender");
                    String email = rs.getString("email");
                    String statusID = rs.getString("status");
                    list.add(new UserDTO(uni, name, email, statusID, age, gender));
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
    
    public UserDTO getAUserByEmail(String search) throws SQLException{
        UserDTO user = null;
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT universityID, studentName, age, gender, address, email, status"
                        + " FROM tblStudent"
                        + " WHERE email like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String uni = rs.getString("universityID");
                    String name = rs.getString("studentName");
                    int age = rs.getInt("age");
                    boolean gender = rs.getBoolean("gender");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String statusID = rs.getString("status");
                    user = new UserDTO(uni, name, age, gender, address, email, statusID);
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
    
    public boolean insertNewUser(UserDTO user) throws SQLException, ClassNotFoundException{
        boolean check = false;
        boolean status = true;
        try {
            conn=DBUtil.getConnection();
            if(conn!=null){
                String sql ="INSERT INTO tblStudent(userID, universityID, studentName, age, gender, address, email, dateCreate, roleID, status)"
                        + " VALUES(?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getUniversityID());
                stm.setString(3, user.getStudentName());
                stm.setInt(4, user.getAge());
                stm.setBoolean(5, user.isGender());
                stm.setString(6, user.getAddress());
                stm.setString(7, user.getEmail());
                stm.setTimestamp(8, user.getCreateDate());
                stm.setString(9, "US");
                stm.setBoolean(10, status);
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
    
    public boolean updateAUser(UserDTO user, String oldEmail) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                boolean status = false;
                if(user.getStatusID().equals("1")){
                    status = true;
                }
                String sql ="UPDATE tblStudent"
                        + " SET universityID=?, studentName=?, age=?, gender=?, address=?, email=?, status=?"
                        + " WHERE email=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, user.getUniversityID());
                stm.setString(2, user.getStudentName());
                stm.setInt(3, user.getAge());
                stm.setBoolean(4, user.isGender());
                stm.setString(5, user.getAddress());
                stm.setString(6, user.getEmail());
                stm.setBoolean(7, status);
                stm.setString(8, oldEmail);
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
    
    public boolean removeUser(String email) throws SQLException{
        boolean check = false;
        boolean status = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                String sql ="UPDATE tblStudent"
                        + " SET status=?"
                        + " WHERE email=?";
                stm=conn.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setString(2, email);
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
