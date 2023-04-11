package com.example.ss10_jsp_jstl;

import com.example.ss10_jsp_jstl.model.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstNumber = 0.0f;
        float secondNumber = 0.0f;
        float result = 0.0f;
        firstNumber = Float.parseFloat(request.getParameter("firstNumber"));
        secondNumber = Float.parseFloat(request.getParameter("secondNumber"));
        String operator = String.valueOf(request.getParameter("operator"));
        try{
            result = Calculator.calculate(firstNumber, secondNumber, operator);
            request.setAttribute("result", result);
            request.getRequestDispatcher("/index2.jsp").forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
