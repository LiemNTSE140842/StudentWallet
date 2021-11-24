/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.reward;

import java.sql.Timestamp;

/**
 *
 * @author pphuh
 */
public class RewardDTO {
    private String rewardID;
    private String channelID;
    private String rewardTypeID;
    private String rewardName;
    private int rewardPoint;
    private Timestamp rewardDate;
    private String description;
    private String rewardImage;
    private String studentID;

    public RewardDTO() {
    }

    public RewardDTO(String rewardID, String rewardName, String description) {
        this.rewardID = rewardID;
        this.rewardName = rewardName;
        this.description = description;
    }

    public RewardDTO(String rewardID, String rewardName, int rewardPoint, String description) {
        this.rewardID = rewardID;
        this.rewardName = rewardName;
        this.rewardPoint = rewardPoint;
        this.description = description;
    }

    public RewardDTO(String rewardID, String rewardName, int rewardPoint, String description, String studentID) {
        this.rewardID = rewardID;
        this.rewardName = rewardName;
        this.rewardPoint = rewardPoint;
        this.description = description;
        this.studentID = studentID;
    }

    public RewardDTO(String rewardID, String channelID, String rewardTypeID, String rewardName, int rewardPoint, Timestamp rewardDate, String description, String rewardImage, String studentID) {
        this.rewardID = rewardID;
        this.channelID = channelID;
        this.rewardTypeID = rewardTypeID;
        this.rewardName = rewardName;
        this.rewardPoint = rewardPoint;
        this.rewardDate = rewardDate;
        this.description = description;
        this.rewardImage = rewardImage;
        this.studentID = studentID;
    }

    public RewardDTO(String rewardID, String channelID, String rewardName, int rewardPoint, String description) {
        this.rewardID = rewardID;
        this.channelID = channelID;
        this.rewardName = rewardName;
        this.rewardPoint = rewardPoint;
        this.description = description;
    }
    

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getRewardID() {
        return rewardID;
    }

    public void setRewardID(String rewardID) {
        this.rewardID = rewardID;
    }

    public String getChannelID() {
        return channelID;
    }

    public void setChannelID(String channelID) {
        this.channelID = channelID;
    }

    public String getRewardTypeID() {
        return rewardTypeID;
    }

    public void setRewardTypeID(String rewardTypeID) {
        this.rewardTypeID = rewardTypeID;
    }

    public String getRewardName() {
        return rewardName;
    }

    public void setRewardName(String rewardName) {
        this.rewardName = rewardName;
    }

    public int getRewardPoint() {
        return rewardPoint;
    }

    public void setRewardPoint(int rewardPoint) {
        this.rewardPoint = rewardPoint;
    }

    public Timestamp getRewardDate() {
        return rewardDate;
    }

    public void setRewardDate(Timestamp rewardDate) {
        this.rewardDate = rewardDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRewardImage() {
        return rewardImage;
    }

    public void setRewardImage(String rewardImage) {
        this.rewardImage = rewardImage;
    }

    @Override
    public String toString() {
        return "RewardDTO{" + "rewardID=" + rewardID + ", channelID=" + channelID + ", rewardTypeID=" + rewardTypeID + ", rewardName=" + rewardName + ", rewardPoint=" + rewardPoint + ", rewardDate=" + rewardDate + ", description=" + description + ", rewardImage=" + rewardImage + ", studentID=" + studentID + '}';
    }

    
    
}
