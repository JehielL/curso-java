import { Component, OnInit } from '@angular/core';
import { Booking } from '../model/booking.model';
import { HttpClient, HttpClientModule } from '@angular/common/http';

@Component({
  selector: 'app-booking-list',
  standalone: true,
  imports: [HttpClientModule],
  templateUrl: './booking-list.component.html',
  styleUrl: './booking-list.component.css'
})
export class BookingListComponent implements OnInit {
  
  bookings: Booking[] = [];
  
constructor(private httpClient: HttpClient){}

  ngOnInit(): void {

    const url = 'http://localhost:8080/bookings'

    this.httpClient.get<Booking[]>(url)
    .subscribe(bookings => this.bookings = bookings);
    
  }

  

}
