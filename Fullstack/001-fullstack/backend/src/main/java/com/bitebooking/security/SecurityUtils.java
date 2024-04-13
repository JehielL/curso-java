package com.bitebooking.security;

import com.bitebooking.model.User;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.swing.text.html.Option;
import java.util.Optional;

public class SecurityUtils {

    public static Optional<User> getCurrentUser(){

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof User user){
            return Optional.of(user);
        } else {
            return Optional.empty();
        }

    }
}
