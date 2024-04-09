package com.bitebooking;

import com.bitebooking.model.*;
import com.bitebooking.repository.*;
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
		RatingRepository ratingRepository = context.getBean(RatingRepository.class);

		// Borra todos los datos existentes en las tablas
		ratingRepository.deleteAll();

		repoBooking.deleteAll();
		restRepo.deleteAll();
		menuRepo.deleteAll();
		userRepo.deleteAll();


		// Crea y guarda un usuario primero
		User user1 = new User(null, "Jehiel linarez", "admin@admin.com", "admin1234", Role.ADMIN);
		User user2 = new User(null, "maria laura asuaje", "user@user.com", "user1234", Role.USER);

		userRepo.saveAll(List.of(user1, user2));

		// Crea y guarda los menús
		Menu menu1 = new Menu(null, "Omakase santoryu", "Japones","https://www.onlyyouhotels.com/content/imgsxml/galerias/panel_galeriarestauracion/1/1836.jpg", true, true, FoodType.AMERICAN_FOOD);
		Menu menu2 = new Menu(null, "Isakaya Fest", "Japones","https://d28dpoj42hxr8c.cloudfront.net/files/user/201803091609_12.jpg?v=1520579395", true, true, FoodType.DOMINICAN_FOOD);

		Menu menu3 = new Menu(null, "Mexican Night", "Mexicana","https://media.istockphoto.com/id/1414641728/photo/tacos-al-pastor-from-mexico.jpg?s=612x612&w=0&k=20&c=63ySV1BbYIL4vUAeexISGIw5shY4TzxCtVP9Z33mucM=", true, true, FoodType.TEX_MEX_FOOD);
		Menu menu4 = new Menu(null, "Brunch Madrileño", "Brunch","https://offloadmedia.feverup.com/madridsecreto.co/wp-content/uploads/2020/02/20104952/mejores-brunches-madrid-marieta.jpg", true, true, FoodType.SPAIN_FOOD);
		Menu menu5 = new Menu(null, "2 Worlds", "Fusion", "https://www.7canibales.com/wp-content/uploads/sites/2/2022/06/Nigiri-de-bogavante-1-400x296.jpg", true, true, FoodType.FUSION_FOOD);
		Menu menu6 = new Menu(null, "Toledo olvidado", "Española","https://regalaivancerdeño.es/wp-content/uploads/2023/01/Menu-Toledo-Olvidado.jpg", true, true, FoodType.SPAIN_FOOD);
		Menu menu7 = new Menu(null, "Vietnam Experiences", "Vietnamita","https://res.cloudinary.com/rainforest-cruises/images/c_fill,g_auto/f_auto,q_auto/w_1120,h_650/v1622728135/The-Best-Food-In-Vietnam-Pho/The-Best-Food-In-Vietnam-Pho.jpg", true, true, FoodType.VIETNAM_FOOD);
		Menu menu8 = new Menu(null, "GastroTap", "Fusion", "https://estaticos.esmadrid.com/cdn/farfuture/_Xjt0-7oPc_QhFzHnKMWUBGuG4z9AEpS2LsonR6wSHs/mtime:1646730092/sites/default/files/styles/content_type_full/public/recursosturisticos/restaurantes/jl1_1426675355.278.jpg?itok=AB5_23QG", true, true, FoodType.SPAIN_FOOD);
		Menu menu9 = new Menu(null, "Todos Santos", "Mixology","https://madriddiferente.com/wp-content/uploads/2022/01/SANTOS-Y-DESAMPARADOS-coctel-Dragon-amarillo.jpg", true, true, FoodType.BAR);
		Menu menu10 = new Menu(null, "Tropicalisimo", "Panameña","https://www.ongvoluntariado.org/wp-content/uploads/2020/02/Voluntariado-Panama-y-Guatemala.jpg", true, true, FoodType.LATIN_AMERICAN_FOOD);
		Menu menu11 = new Menu(null, "The last dance", "American", "https://estaticos-cdn.prensaiberica.es/clip/7a7956c4-d1d7-4fbb-8205-ca9a92d36318_16-9-discover-aspect-ratio_default_0.jpg", true, true, FoodType.AMERICAN_FOOD);
		Menu menu12 = new Menu(null, "Cuzco Rocks", "Peruana","https://res.cloudinary.com/rainforest-cruises/images/c_fill,g_auto/f_auto,q_auto/w_1120,h_732,c_fill,g_auto/v1625762943/Peruvian-Food-Main-Image/Peruvian-Food-Main-Image-1120x732.jpg", true, true, FoodType.PERUVIAN_FOOD);
		Menu menu13 = new Menu(null, "Hot pot Fest", "Zeshuan","https://eatandlovemadrid.es/files/wordpress/wp-content/uploads/2019/05/nunca-cocines.jpg", true, true, FoodType.SPAIN_FOOD);

		Menu menu14 = new Menu(null, "Empanadisima", "Argentina","https://i.blogs.es/0d79fc/captura-de-pantalla-2019-10-18-a-la-s-13.03.51/650_1200.png", true, true, FoodType.LATIN_AMERICAN_FOOD);
		Menu menu15 = new Menu(null, "Africa Roots", "Africana","https://res-2.cloudinary.com/hpwmsw17c/image/upload/q_auto/v1/ghost-blog-images/Exploring-the-Delicious-and-Diverse-World-of-African-Cuisine.jpg", true ,true, FoodType.AFRICAN_FOOD);
		Menu menu16 = new Menu(null, "Sweet Dreams", "Bakery", "https://www.texmexrestaurante.com/wp-content/uploads/go-x/u/c4ad8fa5-a099-4fdc-b1b9-ce7038d6d6dd/l0,t0,w1080,h1080/image-768x768.png", true, true, FoodType.BRUNCH);

		Menu menu17 = new Menu(null, "La de la abuela", "Mexicana","https://regalaivancerdeño.es/wp-content/uploads/2023/01/Menu-Toledo-Olvidado.jpg", true, true, FoodType.SPAIN_FOOD);
		Menu menu18 = new Menu(null, "Vietnam Experiences", "Vietnamita","https://res.cloudinary.com/rainforest-cruises/images/c_fill,g_auto/f_auto,q_auto/w_1120,h_650/v1622728135/The-Best-Food-In-Vietnam-Pho/The-Best-Food-In-Vietnam-Pho.jpg", true, true, FoodType.VIETNAM_FOOD);
		Menu menu19 = new Menu(null, "GastroTap", "Fusion", "https://estaticos.esmadrid.com/cdn/farfuture/_Xjt0-7oPc_QhFzHnKMWUBGuG4z9AEpS2LsonR6wSHs/mtime:1646730092/sites/default/files/styles/content_type_full/public/recursosturisticos/restaurantes/jl1_1426675355.278.jpg?itok=AB5_23QG", true, true, FoodType.FUSION_FOOD);
		Menu menu20 = new Menu(null, "Todos Santos", "Mixology","https://madriddiferente.com/wp-content/uploads/2022/01/SANTOS-Y-DESAMPARADOS-coctel-Dragon-amarillo.jpg", true, true, FoodType.BAR);
		Menu menu21 = new Menu(null, "Tropicalisimo", "Panameña","https://www.ongvoluntariado.org/wp-content/uploads/2020/02/Voluntariado-Panama-y-Guatemala.jpg", true, true, FoodType.DOMINICAN_FOOD);
		Menu menu22 = new Menu(null, "The last dance", "American", "https://estaticos-cdn.prensaiberica.es/clip/7a7956c4-d1d7-4fbb-8205-ca9a92d36318_16-9-discover-aspect-ratio_default_0.jpg", true, true, FoodType.AMERICAN_FOOD);
		menuRepo.saveAll(List.of(menu1, menu2, menu3, menu4, menu5, menu6, menu7, menu8, menu9, menu10, menu11, menu12, menu13, menu14, menu15, menu16, menu17, menu18,menu19, menu20,menu21, menu22));

		// Crea y guarda los restaurantes
		Restaurant restaurant1 = new Restaurant(null, "Maguro", "https://images.otstatic.com/prod/25860960/1/huge.jpg", true, LocalDate.now(), menu1);
		Restaurant restaurant2 = new Restaurant(null, "Salvaje", "https://media.timeout.com/images/105990663/image.jpg", true, LocalDate.now(), menu2);
		Restaurant restaurant3 = new Restaurant(null, "Zuma", "https://waldorfastoriamaldives.com/wp-content/uploads/2022/06/ZUMA-2_1920_ANNA_v2.jpg", true, LocalDate.now(), menu3);
		restRepo.saveAll(List.of(restaurant1, restaurant2, restaurant3));

		// Crea y guarda las reservas
		repoBooking.save(new Booking(null, LocalDateTime.now(), "Paco leon", 30.00, 2, "Sin alergias", true, 5.0, true, 4, 150.00, menu1, restaurant1, false, "Vallet parking", user1));
		repoBooking.save(new Booking(null, LocalDateTime.now(), "Lionel Messi", 90.00, 5, "Grupo Familiar", true, 10.0, true, 10, 250.00, menu2, restaurant2, false, "Bar incluido", user2));
		repoBooking.save(new Booking(null, LocalDateTime.now(), "Alberto chicote", 50.00, 3, "Despedida de soltero", true, 0.0, false, 120, null, menu3, restaurant3, false, "Ropero", user1));

		Rating rating1 = new Rating(null, 0, "Fenomenal",user1, menu4);
		Rating rating2 = new Rating(null, 2, "Fenomenal",user2, menu4);
		Rating rating3 = new Rating(null, 5, "Fenomenal",user1, menu4);
		ratingRepository.saveAll(List.of(rating1, rating2, rating3));
	}
}
