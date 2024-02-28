import { Component, OnInit } from '@angular/core';
import { Booking } from '../../interfaces/booking.model';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-booking-detail',
  standalone: true,
  imports: [HttpClientModule],
  templateUrl: './booking-detail.component.html',
  styleUrl: './booking-detail.component.css'
})
export class BookingDetailComponent implements OnInit{
  
  
  booking: Booking | undefined;

  constructor(
  
  private activatedRoute: ActivatedRoute,
  private http: HttpClient
  ){}
  
  ngOnInit(): void {
   
    this.activatedRoute.params.subscribe(params => {

      const id = params['id'];

      const backend = 'https://fakestoreapi.com/products/' + id;

      this.http.get<Booking>(backend).subscribe(booking => {
        console.log(this.booking);
        this.booking = booking;
      })

    })

    
  }

}
