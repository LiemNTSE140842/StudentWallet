/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.user;

import java.sql.Timestamp;

/**
 *
 * @author pphuh
 */
public class UserDTO {
    private String userID;
    private String universityID;
    private String studentName;
    private String email;
    private String image;
    private String roleID;
    private String statusID;
    private Timestamp createDate;
    private int age;
    private String gender;

    public UserDTO() {
    }

    public UserDTO(String userID, String studentName, String roleID, String statusID) {
        this.userID = userID;
        this.studentName = studentName;
        this.roleID = roleID;
        this.statusID = statusID;
    }
    
    public UserDTO(String userID, String universityID, String studentName, String roleID, String statusID) {
        this.userID = userID;
        this.universityID = universityID;
        this.studentName = studentName;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public UserDTO(String universityID, String studentName, String email, String statusID, int age, String gender) {
        this.universityID = universityID;
        this.studentName = studentName;
        this.email = email;
        this.statusID = statusID;
        this.age = age;
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUniversityID() {
        return universityID;
    }

    public void setUniversityID(String universityID) {
        this.universityID = universityID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", universityID=" + universityID + ", studentName=" + studentName + ", email=" + email + ", roleID=" + roleID + ", statusID=" + statusID + '}';
    }
    
}
