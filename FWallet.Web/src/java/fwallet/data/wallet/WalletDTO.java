/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.wallet;

/**
 *
 * @author pphuh
 */
public class WalletDTO {
    private String walletID;
    private String userID;
    private String walletName;
    private float balance;
    private int walletPoint;
    private boolean walletStatus;
    private String rewardID;

    public WalletDTO() {
    }

    public WalletDTO(String walletID, String userID, String walletName, float balance, int walletPoint, boolean walletStatus, String rewardID) {
        this.walletID = walletID;
        this.userID = userID;
        this.walletName = walletName;
        this.balance = balance;
        this.walletPoint = walletPoint;
        this.walletStatus = walletStatus;
        this.rewardID = rewardID;
    }

    public String getWalletID() {
        return walletID;
    }

    public void setWalletID(String walletID) {
        this.walletID = walletID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getWalletName() {
        return walletName;
    }

    public void setWalletName(String walletName) {
        this.walletName = walletName;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public int getWalletPoint() {
        return walletPoint;
    }

    public void setWalletPoint(int walletPoint) {
        this.walletPoint = walletPoint;
    }

    public boolean isWalletStatus() {
        return walletStatus;
    }

    public void setWalletStatus(boolean walletStatus) {
        this.walletStatus = walletStatus;
    }

    public String getRewardID() {
        return rewardID;
    }

    public void setRewardID(String rewardID) {
        this.rewardID = rewardID;
    }
    
}
