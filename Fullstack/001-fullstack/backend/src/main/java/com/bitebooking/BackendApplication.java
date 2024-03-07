package com.bitebooking;

import com.bitebooking.model.Booking;
import com.bitebooking.repository.BookingRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class BackendApplication {

	public static void main(String[] args) {

		ApplicationContext context = SpringApplication.run(BackendApplication.class, args);
		BookingRepository repo = context.getBean(BookingRepository.class);

		repo.deleteAll();

		repo.save(new Booking(null, "Reserva Maria laura", 20.0));
	}

}
