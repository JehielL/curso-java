import { HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-user-form',
  standalone: true,
  imports: [ReactiveFormsModule, HttpClientModule, RouterLink],
  templateUrl: './user-form.component.html',
  styleUrl: './user-form.component.css'
})
export class UserFormComponent {


  onFileChange($event: Event) {
throw new Error('Method not implemented.');
}


  userForm = new FormGroup({

    name: new FormControl<string>(''),
    lastname: new FormControl<string>(''),
    email: new FormControl<string>(''),
    password: new FormControl<string>(''),
    phone: new FormControl<string>(''),
    address: new FormControl<string>(''),
    city: new FormControl<string>(''),
    imgUser: new FormControl<string>(''),

  });
    

}
