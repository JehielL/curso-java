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
		BookingRepository repoBooking = context.getBean(BookingRepository.class);
		MenuRepository menuRepo = context.getBean(MenuRepository.class);
		RestaurantRepository restRepo = context.getBean(RestaurantRepository.class);
		

		Menu menu1 = new Menu(null, "Omakase santoryu", "Japones", true);
		Menu menu2 = new Menu(null, "Isakaya Fest", "Japones", true);
		Menu menu3 = new Menu(null, "2 Worlds", "Fusion", true);

		menuRepo.saveAll(List.of(menu1, menu2, menu3));

		Restaurant restaurant1 = new Restaurant(null, "Maguro", "https://images.otstatic.com/prod/25860960/1/huge.jpg", true, LocalDate.now(),menu1);
		Restaurant restaurant2 = new Restaurant(null, "Salvaje", "https://media.timeout.com/images/105990663/image.jpg", true, LocalDate.now(),menu2);
		Restaurant restaurant3 = new Restaurant(null, "Zuma", "https://waldorfastoriamaldives.com/wp-content/uploads/2022/06/ZUMA-2_1920_ANNA_v2.jpg", true, LocalDate.now(),menu3);

		restRepo.saveAll(List.of(restaurant1, restaurant2, restaurant3));

<<<<<<< HEAD





		repoBooking.save(new Booking(null, "Maria Laura Asuaje",true, 20.0, LocalDate.now(), menu1, restaurant1));
		repoBooking.save(new Booking(null, "Jehiel Linarez",false, 20.0,LocalDate.now(), menu2,restaurant2));
		repoBooking.save(new Booking(null, "Alan Sastre",true, 20.0,LocalDate.now() , menu3,restaurant3));
=======
		repoBooking.save(new Booking(null, "Maria Laura Asuaje",true, 20.0, LocalDate.now(),"https://images.otstatic.com/prod/25860960/1/huge.jpg", menu1, restaurant1));
		repoBooking.save(new Booking(null, "Jehiel Linarez",false, 20.0,LocalDate.now(),"https://media.timeout.com/images/105990663/image.jpg" , menu2,restaurant2));
		repoBooking.save(new Booking(null, "Alan Sastre",true, 20.0,LocalDate.now(),"https://waldorfastoriamaldives.com/wp-content/uploads/2022/06/ZUMA-2_1920_ANNA_v2.jpg" , menu3,restaurant3));
>>>>>>> 5e628d731a7e89fa5c04833f8ac3850e3ff1654a




	}

}
