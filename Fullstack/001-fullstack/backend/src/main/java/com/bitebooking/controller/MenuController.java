package com.bitebooking.controller;

import com.bitebooking.model.Menu;
import com.bitebooking.repository.MenuRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*") // Permitir acceso desde cualquier dominio desde el exterior
@RestController
@AllArgsConstructor
@Slf4j
public class MenuController {

    private MenuRepository repo;

    @GetMapping("menus")
    public List<Menu> findAll(){
        return this.repo.findAll();
    }



}
