/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.university;

/**
 *
 * @author pphuh
 */
public class UniversityDTO {
    private String universityID;
    private String universityName;
    private String address;
    private String phoneNumber;
    private String email;

    public UniversityDTO() {
    }

    public UniversityDTO(String universityID, String universityName, String address, String phoneNumber, String email) {
        this.universityID = universityID;
        this.universityName = universityName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public String getUniversityID() {
        return universityID;
    }

    public void setUniversityID(String universityID) {
        this.universityID = universityID;
    }

    public String getUniversityName() {
        return universityName;
    }

    public void setUniversityName(String universityName) {
        this.universityName = universityName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
