import { Component, OnInit } from '@angular/core';
import { Booking } from '../model/booking.model';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-booking-detail',
  standalone: true,
  imports: [HttpClientModule],
  templateUrl: './booking-detail.component.html',
  styleUrl: './booking-detail.component.css'
})
export class BookingDetailComponent implements OnInit {

  booking: Booking | undefined

  constructor(
    private activatedRoute: ActivatedRoute,
    private httpClient: HttpClient
  ) { }


  ngOnInit(): void {

    this.activatedRoute.params.subscribe(params => {
      const id = params['id'];

      if (!id) return;

      const url = 'http://localhost:8080/bookings/' + id;

      this.httpClient.get<Booking>(url).subscribe(b => this.booking = b);


    });

  }

}
