/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.channel;

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
public class ChannelDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    public List<ChannelDTO> getChannelByName(String search) throws SQLException{
        List<ChannelDTO> list = new ArrayList<ChannelDTO>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
//                Sửa lại channelID thì không được, nhưng channeID bỏ "l" thì lại chạy được
                String sql = "SELECT channeID, channelName, channelOffice, channelPhone"
                        +" FROM tblChannel"
                        + " WHERE channelName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String channeID = rs.getString("channeID");
                    String channelName = rs.getString("channelName");
                    String channelOffice = rs.getString("channelOffice");
                    String channelPhone = rs.getString("channelPhone");
                    list.add(new ChannelDTO(channeID, channelName, channelOffice, channelPhone));
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
    
    public ChannelDTO getRewardByID(String ID) throws SQLException{
        ChannelDTO channel = new ChannelDTO();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT channeID, channelName, channelOffice, channelPhone"
                        +" FROM tblChannel"
                        + " WHERE channeID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ID);
                rs=stm.executeQuery();
                while(rs.next()){
                    String channeID = rs.getString("channeID");
                    String channelName = rs.getString("channelName");
                    String channelOffice = rs.getString("channelOffice");
                    String channelPhone = rs.getString("channelPhone");
                    channel = new ChannelDTO(channeID, channelName, channelOffice, channelPhone);
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
        return channel;
    }
    
    public boolean updateChannel(ChannelDTO channel) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                boolean status = false;
                String sql ="UPDATE tblChannel"
                        + " SET channelName=?, channelOffice=?, channelPhone=?"
                        + " WHERE channeID= ?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, channel.getChannelName());
                stm.setString(2, channel.getChannelOffice());
                stm.setString(3, channel.getChannelPhone());
                stm.setString(4, channel.getChannelID());
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
    
    public boolean removeChannel(String ID) throws SQLException{
        boolean check = false;
        boolean status = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                String sql ="DELETE FROM tblChannel"
                        + " WHERE channeID=?";
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