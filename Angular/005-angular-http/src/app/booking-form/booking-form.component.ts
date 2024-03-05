import { Component } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-booking-form',
  standalone: true,
  imports: [ReactiveFormsModule],
  templateUrl: './booking-form.component.html',
  styleUrl: './booking-form.component.css'
})
export class BookingFormComponent {

  bookingForm = this.fb.group({

    id: [0],
    title: ["string"],
    price: [0.0],
    description: ["description"],
    category: "Restaurant",
    image: "url",
    rating: null
  });

  constructor(private fb: FormBuilder){}

  save(){
    
  }


}
