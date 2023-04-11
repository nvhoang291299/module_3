package com.example.ss10_jsp_jstl;

import com.example.ss10_jsp_jstl.model.Customer;
import org.w3c.dom.stylesheets.LinkStyle;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private List<Customer> customers = new ArrayList<>();

    public void init() {
        customers.add(new Customer("Mai Văn Hoàn", "2000-01-01", "Hà Nội", "https://www.w3schools.com/howto/img_avatar.png"));
        customers.add(new Customer("Nguyễn Văn Nam", "2000-02-02", "Đà Nẵng", "https://www.w3schools.com/w3css/img_avatar2.png"));
        customers.add(new Customer("Nguyễn Thái Hòa", "2000-11-03", "Hồ Chí Minh", "https://www.w3schools.com/howto/img_avatar.png"));
        customers.add(new Customer("Trần Đăng Khoa", "2000-05-04", "Tây Nguyên", "https://www.w3schools.com/w3css/img_avatar1.png"));
        customers.add(new Customer("Nguyễn Thị Thi", "2000-06-05", "Nghệ An", "https://www.w3schools.com/w3css/img_avatar4.png"));
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}