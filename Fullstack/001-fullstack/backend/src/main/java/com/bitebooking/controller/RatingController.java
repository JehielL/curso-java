package com.bitebooking.controller;

import com.bitebooking.model.Booking;
import com.bitebooking.model.Menu;
import com.bitebooking.model.Rating;
import com.bitebooking.repository.BookingRepository;
import com.bitebooking.repository.RatingRepository;
import com.bitebooking.security.SecurityUtils;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@CrossOrigin("*")
@RestController
@AllArgsConstructor
@Slf4j

public class RatingController {

    private final RatingRepository ratingRepository;



    @GetMapping("ratings/{id}")
    public Rating findById(@PathVariable Long id) {

        return this.ratingRepository.findById(id).orElseThrow();
    }
    @GetMapping("menus/filter-by-menu/{id}")
    public List<Rating> findAllByMenuId(@PathVariable Long id){
        return this.ratingRepository.findByMenu_IdOrderByIdDesc(id);
    }


    @PostMapping("ratings")
    public Rating create(@RequestBody Rating rating) {

        SecurityUtils.getCurrentUser().ifPresent(user -> rating.setUser(user));
        return this.ratingRepository.save(rating);
    }

    @PutMapping("ratings/{id}")
    public Rating update(@PathVariable Long id, @RequestBody Rating rating) {
        if (this.ratingRepository.existsById(id))
            return this.ratingRepository.save(rating);

        throw new NoSuchElementException();

    }

    @DeleteMapping("ratings/{id}")
    public void deleteById(@PathVariable Long id){

        this.ratingRepository.deleteById(id);
    }

}
