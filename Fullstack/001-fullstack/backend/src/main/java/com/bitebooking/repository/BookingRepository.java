package com.bitebooking.repository;

import com.bitebooking.model.Booking;
import com.bitebooking.model.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    Booking findByTitle(String title);


    List<Booking> findAllByRestaurant_Id(Long id);

    List<Booking> findAllByUser_Id(Long id);

}
