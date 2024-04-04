package com.bitebooking.controller;

import com.bitebooking.dto.Login;
import com.bitebooking.dto.Register;
import com.bitebooking.dto.Token;
import com.bitebooking.model.User;
import com.bitebooking.repository.UserRepository;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;

@CrossOrigin("*")
@AllArgsConstructor
@Slf4j
@RestController
public class UserController {




    private UserRepository userRepository;

    @GetMapping("users")
    public List<User> findAll(){
        return this.userRepository.findAll();
    }

    @GetMapping("users/{id}")
    public User findById(@PathVariable Long id) {

        return this.userRepository.findById(id).orElseThrow();
    }

    @PostMapping("users/register")
    public void register(@RequestBody Register register) {

        // Si el email está ocupado no registramos el usuario
        if (this.userRepository.existsByEmail(register.email())){
            throw new RuntimeException("Email ocupado");
        }

        // Crear el objeto User
        // TODO cifrar la contraseña con BCrypt
        User user = new User(null, null, register.email(), register.password());

        // Guardar el objeto user
        this.userRepository.save(user);
    }

    @PostMapping("users/login")
    public Token login(@RequestBody Login login) {

        // Si el email no existe entonces no se hace login
        if (!this.userRepository.existsByEmail(login.email())) {
            throw new NoSuchElementException("User not found");
        }

        // Recuperar usuario
        User user = this.userRepository.findByEmail(login.email()).orElseThrow();

        // Comparar contraseñas

        if(!user.getPassword().equals(login.password())){
            throw new RuntimeException("Credenciales incorrectas");
        }


        // Generar token de acceso metodo anterior deprecado

        /*String token = Jwts.builder().signWith(
                Keys.hmacShaKeyFor("admin".getBytes()), SignatureAlgorithm.ES512)
                .setHeaderParam("typ", "JWT")
                .setSubject(String.valueOf(user.getId()))
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + (3600 * 24 * 1000)))
                .claim("email", user.getEmail()).claim("role", "admin")
                .compact(); */

        Date issuedDate = new Date();
        long nextWeekMillis = TimeUnit.DAYS.toMillis(7);
        Date expirationDate = new Date(issuedDate.getTime() + nextWeekMillis);


        byte[] key = Base64.getDecoder().decode("wLd39ypA5uOeydsszUh3f6OXijomn+VVIpFlaDkF86w=");

        String token = Jwts.builder()
                // id del usuario
                .subject(String.valueOf(user.getId()))
                // La clave secreta para firmar el token y saber que es nuestro cuando lleguen las peticiones del frontend
                .signWith(Keys.hmacShaKeyFor(key))
                // Fecha emisión del token
                .issuedAt(issuedDate)
                // Fecha de expiración del token
                .expiration(expirationDate)
                // información personalizada: rol, username, email...
                .claim("role", "user")
                .claim("email", user.getEmail())
                // Construye el token
                .compact();
        return new Token(token);


    }


}
