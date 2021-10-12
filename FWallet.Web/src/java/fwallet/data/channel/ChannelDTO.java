/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.channel;

import java.sql.Timestamp;

/**
 *
 * @author pphuh
 */
public class ChannelDTO {
    private String channelID;
    private String channelName;
    private String channelOffice;
    private String channelPhone;
    private Timestamp channelStartDate;

    public ChannelDTO() {
    }

    public ChannelDTO(String channelID, String channelName, String channelOffice, String channelPhone) {
        this.channelID = channelID;
        this.channelName = channelName;
        this.channelOffice = channelOffice;
        this.channelPhone = channelPhone;
    }

    public ChannelDTO(String channelID, String channelName, String channelOffice, String channelPhone, Timestamp channelStartDate) {
        this.channelID = channelID;
        this.channelName = channelName;
        this.channelOffice = channelOffice;
        this.channelPhone = channelPhone;
        this.channelStartDate = channelStartDate;
    }

    public String getChannelID() {
        return channelID;
    }

    public void setChannelID(String channelID) {
        this.channelID = channelID;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public String getChannelOffice() {
        return channelOffice;
    }

    public void setChannelOffice(String channelOffice) {
        this.channelOffice = channelOffice;
    }

    public String getChannelPhone() {
        return channelPhone;
    }

    public void setChannelPhone(String channelPhone) {
        this.channelPhone = channelPhone;
    }

    public Timestamp getChannelStartDate() {
        return channelStartDate;
    }

    public void setChannelStartDate(Timestamp channelStartDate) {
        this.channelStartDate = channelStartDate;
    }
    
}
