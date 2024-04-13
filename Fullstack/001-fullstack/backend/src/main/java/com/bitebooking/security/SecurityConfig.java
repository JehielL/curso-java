package com.bitebooking.security;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
@AllArgsConstructor
@Configuration
public class SecurityConfig {

    private final RequestJwtFilter jwtFilter;
    /*
    Personalizar el objeto HttpSecurity de Spring Security para utilizar nuestro filtro JWT y proteger controladores
     */

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http.csrf().disable().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);


        http.authorizeHttpRequests()
                .requestMatchers("users/login").permitAll()
                .requestMatchers("users/register").permitAll()
                .requestMatchers(HttpMethod.POST, "menus").hasAuthority("ADMIN")

                .anyRequest()
                .authenticated();

        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();

    }

}
