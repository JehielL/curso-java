import { Component, TemplateRef } from '@angular/core';
import { Menu } from '../model/menu.model';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { DatePipe, NgStyle } from '@angular/common';
import { NgbAccordionModule, NgbAlert, NgbModal, NgbRatingModule } from '@ng-bootstrap/ng-bootstrap';
import { Rating } from '../model/rating.model';
import { FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { AuthenticationService } from '../authentication/authentication.service';
import { Booking } from '../model/booking.model';

@Component({
  selector: 'app-menu-detail',
  standalone: true,
  imports: [RouterLink, DatePipe, NgbAccordionModule, NgbAlert, NgbRatingModule, ReactiveFormsModule],
  templateUrl: './menu-detail.component.html',
  styleUrl: './menu-detail.component.css'
})
export class MenuDetailComponent {

  menu: Menu | undefined;
  showSuccessDeletedRating = false;
  showDeleteMenuMessage = false;
  showErrorDeletedRating = false;
  userId = 0;
  isAdmin = false;
 


  ratings: Rating[] = [];
  ratingForm = new FormGroup({

    score: new FormControl(0),
    comment: new FormControl(''),
  });





  constructor(

    private activedRoute: ActivatedRoute,
    private httpClient: HttpClient,
    private authService: AuthenticationService,
    private modalService: NgbModal
  ) {

    this.authService.userId.subscribe(userId => this.userId = userId);
    this.authService.isAdmin.subscribe(isAdmin => this.isAdmin = isAdmin);


  }

  ngOnInit(): void {
    this.activedRoute.params.subscribe(params => {
      const id = params['id'];

      if (!id) return;

      const url = 'http://localhost:8080/menus/' + id;
      this.httpClient.get<Menu>(url).subscribe(m => {
        this.menu = m;
        this.loadRatings();
      });

    });
  }

  delete(menus: Menu) {
    const url = 'http://localhost:8080/menus/' + menus.id;
    this.httpClient.delete(url).subscribe(response => {
      this.menu = undefined;
      this.showDeleteMenuMessage = true;
    });
  }



  hideDeletedMenuMessage() {
    this.showDeleteMenuMessage = false;
  }


  save() {

    const rating: Rating = {
      id: 0,
      score: this.ratingForm.get('score')?.value ?? 0,
      comment: this.ratingForm.get('comment')?.value ?? '',
      menu: this.menu,

    };

    this.httpClient.post<Rating>('http://localhost:8080/ratings', rating).subscribe(rating => {
      this.ratingForm.reset();
      this.loadRatings();
    });

    this.httpClient.get<Rating[]>('http://localhost:8080/menus/filter-by-menu/' + this.menu?.id)
      .subscribe(ratings => this.ratings = ratings);
  }

  loadRatings() {
    if (!this.menu) return;

    this.httpClient.get<Rating[]>('http://localhost:8080/menus/filter-by-menu/' + this.menu.id)
      .subscribe(ratings => this.ratings = ratings);
  }

  deleteRating(rating: Rating) {
    this.httpClient.delete('http://localhost:8080/ratings/' + rating.id)
    .subscribe({
      next: response => {
        this.loadRatings();
        this.showSuccessDeletedRating = true;
      },
      error: error => {
        this.showErrorDeletedRating = true;
      }
    });
  }

  openModal(modal: TemplateRef<any>, menu: Menu) {
    this.modalService.open(modal, {
      centered: true
    }).result.then(result => {
      if (result === 'Aceptar') {
        this.delete(menu);
      }
    });
  }

  

}
