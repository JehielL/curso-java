import { HttpInterceptorFn } from '@angular/common/http';

/*
Interceptor de angular basado en fucion
Sirve para interceptar las peticiones HTTP que se envian de angular a backend.

Agregar el token JWT en una cabecera (header) de la peticion HTTP.
*/
export const jwtInterceptor: HttpInterceptorFn = (req, next) => {

  const token = localStorage.getItem('jwt_token');
  

  if (token){
    req = req.clone({

      headers: req.headers.set('Authorization', `Bearer ${token}`)
    });
  }
  return next(req);
};
