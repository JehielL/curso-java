import { Component, OnInit } from '@angular/core';
import { Restaurant } from '../model/restaurant.model';
import { Booking } from '../model/booking.model';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-restaurant-detail',
  standalone: true,
  imports: [ RouterLink, DatePipe ],
  templateUrl: './restaurant-detail.component.html',
  styleUrl: './restaurant-detail.component.css'
})
export class RestaurantDetailComponent implements OnInit {

  restaurant: Restaurant | undefined
  bookings: Booking[] = [];

  constructor(
    private httpClient: HttpClient,
    private activedRoute: ActivatedRoute
  ) { }

  ngOnInit() {

    this.activedRoute.params.subscribe(params => {

      const id = params['id'];
      
      if (!id){
        return;
      }
    
    this.httpClient.get<Restaurant>('http://localhost:8080/restaurants/' + id)
    .subscribe(restaurants => this.restaurant = restaurants);

    this.httpClient.get<Booking[]>('http://localhost:8080/bookings/filter-by-restaurant/' + id)
    .subscribe(bookings => this.bookings = bookings);

  });
}

 

}
