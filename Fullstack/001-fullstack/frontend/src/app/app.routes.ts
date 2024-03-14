import { Routes } from '@angular/router';
import { BookingListComponent } from './booking-list/booking-list.component';
import { BookingDetailComponent } from './booking-detail/booking-detail.component';
import { BookingFormComponent } from './booking-form/booking-form.component';

export const routes: Routes = [

    {
        path:'',
        component : BookingListComponent
    },
    {
        path:'bookings',
        component : BookingListComponent
    },
    {
        path: 'bookings/:id/detail',
        component: BookingDetailComponent
    },
    {
        path: 'bookings/create',
        component: BookingFormComponent
        
    }
    ,
    {
        path: 'bookings/:id/update',
        component: BookingFormComponent
        
    }
];
