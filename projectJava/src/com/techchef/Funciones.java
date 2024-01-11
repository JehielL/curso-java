package com.techchef;

public class Funciones {

    public static void main(String[] args) {

        holaMundo("Jehiel");
        String hola = devolverTexto();
        System.out.println(hola);


    }

    public static void holaMundo() {
        System.out.println("Hola Mundo");
        System.out.println("Hola Mundo");

    }

    public static void holaMundo(String name) {

        System.out.println("Hola " + name);


    }


    private static String devolverTexto() {
        return "hola";
    }

    private static int sum(int num1, int num2){
        return num1 + num1;
    }
}