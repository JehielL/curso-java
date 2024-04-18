package com.bitebooking.repository;

import com.bitebooking.model.Menu;
import com.bitebooking.model.Rating;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface RatingRepository extends JpaRepository<Rating, Long> {



    List<Rating> findByMenu_IdOrderByIdDesc(Long id);
    @Transactional
    @Modifying
    void deleteByMenuId(Long menuId);





}