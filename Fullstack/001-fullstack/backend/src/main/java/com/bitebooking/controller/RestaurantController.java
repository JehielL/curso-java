package com.bitebooking.controller;

import com.bitebooking.model.Menu;
import com.bitebooking.model.Restaurant;
import com.bitebooking.repository.MenuRepository;
import com.bitebooking.repository.RestaurantRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@AllArgsConstructor
@Slf4j
@RestController
public class RestaurantController {

    private RestaurantRepository restRepo;

    @GetMapping("restaurants")
    public List<Restaurant> findAll(){
        return this.restRepo.findAll();
    }

    @GetMapping("restaurants/{id}")
    public Restaurant findById(@PathVariable Long id) {

        return this.restRepo.findById(id).orElseThrow();
    }



}