import { Injectable } from '@angular/core';
import { jwtDecode } from 'jwt-decode';
import { BehaviorSubject } from 'rxjs';
import { DecodedToken } from './decoded.token.dto';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor() { } 

  isLoggedin = new BehaviorSubject<boolean>(this.existsToken());
  userEmail = new BehaviorSubject<string>(this.getUserEmail());



  saveToken(token: string) {

    localStorage.setItem('jwt_token', token);
    this.isLoggedin.next(true);
    this.userEmail.next(this.getUserEmail());
  }

  existsToken() {
    return localStorage.getItem('jwt_token') !== null;
  }

  removeToken() {

    localStorage.removeItem('jwt_token');
    this.isLoggedin.next(false);
    this.userEmail.next('');
  }

  getUserEmail() {
    const token =  localStorage.getItem('jwt_token');
    if(!token) return '';
    const decodedToken = jwtDecode(token) as DecodedToken;
    return decodedToken.email;
  }
}