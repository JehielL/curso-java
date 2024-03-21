package com.bitebooking.controller;

import com.bitebooking.model.Booking;
import com.bitebooking.model.User;
import com.bitebooking.repository.UserRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@AllArgsConstructor
@Slf4j
@RestController
public class UserController {

    private UserRepository userRepository;

    @GetMapping("users")
    public List<User> findAll(){
        return this.userRepository.findAll();
    }

    @GetMapping("users/{id}")
    public User findById(@PathVariable Long id) {

        return this.userRepository.findById(id).orElseThrow();
    }
    @PostMapping("users")
    public User create(@RequestBody User user) {
        return this.userRepository.save(user);
    }




}
