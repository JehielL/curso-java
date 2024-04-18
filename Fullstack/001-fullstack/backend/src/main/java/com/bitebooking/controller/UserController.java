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
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
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

    private final PasswordEncoder passwordEncoder;

    @GetMapping("user")
    public List<User> findAll(){

        return userRepository.findAll();
    }

    @GetMapping("users/account")
    public User getCurrentUser(){
        return SecurityUtils.getCurrentUser().orElseThrow();
    }


    @GetMapping("user/{id}")
    public ResponseEntity<User> findById(@PathVariable Long id){
        Optional<User> users = userRepository.findById(id);

        if (users.isPresent()){
            return ResponseEntity.ok(users.get());
        }else{
            return ResponseEntity.notFound().build();
        }
    }
    @PostMapping("/users/register")
    public void register(@RequestBody Register register) {
        // Si el email está ocupado no registramos el usuario
        if (this.userRepository.existsByEmail(register.email())){
            throw new RuntimeException("Email ocupado");
        }

        // Crear el objeto User
        // TODO cifrar la contraseña con BCrypt
        User user = User.builder()
                .email(register.email())
                .password(passwordEncoder.encode(register.password()))
                .role(Role.USER)
                .build();
        // Guardar el objeto user
        this.userRepository.save(user);
    }

    @PostMapping("/users/login")
    public Token login(@RequestBody Login login) {
        SecurityUtils.getCurrentUser().ifPresent(System.out::println);
        // Si el email no existe entonces no se hace login
        if (!this.userRepository.existsByEmail(login.email())) {
            throw new NoSuchElementException("User not found");
        }

        // Recuperar usuario
        User user = this.userRepository.findByEmail(login.email()).orElseThrow();

        // Comparar contraseñas

        if(!passwordEncoder.matches(login.password(), user.getPassword())){
            throw new RuntimeException("Credenciales incorrectas");
        }

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
    public User uploadAvatar(@RequestParam(value = "photo", required = false) MultipartFile file)
    {

        User user = SecurityUtils.getCurrentUser().orElseThrow();
        if (file != null){
            String fileName = fileService.store(file);
            user.setImgUser(fileName);
            this.userRepository.save(user);

        }
        return user;

    }

    @PutMapping("user/{id}")
    public ResponseEntity<User> update(@PathVariable Long id, @RequestBody User user){
        Optional<User> userOtp = userRepository.findById(id);

        if (userOtp.isEmpty()){ // no existe error404 not faund
            return ResponseEntity.notFound().build();
        }

        User usuariosFromDB = userOtp.get();
        // faltan mas atributos
        return ResponseEntity.ok(userRepository.save(usuariosFromDB));
    }
    @DeleteMapping("user/id")
    private ResponseEntity<Void> deleteById(@PathVariable Long id){

        userRepository.deleteById(id);
        return ResponseEntity.noContent().build(); //204
    }
}
