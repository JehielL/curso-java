package com.bitebooking.repository;

import com.bitebooking.model.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuRepository extends JpaRepository<Menu, Long> {
    Menu findByTitle(String title);


}