import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { User } from '../../interfaces/user.model';
import { HttpClient, HttpClientModule } from '@angular/common/http';


@Component({
  selector: 'app-user-list',
  standalone: true,
  imports: [RouterLink, HttpClientModule],
  templateUrl: './user-list.component.html',
  styleUrl: './user-list.component.css'
})
export class UserListComponent implements OnInit {

  users: User[] = [];
  
  constructor(private httpClient: HttpClient){}

  ngOnInit(): void {

    const backendUrl = 'https://fakestoreapi.com/users';
    this.httpClient.get<User[]>(backendUrl).subscribe(userBackend => {
      this.users = userBackend;
    });

    
    

  }

}
