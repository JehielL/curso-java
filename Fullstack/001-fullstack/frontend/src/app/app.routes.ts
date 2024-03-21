import { Routes } from '@angular/router';
import { BookingListComponent } from './booking-list/booking-list.component';
import { BookingDetailComponent } from './booking-detail/booking-detail.component';
import { BookingFormComponent } from './booking-form/booking-form.component';
import { RestaurantDetailComponent } from './restaurant-detail/restaurant-detail.component';
import { UserDetailComponent } from './user-detail/user-detail.component';

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
        
    },
    
    {
        path: 'restaurants/:id/detail',
        component: RestaurantDetailComponent
    }
    ,
    {
        path: 'users',
        component: UserDetailComponent
    },
    
];
