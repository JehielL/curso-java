import { Routes } from '@angular/router';

import { BookingListComponent } from './booking-list/booking-list.component';
import { BookingDetailComponent } from './booking-detail/booking-detail.component';
import { UserDetailComponent } from './user-detail/user-detail.component';
import { UserListComponent } from './user-list/user-list.component';

export const routes: Routes = [
 {
    path: 'bookings',
    component: BookingListComponent
 },
 {
   path: 'bookings/:id/detail',
   component: BookingDetailComponent
 },
 {
  path: 'users/:id/detail',
  component: UserDetailComponent
},
{
  path: 'users',
  component: UserListComponent
}
];
