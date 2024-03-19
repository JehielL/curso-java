package com.bitebooking.controller;

import com.bitebooking.model.Booking;
import com.bitebooking.model.Menu;
import com.bitebooking.repository.MenuRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@AllArgsConstructor
@Slf4j
public class MenuController {

    private MenuRepository repo;

    @GetMapping("menus")
    public List<Menu> findAll(){
        return this.repo.findAll();
    }
    @GetMapping("menus/{id}")
    public Menu findById(@PathVariable Long id) {

        return this.repo.findById(id).orElseThrow();
    }

}
