/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.rewardtype;

/**
 *
 * @author ThanhLiemPro
 */
public class RewardTypeDTO {
    private String rewardTypeID;
    private String rewardTypeName;

    public RewardTypeDTO() {
    }

    public RewardTypeDTO(String rewardTypeID) {
        this.rewardTypeID = rewardTypeID;
    }

    public RewardTypeDTO(String rewardTypeID, String rewardTypeName) {
        this.rewardTypeID = rewardTypeID;
        this.rewardTypeName = rewardTypeName;
    }
    

  

    public String getRewardTypeID() {
        return rewardTypeID;
    }

    public void setRewardTypeID(String rewardTypeID) {
        this.rewardTypeID = rewardTypeID;
    }

    public String getRewardTypeName() {
        return rewardTypeName;
    }

    public void setRewardTypeName(String rewardTypeName) {
        this.rewardTypeName = rewardTypeName;
    }
    
}
