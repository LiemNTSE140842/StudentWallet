/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.rewardtype;

import fwallet.data.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ThanhLiemPro
 */
public class RewardTypeDAO implements Serializable {

    Connection conn = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public List<RewardTypeDTO> getAllRewardID() throws SQLException {

        ArrayList<RewardTypeDTO> listRewardTypeID = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT rewardTypeID,rewardTypename "
                        + " FROM tblRewardType ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String rewardTypeID = rs.getString("rewardTypeID");
                    String rewardTypeName= rs.getString("rewardTypename");
                    listRewardTypeID.add(new RewardTypeDTO(rewardTypeID,rewardTypeName));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listRewardTypeID;
    }
}
