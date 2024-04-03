import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor() { }

  saveToken(token: string) {

    localStorage.setItem('jwt_token', token);
  }
}