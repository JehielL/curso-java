import { Injectable } from '@angular/core';
import { jwtDecode } from 'jwt-decode';
import { BehaviorSubject } from 'rxjs';

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
  }

  existsToken() {
    return localStorage.getItem('jwt_token') !== null;
  }

  removeToken() {

    localStorage.removeItem('jwt_token');
    this.isLoggedin.next(false);
  }

  getUserEmail() {
    const token =  localStorage.getItem('jwt_token');
    if(!token) return '';
    console.log(jwtDecode(token));
    return'';
  }
}