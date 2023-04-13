package com.example.ss11_mvc.controller;

import com.example.ss11_mvc.model.Products;
import com.example.ss11_mvc.repository.IProductRepository;
import com.example.ss11_mvc.service.IProductService;
import com.example.ss11_mvc.service.impl.ProductService;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "list", value = "/list")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();

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
            case "delete":
                int idDel = Integer.parseInt(request.getParameter("id"));
                iProductService.findById(idDel);
                request.getRequestDispatcher("/view/products/delete.jsp").forward(request, response);
                break;
            case "search":
                String nameSearch = request.getParameter("search");
                iProductService.findByName(nameSearch);
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
                createProduct(req, resp);
                break;
            case "update":
                updateProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "search":
                searchProduct(req, resp);
                break;
        }
    }
    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String nameProduct = req.getParameter("nameProduct");
        int price = Integer.parseInt(req.getParameter("price"));
        String  desc = req.getParameter("desc");
        String producer = req.getParameter("producer");
        Products product = new Products(nameProduct, price, desc, producer);
        iProductService.save(product);
        req.setAttribute("products", iProductService.findAll());
        req.getRequestDispatcher("/view/products/list.jsp").forward(req, resp);
    }
    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int idEdit = Integer.parseInt(req.getParameter("id"));
        String editNameProduct = req.getParameter("nameProduct");
        int editPrice = Integer.parseInt(req.getParameter("price"));
        String  editDesc = req.getParameter("desc");
        String editProducer = req.getParameter("producer");
        Products productEdit = iProductService.findById(idEdit);
        productEdit.setNameProduct(editNameProduct);
        productEdit.setPrice(editPrice);
        productEdit.setDescription(editDesc);
        productEdit.setProducer(editProducer);
        iProductService.update(productEdit);
        resp.sendRedirect("/list");
    }
    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int idDel = Integer.parseInt(req.getParameter("id"));
        Products product = iProductService.findById(idDel);
        iProductService.delete(product);
        resp.sendRedirect("/list");
    }
    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String searchName = req.getParameter("search");
        List<Products> list = iProductService.findByName(searchName);
        req.setAttribute("list", list);
        req.getRequestDispatcher("/view/products/search.jsp").forward(req, resp);
    }
}