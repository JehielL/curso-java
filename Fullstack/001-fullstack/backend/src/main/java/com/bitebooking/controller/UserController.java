package com.bitebooking.controller;

import com.bitebooking.dto.Login;
import com.bitebooking.dto.Register;
import com.bitebooking.dto.Token;
import com.bitebooking.model.Role;
import com.bitebooking.model.User;
import com.bitebooking.repository.UserRepository;
import com.bitebooking.security.SecurityUtils;
import com.bitebooking.services.FileService;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.security.sasl.AuthenticationException;
import java.util.*;
import java.util.concurrent.TimeUnit;



@CrossOrigin("*")
@AllArgsConstructor
@Slf4j
@RestController

public class UserController {



    private final FileService fileService;
    private UserRepository userRepository;

    @GetMapping("users")
    public List<User> findAll(){
        return this.userRepository.findAll();
    }

    @GetMapping("users/{id}")
    public User findById(@PathVariable Long id) {

        return this.userRepository.findById(id).orElseThrow();
    }

    @GetMapping("users/account")
    public User getCurrentUser(){
        return SecurityUtils.getCurrentUser().orElseThrow();
    }
    @PostMapping("users/register")
    public void register(@RequestBody Register register) {

        // Si el email está ocupado no registramos el usuario
        if (this.userRepository.existsByEmail(register.email())){
            throw new RuntimeException("Email ocupado");
        }

        // Crear el objeto User
        // TODO cifrar la contraseña con BCrypt
        User user = User.builder()
                .email(register.email())
                .password(register.password())
                .role(Role.USER)
                .build();

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
                .claim("role", user.getRole())
                .claim("email", user.getEmail())
                // Construye el token
                .compact();
        return new Token(token);


    }

    @PutMapping("users/account")
    public User update(@RequestBody User user){
        SecurityUtils.getCurrentUser().ifPresent(currentUser -> {

            if (currentUser.getRole() == Role.ADMIN || Objects.equals(currentUser.getId(), user.getId())){

                this.userRepository.save(user);
            } else {
                throw new RuntimeException("No tiene permisos necesarios, no se puede actualizar.");
            }
        });

        return user;

    }

    @PostMapping("users/account/avatar")
    public User uploadAvatar(@RequestParam(value = "photo", required = false)MultipartFile file)
    {

        User user = SecurityUtils.getCurrentUser().orElseThrow();
        if (file != null){
            String fileName = fileService.store(file);
            user.setImgUser(fileName);
            this.userRepository.save(user);

            }
        return user;

    }
}
