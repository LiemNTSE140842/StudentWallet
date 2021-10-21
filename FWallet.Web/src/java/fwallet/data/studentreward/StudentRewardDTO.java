/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.studentreward;

import java.sql.Timestamp;

/**
 *
 * @author pphuh
 */
public class StudentRewardDTO {
    private String studentRewardID;
    private String studentID;
    private String rewardID;
    private boolean studentRewardStatus;
    private Timestamp createDate;
    private Short usedDate;
    private String email;
    private int rewardPoint;
    
    public StudentRewardDTO() {
    }

    public StudentRewardDTO(String studentRewardID, String studentID, String rewardID, int rewardPoint) {
        this.studentRewardID = studentRewardID;
        this.studentID = studentID;
        this.rewardID = rewardID;
        this.rewardPoint = rewardPoint;
    }
    
    public StudentRewardDTO(String studentRewardID, String studentID, String rewardID, boolean studentRewardStatus) {
        this.studentRewardID = studentRewardID;
        this.studentID = studentID;
        this.rewardID = rewardID;
        this.studentRewardStatus = studentRewardStatus;
    }

    public StudentRewardDTO(String studentRewardID, String studentID, String rewardID, boolean studentRewardStatus, String email) {
        this.studentRewardID = studentRewardID;
        this.studentID = studentID;
        this.rewardID = rewardID;
        this.studentRewardStatus = studentRewardStatus;
        this.email = email;
    }

    public StudentRewardDTO(String studentRewardID, String studentID, String rewardID, boolean studentRewardStatus, Timestamp createDate) {
        this.studentRewardID = studentRewardID;
        this.studentID = studentID;
        this.rewardID = rewardID;
        this.studentRewardStatus = studentRewardStatus;
        this.createDate = createDate;
    }

    public int getRewardPoint() {
        return rewardPoint;
    }

    public void setRewardPoint(int rewardPoint) {
        this.rewardPoint = rewardPoint;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getStudentRewardID() {
        return studentRewardID;
    }

    public void setStudentRewardID(String studentRewardID) {
        this.studentRewardID = studentRewardID;
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

    public boolean isStudentRewardStatus() {
        return studentRewardStatus;
    }

    public void setStudentRewardStatus(boolean studentRewardStatus) {
        this.studentRewardStatus = studentRewardStatus;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public Short getUsedDate() {
        return usedDate;
    }

    public void setUsedDate(Short usedDate) {
        this.usedDate = usedDate;
    }
    
}
