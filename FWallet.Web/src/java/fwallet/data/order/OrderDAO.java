/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.order;

import fwallet.data.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author pphuh
 */
public class OrderDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    public boolean insertOrder(OrderDTO order) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                boolean status = false;
                String sql ="INSERT INTO tblOrder(orderID,userID,productID,usedPoint,orderDate,orderStatus)"
                        + " VALUES(?,?,?,?,?,?)";
                stm=conn.prepareStatement(sql);
                stm.setString(1, order.getOrderID());
                stm.setString(2, order.getUserID());
                stm.setString(3, order.getProductID());
                stm.setInt(4, order.getUsedPoint());
                stm.setTimestamp(5, order.getOrderDate());
                stm.setString(6, order.getOrderStatus());
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
