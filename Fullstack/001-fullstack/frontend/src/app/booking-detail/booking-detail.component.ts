  import { Component, OnInit } from '@angular/core';
  import { Booking } from '../model/booking.model';
  import { HttpClient, HttpClientModule } from '@angular/common/http';
  import { ActivatedRoute, RouterLink } from '@angular/router';
  import { NgbAccordionModule, NgbAlert } from '@ng-bootstrap/ng-bootstrap';
import { DatePipe } from '@angular/common';

  @Component({
    selector: 'app-booking-detail',
    standalone: true,
    imports: [ NgbAccordionModule, RouterLink,DatePipe,NgbAlert],
    templateUrl: './booking-detail.component.html',
    styleUrl: './booking-detail.component.css',
    providers: [ActivatedRoute],
  })
  export class BookingDetailComponent implements OnInit {

    booking: Booking | undefined;
   
    showDeleteBookingMessage: boolean = false;
  
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
  
    delete(booking: Booking) {
      const url = 'http://localhost:8080/bookings/' + booking.id;
      this.httpClient.delete(url).subscribe(response => {
        this.booking = undefined;
        this.showDeleteBookingMessage = true;
      });
    }
  
  
  
    hideDeletedBookingMessage() {
      this.showDeleteBookingMessage = false;
    }
  
  }