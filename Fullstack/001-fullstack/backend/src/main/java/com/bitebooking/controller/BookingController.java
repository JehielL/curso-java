package com.bitebooking.controller;

import com.bitebooking.model.Booking;
import com.bitebooking.repository.BookingRepository;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
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

public class BookingController {

    private final BookingRepository repo;

    @GetMapping("bookings")
    public List<Booking> findAll(){
        log.info("REST request to findAll Bookings");

        return this.repo.findAll();
    }

    @GetMapping("bookings/{id}")
    public Booking findById(@PathVariable Long id){

        return this.repo.findById(id).orElseThrow();
    }

}
