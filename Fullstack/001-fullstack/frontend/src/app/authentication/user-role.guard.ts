import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthenticationService } from './authentication.service';

/* 
Guard funcional que verifica si el usuario tiene el rol necesario para acceder a una ruta.
*/
export const userRoleGuard: CanActivateFn = (route, state) => {

  const authService = inject(AuthenticationService);
  const router = inject(Router);

  if (authService.getIsAdmin()){
    return true;

  } else {
    router.navigate(['/user/login']);
    return false;
  }
  
};
