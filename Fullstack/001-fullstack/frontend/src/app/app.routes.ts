import { Routes } from '@angular/router';
import { BookingListComponent } from './booking-list/booking-list.component';
import { BookingDetailComponent } from './booking-detail/booking-detail.component';

export const routes: Routes = [

    {
        path:'',
        component : BookingListComponent
    },
    {
        path: 'bookings/:id/detail',
        component: BookingDetailComponent
    }
];
