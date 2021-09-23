/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.javaguides.springboot.controller;

import java.util.List;
import net.javaguides.springboot.model.User;
import net.javaguides.springboot.respository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author pphuh
 */

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("api/")
public class UserController {
    
    @Autowired
    private UserRepository userRepository;
    
    @GetMapping("users")
    public List<User> getUsers(){
        return this.userRepository.findAll();
    }
}
