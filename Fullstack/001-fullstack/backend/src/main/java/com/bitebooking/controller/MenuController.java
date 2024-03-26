package com.bitebooking.controller;

import com.bitebooking.model.Menu;
import com.bitebooking.repository.MenuRepository;
import com.bitebooking.services.FileService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
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

    private FileService fileService;

    private MenuRepository menuRepository;

    @GetMapping("menus")
    public List<Menu> findAll(){
        return this.menuRepository.findAll();
    }
    @GetMapping("menus/{id}")
    public Menu findById(@PathVariable Long id) {

        return this.menuRepository.findById(id).orElseThrow();
    }

    @PostMapping("menus")
    public Menu create(@RequestParam(value = "photo", required = false )MultipartFile file, Menu menu){

        if (file != null){
            String fileName = fileService.store(file);
            menu.setImgMenu(fileName);

        } else {
            menu.setImgMenu("avatar.png");
        }

        return this.menuRepository.save(menu);
    }

}
