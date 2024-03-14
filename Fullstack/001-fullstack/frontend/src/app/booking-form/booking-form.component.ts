import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { Booking } from '../model/booking.model';
import { ActivatedRoute, Router } from '@angular/router';

import { Menu } from '../model/menu.model';
import { Restaurant } from '../model/restaurant.model';


@Component({
  selector: 'app-booking-form',
  standalone: true,
  imports: [ReactiveFormsModule, HttpClientModule],
  templateUrl: './booking-form.component.html',
  styleUrl: './booking-form.component.css'
})
export class BookingFormComponent implements OnInit {

 /* bookingForm = this.fb.group({
    id: [0],
    title: [''],
    numTable: [0.0],
    menu: this.fb.group({
      id: [0],
      title: [''],
      category: [''],
      active: [false]
    })
  });*/

  bookingForm = new FormGroup({
    id: new FormControl<number>(0),
    title: new FormControl<string>(''),
    status: new FormControl<boolean>(true),
    numTable: new FormControl<number>(0),
    createDate: new FormControl<Date>(new Date()),  
    menu: new FormControl(),
    restaurant: new FormControl()
  });

  



  isUpdate: boolean = false; // por defecto estamos en CREAR no en ACTUALIZAR
  menus: Menu[] = []; // array de autores para asociar un autor al libro
  restaurants: Restaurant[] = [];

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
    this.httpClient.get<Restaurant[]>('http://localhost:8080/restaurants')
      .subscribe(restaurants => this.restaurants = restaurants);

    this.activatedRoute.params.subscribe(params => {
      
      const id = params['id'];
      if (!id) return;

      this.httpClient.get<Booking>('http://localhost:8080/bookings/' + id).subscribe(bookingFromBackend => {
        // cargar el libro obtenido en el formulario bookForm
        this.bookingForm.reset({
          id: bookingFromBackend.id,
          title: bookingFromBackend.title,
          status: bookingFromBackend.status,
          numTable: bookingFromBackend.numTable,
          createDate: bookingFromBackend.createDate,
          menu: bookingFromBackend.menu,
          restaurant: bookingFromBackend.restaurant,
      
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

  compareObjects(o1: any, o2: any): boolean{

    if (o1 && o2){
      return o1.id == o2.id;
    }

    return o1 == o2;
  }


}