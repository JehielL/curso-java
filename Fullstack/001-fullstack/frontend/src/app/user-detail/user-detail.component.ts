import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { User } from '../model/user.model';

@Component({
  selector: 'app-user-detail',
  standalone: true,
  imports: [HttpClientModule, RouterLink],
  templateUrl: './user-detail.component.html',
  styleUrl: './user-detail.component.css'
})
export class UserDetailComponent implements OnInit {


  users: User[] = []; 

  constructor(private httpClient: HttpClient){}
  
  
  ngOnInit(): void {
    
    this.httpClient.get<User[]>('http:localhost:8080/users')
    .subscribe(users => this.users = users);
  }
}
