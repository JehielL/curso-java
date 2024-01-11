package com.techchef.input;

import java.util.Scanner;

public class ReadConsole {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        //leer string
        System.out.println("Introduce tu nombre: ");

        String nombre = scanner.nextLine();
        System.out.println("Tu nombre es : " + nombre);
        //leer int
        System.out.println("Introduce tu edad: ");
        int edad = scanner.nextInt();
        System.out.println("Tu edad es: " + edad);
        // leer float
        System.out.println("Introduce tu salario: ");
        float salary = scanner.nextFloat();
        System.out.println("Tu salario es: " + salary);
        // leer double
        System.out.println("Introduce tu altura (En centrimetros)");
        double altura = scanner.nextDouble();
        System.out.println("Tu altura es : " + altura);
        //leer boolean

        System.out.println("¿Estas trabajando? (true/false)");
        boolean estasTrabajando = scanner.nextBoolean();
        System.out.println("Estas trabando: " + estasTrabajando);
    }


}
