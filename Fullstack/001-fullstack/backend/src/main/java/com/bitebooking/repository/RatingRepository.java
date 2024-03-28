package com.bitebooking.repository;

import com.bitebooking.model.Menu;
import com.bitebooking.model.Rating;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RatingRepository extends JpaRepository<Rating, Long> {



    List<Menu> findAllByMenu_Id(Long id);
}