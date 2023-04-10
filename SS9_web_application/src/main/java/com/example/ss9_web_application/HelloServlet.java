package com.example.ss9_web_application;

import java.io.*;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "display-discount", value = "/display-discount")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
        System.out.println(message);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        response.setContentType("text/html");


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        String desc = req.getParameter("product-desc");
        int price = Integer.parseInt(req.getParameter("prices"));
        float discount = Float.parseFloat(req.getParameter("discount"));
        double amountFlag;
        double discountPrice;
        amountFlag = price * discount * 0.01;
        discountPrice = price - amountFlag;

        req.setAttribute("desc", desc);
        req.setAttribute("price", price);
        req.setAttribute("discount", discount);
        req.setAttribute("amount", amountFlag);
        req.setAttribute("discountPrice", discountPrice);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        super.service(req, res);
        System.out.println("phương thức request");
    }

    public void destroy() {
        message = "kết thúc chương trình";
        System.out.println(message);
    }
}