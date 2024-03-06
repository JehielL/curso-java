import { Component } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { Booking } from '../../interfaces/booking.model';
import { HttpClient, HttpClientModule } from '@angular/common/http';

@Component({
  selector: 'app-booking-form',
  standalone: true,
  imports: [ReactiveFormsModule, HttpClientModule],
  templateUrl: './booking-form.component.html',
  styleUrl: './booking-form.component.css'
})
export class BookingFormComponent {

  bookingForm = this.fb.group({

    id: [0],
    title: ["string"],
    price: [0.0],
    description: ["description"],
    category: [],
    topics: [[]],
    available: [false]
  });

  constructor(private fb: FormBuilder, private httpClient: HttpClient){}

  save(){

    console.log("Guardando book");

    const id = this.bookingForm.get('id')?.value ?? 0;
    const title = this.bookingForm.get('title')?.value ?? 'titulo por defecto';
    const price = this.bookingForm.get('price')?.value ?? 0.0;
    const description = this.bookingForm.get('description')?.value ?? 'Descripcion por defecto';
    const category = this.bookingForm.get('category')?.value ?? 'Categoria por defecto';
    const topics = this.bookingForm.get('topics')?.value ?? [];
    const available = this.bookingForm.get('available')?.value ?? false;
    



    // Crear un objeto utilizando los valores extraidos

    const bookingToSave: Booking ={

      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      topics: topics,
      available: available,

    }

    console.log(bookingToSave)

    const url = 'http://localhost:8080/bookings';

    this.httpClient.post<Booking>(url, bookingToSave).subscribe(booking => console.log(booking))

    
  }


}
