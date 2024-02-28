import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Booking } from '../../interfaces/booking.model';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-booking-list',
  standalone: true,
  imports: [HttpClientModule, RouterLink],
  templateUrl: './booking-list.component.html',
  styleUrl: './booking-list.component.css'
})
export class BookingListComponent implements OnInit {

  bookings: Booking[] = [];
  
  constructor(private http: HttpClient){}

  ngOnInit(): void {
    
    let url = 'https://fakestoreapi.com/products';
    this.http.get<Booking[]>(url).subscribe(bookings => this.bookings = bookings);
  }

}
