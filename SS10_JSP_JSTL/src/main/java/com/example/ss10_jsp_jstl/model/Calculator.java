package com.example.ss10_jsp_jstl.model;

public class Calculator {
    public static float calculate(float firstNumber, float secondNumber, String operator) {
        switch (operator) {
            case "addition":
                return firstNumber + secondNumber;
            case "subtraction":
                return firstNumber - secondNumber;
            case "multiplication":
                return firstNumber * secondNumber;
            case "division":
                if(secondNumber != 0){
                    return firstNumber / secondNumber;
                }
                else {
                    throw new RuntimeException("Can't divide by zero");
                }
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
