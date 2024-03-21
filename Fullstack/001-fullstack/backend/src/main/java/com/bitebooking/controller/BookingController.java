package com.bitebooking.controller;
import com.bitebooking.model.Booking;
import com.bitebooking.model.Restaurant;
import com.bitebooking.repository.BookingRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.NoSuchElementException;

@CrossOrigin("*")
@RestController
@AllArgsConstructor
@Slf4j

public class BookingController {

    private final BookingRepository repo;

    @GetMapping("bookings")
    public List<Booking> findAll() {
        log.info("REST request to findAll Bookings");

        return this.repo.findAll();
    }

    @GetMapping("bookings/{id}")
    public Booking findById(@PathVariable Long id) {

        return this.repo.findById(id).orElseThrow();
    }
    @GetMapping("bookings/filter-by-restaurant/{id}")
    public List<Booking> findAllByRestaurantId(@PathVariable Long id){
        return this.repo.findAllByRestaurant_Id(id);
    }
    @GetMapping("bookings/filter-by-user/{id}")
    public List<Booking> findAllByUserId(@PathVariable Long id){
        return this.repo.findAllByUser_Id(id);
    }

    @PostMapping("bookings")
    public Booking create(@RequestBody Booking booking) {
        return this.repo.save(booking);
    }

    @PutMapping("bookings/{id}")
    public Booking update(@PathVariable Long id, @RequestBody Booking booking) {
        if (this.repo.existsById(id))
            return this.repo.save(booking);

        throw new NoSuchElementException();

    }

    @DeleteMapping("bookings/{id}")
    public void deleteById(@PathVariable Long id){

        this.repo.deleteById(id);
    }
}
