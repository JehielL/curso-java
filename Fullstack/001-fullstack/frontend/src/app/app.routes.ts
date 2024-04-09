import { Routes } from '@angular/router';
import { BookingListComponent } from './booking-list/booking-list.component';
import { BookingDetailComponent } from './booking-detail/booking-detail.component';
import { BookingFormComponent } from './booking-form/booking-form.component';
import { RestaurantDetailComponent } from './restaurant-detail/restaurant-detail.component';
import { UserDetailComponent } from './user-detail/user-detail.component';
import { UserFormComponent } from './user-form/user-form.component';
import { MenuListComponent } from './menu-list/menu-list.component';
import { MenuFormComponent } from './menu-form/menu-form.component';
import { MenuDetailComponent } from './menu-detail/menu-detail.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { userRoleGuard } from './authentication/user-role.guard';

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
        path: 'menus/:id/update',
        component: MenuFormComponent,
        canActivate: [userRoleGuard]

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
    {
        path: 'users/create',
        component: UserFormComponent
    },
    {
        path: 'menus',
        component: MenuListComponent
    },
    {
        path: 'menus/create',
        component: MenuFormComponent,
            

    },
    {
        path: 'menus/:id/detail',
        component: MenuDetailComponent
       
    },
    {
        path: 'user/register',
        component: RegisterComponent
    },
    {
        path: 'user/login',
        component: LoginComponent
    }
];
