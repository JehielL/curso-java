package com.techchef.datatypes.operators;

public class OperatorOr {
    public static void main(String[] args) {


        boolean isStudent = false;
        int age = 60;

        boolean isElegible = isStudent || age < 65 ;

        System.out.println(isElegible);

        isElegible = age > 20 && age < 65 || isStudent;
        System.out.println(isElegible);

    }
}
