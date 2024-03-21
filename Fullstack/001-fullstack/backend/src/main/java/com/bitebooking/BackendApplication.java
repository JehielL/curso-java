package com.bitebooking;

import com.bitebooking.model.Booking;
import com.bitebooking.model.Menu;
import com.bitebooking.model.Restaurant;
import com.bitebooking.model.User;
import com.bitebooking.repository.BookingRepository;
import com.bitebooking.repository.MenuRepository;
import com.bitebooking.repository.RestaurantRepository;
import com.bitebooking.repository.UserRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@SpringBootApplication
public class BackendApplication {

	public static void main(String[] args) {


		ApplicationContext context = SpringApplication.run(BackendApplication.class, args);
		BookingRepository repoBooking = context.getBean(BookingRepository.class);
		MenuRepository menuRepo = context.getBean(MenuRepository.class);
		RestaurantRepository restRepo = context.getBean(RestaurantRepository.class);
		UserRepository userRepo = context.getBean(UserRepository.class);

		// Borra todos los datos existentes en las tablas
		repoBooking.deleteAll();
		restRepo.deleteAll();
		menuRepo.deleteAll();
		userRepo.deleteAll();

		// Crea y guarda un usuario primero
		User user1 = new User(null, "Gustavo", "Cerati", "gussi@soda.com", "fuerzanatural", "23232323", "Calle de las cabras", "Buenos Aires", "https://www.lanacion.com.ar/resizer/v2/3E7EBSQO4VBH5BR7BWMXHEOX2I.jpg?auth=a84def6e7c459cd940de44657d9ebdaab7e12bd41aae20b540182d11317b9ef8&width=420&height=630&quality=70&smart=true");
		userRepo.save(user1);

		// Crea y guarda los menús
		Menu menu1 = new Menu(null, "Omakase santoryu", "Japones","https://www.onlyyouhotels.com/content/imgsxml/galerias/panel_galeriarestauracion/1/1836.jpg", true);
		Menu menu2 = new Menu(null, "Isakaya Fest", "Japones","https://d28dpoj42hxr8c.cloudfront.net/files/user/201803091609_12.jpg?v=1520579395", true);
		Menu menu3 = new Menu(null, "2 Worlds", "Fusion", "https://www.7canibales.com/wp-content/uploads/sites/2/2022/06/Nigiri-de-bogavante-1-400x296.jpg", true);
		menuRepo.saveAll(List.of(menu1, menu2, menu3));

		// Crea y guarda los restaurantes
		Restaurant restaurant1 = new Restaurant(null, "Maguro", "https://images.otstatic.com/prod/25860960/1/huge.jpg", true, LocalDate.now(), menu1);
		Restaurant restaurant2 = new Restaurant(null, "Salvaje", "https://media.timeout.com/images/105990663/image.jpg", true, LocalDate.now(), menu2);
		Restaurant restaurant3 = new Restaurant(null, "Zuma", "https://waldorfastoriamaldives.com/wp-content/uploads/2022/06/ZUMA-2_1920_ANNA_v2.jpg", true, LocalDate.now(), menu3);
		restRepo.saveAll(List.of(restaurant1, restaurant2, restaurant3));

		// Crea y guarda las reservas
		repoBooking.save(new Booking(null, LocalDateTime.now(), "Paco leon", 30.00, 2, "Sin alergias", true, 5.0, true, 4, 150.00, menu1, restaurant1, false, "Vallet parking", user1));
		repoBooking.save(new Booking(null, LocalDateTime.now(), "Lionel Messi", 90.00, 5, "Grupo Familiar", true, 10.0, true, 10, 250.00, menu2, restaurant2, false, "Bar incluido", user1));
		repoBooking.save(new Booking(null, LocalDateTime.now(), "Alberto chicote", 50.00, 3, "Despedida de soltero", true, 0.0, false, 120, null, menu3, restaurant3, false, "Ropero", user1));
	}
}
