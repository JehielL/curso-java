import { Component } from '@angular/core';
import { Menu } from '../model/menu.model';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { DatePipe } from '@angular/common';
import { NgbAccordionModule, NgbAlert } from '@ng-bootstrap/ng-bootstrap';
import { Rating } from '../model/rating.model';

@Component({
  selector: 'app-menu-detail',
  standalone: true,
  imports: [HttpClientModule, RouterLink,DatePipe, NgbAccordionModule, NgbAlert],
  templateUrl: './menu-detail.component.html',
  styleUrl: './menu-detail.component.css'
})
export class MenuDetailComponent {

  menu: Menu | undefined;

  ratings: Rating[] = [];
   
  
  showDeleteMenuMessage: boolean = false;

  constructor(

    private activedRoute: ActivatedRoute,
    private httpClient: HttpClient
  ) { 

    
  }
  
  ngOnInit(): void {
    
    this.activedRoute.params.subscribe(params => {
      const id = params['id'];
      if (!id) return;
      const url = 'http://localhost:8080/menus/' + id;
      this.httpClient.get<Menu>(url).subscribe(m => this.menu = m);

      this.httpClient.get<Rating[]>('http://localhost:8080/menus/filter-by-menu/' + id)
      .subscribe(ratings => this.ratings = ratings);
    });
    this.loadMenus();

  
  }

  delete(menu: Menu) {
    const url = 'http://localhost:8080/menus/' + menu.id;
    this.httpClient.delete(url).subscribe(response => {
      this.menu = undefined;
      this.showDeleteMenuMessage = true;
    });
  }

  private loadMenus() { 
    const url = 'http://localhost:8080/menus';
    this.httpClient.get<Menu[]>(url).subscribe(menus => this.menu = menus);
  }

  hideDeletedMenuMessage() {
    this.showDeleteMenuMessage = false;
  }


}
