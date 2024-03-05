import { Routes } from '@angular/router';

import { BookingListComponent } from './booking-list/booking-list.component';
import { BookingDetailComponent } from './booking-detail/booking-detail.component';
import { UserDetailComponent } from './user-detail/user-detail.component';
import { UserListComponent } from './user-list/user-list.component';
import { BookingFormComponent } from './booking-form/booking-form.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';

export const routes: Routes = [
  {
    path: 'bookings',
    component: BookingListComponent
 },
 {
    path: 'bookings',
    component: BookingListComponent
 },
 {
  path: 'bookings/create',
  component: BookingFormComponent
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
},
{
  path: 'register',
  component: RegisterComponent
},
{
  path: 'login',
  component: LoginComponent
}

];
