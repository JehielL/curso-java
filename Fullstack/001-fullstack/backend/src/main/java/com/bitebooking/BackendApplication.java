package com.bitebooking;

import com.bitebooking.model.Booking;
import com.bitebooking.model.Menu;
import com.bitebooking.repository.BookingRepository;
import com.bitebooking.repository.MenuRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.List;

@SpringBootApplication
public class BackendApplication {

	public static void main(String[] args) {

		ApplicationContext context = SpringApplication.run(BackendApplication.class, args);
		BookingRepository repo = context.getBean(BookingRepository.class);
		MenuRepository menuRepo = context.getBean(MenuRepository.class);

		repo.deleteAll();
		menuRepo.deleteAll();

		Menu menu1 = new Menu(null, "Omakase santoryu", "Japones", true);
		Menu menu2 = new Menu(null, "Isakaya Fest", "Japones", true);
		Menu menu3 = new Menu(null, "2 Worlds", "Fusion", true);

		menuRepo.saveAll(List.of(menu1, menu2, menu3));





		repo.save(new Booking(null, "Reserva Maria Laura Asuaje", 20.0, menu1));
		repo.save(new Booking(null, "Reserva Jehiel Linarez", 20.0, menu2));
		repo.save(new Booking(null, "Reserva Alan Sastre", 20.0, menu3));
	}

}
