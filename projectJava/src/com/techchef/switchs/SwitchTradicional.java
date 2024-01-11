package com.techchef.switchs;

import java.util.Scanner;

public class SwitchTradicional {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Introduce un dia de la semana del 1 al 7: ");
        int dayOfWeek = scanner.nextInt();

        switch (dayOfWeek){

            case 1:
                System.out.println("Lunes");
                break;
            case 2:
                System.out.println("martes");
                break;
            case 3:
                System.out.println("Miercoles");
                break;
            case 4:
                System.out.println("Jueves");
                break;
            case 5:
                System.out.println("Viernes");
                break;
            case 6:
                System.out.println("Sabado");
                break;
            case 7:
                System.out.println("Domingo");
                break;
            default:
                System.out.println("Introduce un dia valido entre 1 y 7");

        }
    }
}
