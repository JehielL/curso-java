package com.bitebooking.controller;

import com.bitebooking.model.Menu;
import com.bitebooking.model.Restaurant;
import com.bitebooking.repository.MenuRepository;
import com.bitebooking.repository.RestaurantRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@AllArgsConstructor
@Slf4j
public class RestaurantController {

    private RestaurantRepository restRepo;

    @GetMapping("restaurants")
    public List<Restaurant> findAll(){
        return this.restRepo.findAll();
    }



}