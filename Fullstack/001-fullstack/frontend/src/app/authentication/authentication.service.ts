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
  isAdmin = new BehaviorSubject<boolean>(this.getIsAdmin());
  userId = new BehaviorSubject<number>(this.getUserId());



  saveToken(token: string) {

    localStorage.setItem('jwt_token', token);
    this.isLoggedin.next(true);
    this.userEmail.next(this.getUserEmail());
    this.isAdmin.next(this.getIsAdmin())
    this.userId.next(this.getUserId());
  }

  existsToken() {
    return localStorage.getItem('jwt_token') !== null;
  }

  removeToken() {

    localStorage.removeItem('jwt_token');
    this.isLoggedin.next(false);
    this.userEmail.next('');
    this.isAdmin.next(false);
    this.userId.next(0);
  }

  getUserEmail() {
    const token =  localStorage.getItem('jwt_token');
    if(!token) return '';
    const decodedToken = jwtDecode(token) as DecodedToken;
    return decodedToken.email;
  }

  getIsAdmin() { 
    const token = localStorage.getItem('jwt_token');
    if(!token) return false;
    const decodedToken = jwtDecode(token) as DecodedToken;
    return decodedToken.role === 'ADMIN'; 
  }

  getUserId() {
    const token = localStorage.getItem('jwt_token');
    if(!token) return 0;
    const decodedToken = jwtDecode(token) as DecodedToken;
    return parseInt(decodedToken.sub, 10);
  }
}