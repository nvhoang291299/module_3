package com.module3.ss12_crud.controller;

import com.module3.ss12_crud.model.User;
import com.module3.ss12_crud.service.IUserService;
import com.module3.ss12_crud.service.impl.UserService;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "userServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService iUserService = new UserService();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ServletException {
        response.setContentType("text/html");

        String actionUser = request.getParameter("actionUser");

        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                request.getRequestDispatcher("/view/create.jsp").forward(request, response);
                break;
            case "update":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                iUserService.findById(idEdit);
                request.setAttribute("user", iUserService.findById(idEdit));
                request.getRequestDispatcher("/view/update.jsp").forward(request, response);
                break;
            case "delete":
                int idDel = Integer.parseInt(request.getParameter("idDel"));
                iUserService.delete(idDel);
                response.sendRedirect("/user");
                break;

            case "search":
                String country = request.getParameter("search");
                iUserService.findByCountry(country);
                request.setAttribute("users", iUserService.findByCountry(country));
                request.getRequestDispatcher("/view/list.jsp").forward(request, response);
                break;
            case "sort":
                request.setAttribute("users",  iUserService.sortByName());
                request.getRequestDispatcher("/view/list.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("users", iUserService.findAll());
                request.getRequestDispatcher("/view/list.jsp").forward(request, response);
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
                createUser(req, resp);
                break;
            case "update":
                updateUser(req, resp);
                break;
        }
    }
    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String name = req.getParameter("name");
        String  email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name, email, country);
        iUserService.save(user);
        req.setAttribute("users", iUserService.findAll());
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }
    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int idEdit = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String  country = req.getParameter("country");
        User user = iUserService.findById(idEdit);
        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);
        iUserService.update(user);
        resp.sendRedirect("/user");
    }
}