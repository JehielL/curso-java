package com.bitebooking.security;

import com.bitebooking.model.Role;
import com.bitebooking.model.User;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.swing.text.html.Option;
import java.util.Optional;

public class SecurityUtils {
    private SecurityUtils(){}
    public static Optional<User> getCurrentUser(){

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof User user){
            return Optional.of(user);
        } else {
            return Optional.empty();
        }

    }

    public static boolean isAdminCurrentUser() {

       if (getCurrentUser().isEmpty()){
           return false;
       }
       User user = getCurrentUser().get();
       return user.getRole().equals(Role.ADMIN);
    }
}
