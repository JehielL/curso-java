package com.bitebooking.security;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Base64;

/*
Clase para:
 1.-interceptar las peticiones HTTP entrantes.
 2.-extraker el joken jwt de las cabeceras.
 3.-verificar que el token es correcto.
 4.-Extraer el usuario del token.
 */

@Component
@Slf4j
public class RequestJwtFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        log.info("Ejecutando");

        //extraer el token de la cabecera Authorization de la request

        String bearerToken = request.getHeader("Authorization");
        String token = "";

        if (StringUtils.hasLength(bearerToken) && bearerToken.startsWith("Bearer")){

            token = bearerToken.substring("Bearer ".length());
        } else {
            filterChain.doFilter(request, response);
            return;
        }

        log.info("Extraido token JWT {}", token);

        // verificar el token

        byte[] key = Base64.getDecoder().decode("wLd39ypA5uOeydsszUh3f6OXijomn+VVIpFlaDkF86w=");

        String userId = Jwts.parser().verifyWith(Keys.hmacShaKeyFor(key)).build().parseSignedClaims(token).getPayload().getSubject();

        log.info(userId);

        //Dejar pasar la peticion


        filterChain.doFilter(request,response);
    }
}
