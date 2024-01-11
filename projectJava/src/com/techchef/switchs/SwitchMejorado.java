package com.techchef.switchs;

import java.util.Scanner;

public class SwitchMejorado {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.println("Introduce un dia de la semana del 1 al 7: ");
        int dayOfWeek = scanner.nextInt();

        switch (dayOfWeek){
            case 1 -> System.out.println("lunes");
            case 2 -> System.out.println("martes");
            case 3 -> System.out.println("miercoles");
            case 4 -> System.out.println("jueves");
            case 5 -> System.out.println("viernes");
            case 6 -> System.out.println("sabado");
            case 7 -> System.out.println("domingo");
            default -> System.out.println("introduce un valor correcto entre 1 y 7");
        }


    }
}
