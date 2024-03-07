package com.bitebooking.controller;

import com.bitebooking.model.Booking;
import com.bitebooking.repository.BookingRepository;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
public class BookingController {

    private final BookingRepository repo;

    @GetMapping("bookings")
    public List<Booking> findAll(){

        return this.repo.findAll();
    }

}
