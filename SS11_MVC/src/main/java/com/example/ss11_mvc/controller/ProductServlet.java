package com.example.ss11_mvc.controller;

import com.example.ss11_mvc.model.Products;
import com.example.ss11_mvc.repository.IProductRepository;
import com.example.ss11_mvc.service.IProductService;
import com.example.ss11_mvc.service.impl.ProductService;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "list", value = "/list")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        String actionUser = request.getParameter("actionUser");

        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                request.getRequestDispatcher("/view/products/create.jsp").forward(request, response);
                break;
            case "update":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                iProductService.findById(idEdit);
                request.getRequestDispatcher("/view/products/update.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("products", iProductService.findAll());
                request.getRequestDispatcher("/view/products/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doPost(req, resp);
        String actionUser = req.getParameter("actionUser");

        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                String nameProduct = req.getParameter("nameProduct");
                int price = Integer.parseInt(req.getParameter("price"));
                String  desc = req.getParameter("desc");
                String producer = req.getParameter("producer");
                Products product = new Products(nameProduct, price, desc, producer);
                iProductService.save(product);
                req.setAttribute("products", iProductService.findAll());
                req.getRequestDispatcher("/view/products/list.jsp").forward(req, resp);
//                resp.sendRedirect("/list");
                break;
            case "update":
                break;
        }
    }

    public void destroy() {
    }
}