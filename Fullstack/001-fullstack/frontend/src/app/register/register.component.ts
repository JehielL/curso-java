import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Register } from '../authentication/register.dto';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [HttpClientModule, ReactiveFormsModule, RouterLink],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {

  successMessage = false;
  errorMessage: string = '';
  // no necesita FormBuilder:
  registerForm = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email]),
    phone: new FormControl('', [Validators.required, Validators.pattern('^[0-9]{9}$')]),
    password: new FormControl('', [Validators.required, Validators.minLength(8), Validators.maxLength(30)]),
    passwordConfirm: new FormControl('', [Validators.required, Validators.minLength(8), Validators.maxLength(30)])
  },
  {validators: this.passwordConfirmValidator} // Validador personalizado que comprueba dos campos al mismo tiempo
  );

  constructor(private httpClient: HttpClient) {}

  passwordConfirmValidator(control: AbstractControl) {

    if (control.get('password')?.value === control.get('passwordConfirm')?.value) {
      return null; // las password coinciden por tanto no hay error devolvemos null
    } else {
      // las password no coinciden devolver un error:
      return {
        'confirmError': true
      }
    }
  }

  save() {
    const register: Register = {
      email: this.registerForm.get('email')?.value ?? '',
      //phone: this.registerForm.get('phone')?.value ?? '',
      password: this.registerForm.get('password')?.value ?? ''
    }
    

    this.httpClient.post('http://localhost:8080/users/register', register)
    .subscribe(response => {

      next: (response: any) => {
       
        this.registerForm.reset();
      
      }; error: (response: { error: any; }) => {
        this.errorMessage = response.error.message;
      }
      
    
      
    })

    
  }



}
