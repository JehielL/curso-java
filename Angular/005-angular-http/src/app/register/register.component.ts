import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Register } from '../../interfaces/register.model';
import { RouterEvent, RouterLink } from '@angular/router';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [HttpClientModule, ReactiveFormsModule,RouterLink],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {

  // no necesita FormBuilder:
  registerForm = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email]),
    phone: new FormControl('', [Validators.required, Validators.pattern('^[0-9]{9}$')]),
    password: new FormControl('', [Validators.required, Validators.minLength(8), Validators.maxLength(30)]),
    passwordConfirm: new FormControl('', [Validators.required, Validators.minLength(8), Validators.maxLength(30)])
  },
    { validators: this.passwordConfirmValidator } // Validador personalizado que comprueba dos campos al mismo tiempo
  );

  constructor(private httpClient: HttpClient) { }

  passwordConfirmValidator(control: AbstractControl) {

    if (control.get('password')?.value === control.get('passwordConfirm')?.value) {
      return null;
    } else {

      return {
        'confirmError': true
      }
    }
  }

  save() {
    const register: Register = {
      email: this.registerForm.get('email')?.value ?? '',
      phone: this.registerForm.get('phone')?.value ?? '',
      password: this.registerForm.get('password')?.value ?? '',
      passwordConfirm: this.registerForm.get('passwordConfirm')?.value ?? '',
    }
    console.log(register);


    this.registerForm.reset();
  }



}