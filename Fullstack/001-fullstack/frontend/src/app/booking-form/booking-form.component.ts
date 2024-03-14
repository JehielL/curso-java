import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { Booking } from '../model/booking.model';
import { ActivatedRoute, Router } from '@angular/router';

import { Menu } from '../model/menu.model';


@Component({
  selector: 'app-booking-form',
  standalone: true,
  imports: [ReactiveFormsModule, HttpClientModule],
  templateUrl: './booking-form.component.html',
  styleUrl: './booking-form.component.css'
})
export class BookingFormComponent implements OnInit {

  bookingForm = this.fb.group({
    id: [0],
    title: [''],
    numTable: [0.0],
    menu: this.fb.group({
      id: [0],
      title: [''],
      category: [''],
      active: [false]
    })
  });

  isUpdate: boolean = false; // por defecto estamos en CREAR no en ACTUALIZAR
  menus: Menu[] = []; // array de autores para asociar un autor al libro

  constructor(
    private fb: FormBuilder,
    private httpClient: HttpClient,
    private router: Router,
    private activatedRoute: ActivatedRoute) {
  }

  ngOnInit(): void {
    // cargar autores de backend para el selector de autores en el formulario
    this.httpClient.get<Menu[]>('http://localhost:8080/menus')
      .subscribe(menus => this.menus = menus);

    this.activatedRoute.params.subscribe(params => {
      const id = params['id'];
      if (!id) return;

      this.httpClient.get<Booking>('http://localhost:8080/bookings/' + id).subscribe(bookingFromBackend => {
        // cargar el libro obtenido en el formulario bookForm
        this.bookingForm.reset({
          id: bookingFromBackend.id,
          title: bookingFromBackend.title,
          numTable: bookingFromBackend.numTable,
          menu: bookingFromBackend.menu

        });

        // marcar boolean true isUpdate
        this.isUpdate = true;

      });
    });
  }

  save() {
    const booking: Booking = this.bookingForm.value as Booking;

    if (this.isUpdate) {
      const url = 'http://localhost:8080/bookings/' + booking.id;
      this.httpClient.put<Booking>(url, booking).subscribe(bookFromBackend => {
        this.router.navigate(['/bookings', bookFromBackend.id, 'detail']);
      });

    } else {
      const url = 'http://localhost:8080/bookings';
      this.httpClient.post<Booking>(url, booking).subscribe(bookFromBackend => {
        this.router.navigate(['/bookings', bookFromBackend.id, 'detail']);
      });
    }
  }


}