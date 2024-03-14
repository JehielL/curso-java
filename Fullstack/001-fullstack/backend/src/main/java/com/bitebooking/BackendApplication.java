package com.bitebooking;

import com.bitebooking.model.Booking;
import com.bitebooking.model.Menu;
import com.bitebooking.model.Restaurant;
import com.bitebooking.repository.BookingRepository;
import com.bitebooking.repository.MenuRepository;
import com.bitebooking.repository.RestaurantRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.time.LocalDate;
import java.util.List;

@SpringBootApplication
public class BackendApplication {

	public static void main(String[] args) {

		ApplicationContext context = SpringApplication.run(BackendApplication.class, args);
		BookingRepository repo = context.getBean(BookingRepository.class);
		MenuRepository menuRepo = context.getBean(MenuRepository.class);
		RestaurantRepository restRepo = context.getBean(RestaurantRepository.class);

		repo.deleteAll();
		menuRepo.deleteAll();

		Menu menu1 = new Menu(null, "Omakase santoryu", "Japones", true);
		Menu menu2 = new Menu(null, "Isakaya Fest", "Japones", true);
		Menu menu3 = new Menu(null, "2 Worlds", "Fusion", true);

		menuRepo.saveAll(List.of(menu1, menu2, menu3));

		Restaurant restaurant1 = new Restaurant(null, "Maguro", "http", true, LocalDate.now(),menu1);
		Restaurant restaurant2 = new Restaurant(null, "Salvaje", "http", true, LocalDate.now(),menu2);
		Restaurant restaurant3 = new Restaurant(null, "Zuma", "http", true, LocalDate.now(),menu3);

		restRepo.saveAll(List.of(restaurant1, restaurant2, restaurant3));






		repo.save(new Booking(null, "Reserva Maria Laura Asuaje",true, 20.0, LocalDate.now(), menu1, restaurant1));
		repo.save(new Booking(null, "Reserva Jehiel Linarez",false, 20.0,LocalDate.now(), menu2,restaurant2));
		repo.save(new Booking(null, "Reserva Alan Sastre",true, 20.0,LocalDate.now(), menu3,restaurant3));




	}

}
