package com.bitebooking;

import org.junit.jupiter.api.Test;

import java.security.SecureRandom;
import java.util.Base64;

public class KeyGeneratorTest {

    @Test
    void generateSecureKey(){

        SecureRandom random = new SecureRandom();

        byte[] key = new byte[32];
        random.nextBytes(key);

        // convertir a base 64

        String base64Key = Base64.getEncoder().encodeToString(key);
        System.out.println(base64Key);
    }
}
