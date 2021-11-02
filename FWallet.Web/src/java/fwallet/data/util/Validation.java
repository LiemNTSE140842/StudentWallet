/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.util;

import fwallet.data.channel.ChannelDTO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ThanhLiemPro
 */
public class Validation {
     public static List<String> getCreateChannel(ChannelDTO channel) {
        List<String> errors = new ArrayList<>();
        if (channel.getChannelID().isEmpty()
                || channel.getChannelID().matches("^cn[/d{6}]$"))
        {
            errors.add("ChannelID can not be empty or fomat for ChannelID");
        }
        if (channel.getChannelName().isEmpty()
                || channel.getChannelName().length() > 20)
                {
            errors.add("ChannelName can not be empty or over 20 characters and must be number !");
        }
        
        if (channel.getChannelPhone().isEmpty()
                || channel.getChannelPhone().length() > 11
                || !channel.getChannelPhone().matches("[0-9]*")) {
            errors.add("Phone number of Channel Phone can not be empty or over 10 characters. And it must be number !");
        }
        return errors;
    }
    
}
