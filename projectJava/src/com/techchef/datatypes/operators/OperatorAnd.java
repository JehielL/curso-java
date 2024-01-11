package com.techchef.datatypes.operators;

public class OperatorAnd {
    public static void main(String[] args) {

        double price = 56.44;

        boolean isFreeShipping = price > 50;
        boolean isFreeShipping2  = price > 50 && price < 100;

        System.out.println();
        System.out.println();

        double weight = 20;

        boolean isFreeShipping3 = price > 50 && price < 100  && weight > 0 && weight < 30;


        boolean isCorrectPrice = price > 50 && price < 100;
        boolean isCorrectWeight = weight > 0 && weight < 30;

    }
}
