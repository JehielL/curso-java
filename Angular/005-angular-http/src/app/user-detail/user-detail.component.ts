import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { User } from '../../interfaces/user.model';
import { ActivatedRoute } from '@angular/router';
import { Cart } from '../../interfaces/cart.model';

@Component({
  selector: 'app-user-detail',
  standalone: true,
  imports: [HttpClientModule],
  templateUrl: './user-detail.component.html',
  styleUrl: './user-detail.component.css'
})
export class UserDetailComponent implements OnInit {

  user: User | undefined
  carts: Cart[] = [];

  constructor(
    private httpClient: HttpClient,
    private activatedRoute: ActivatedRoute
    
    ){}

  ngOnInit(): void {

    this.activatedRoute.params.subscribe(params => {

      const id = params['id'];
      const backendUrl = 'https://fakestoreapi.com/users/' + id;

      this.httpClient.get<User>(backendUrl).subscribe(userFromBackend =>{
        this.user = userFromBackend;

      });

      const cartUrl = 'https://fakestoreapi.com/carts/user/' + id;
      this.httpClient.get<Cart[]>(cartUrl).subscribe(cartsFromBackend =>{

        this.carts = cartsFromBackend;
      })
    })
    
  }

}
