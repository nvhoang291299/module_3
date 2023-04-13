<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/4/2023
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <table class="table table-striped text-center border bound-1">
            <thead>
            <tr>
                <th>No</th>
                <th>Name product</th>
                <th>Price</th>
                <th>Description</th>
                <th>Producer</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${list}" varStatus="loop">
                <tr>
                    <td>${loop.count}</td>
                    <td>${product.getNameProduct()}</td>
                    <td>${product.getPrice()}</td>
                    <td>${product.getDescription()}</td>
                    <td>${product.getProducer()}</td>
                    <td><button type="submit" class="btn btn-primary"><a href="/list?actionUser=update&id=${product.getId()}">Update</a></button>
                        <button type="submit" class="btn btn-danger"><a href="/list?actionUser=delete&id=${product.getId()}">Delete</a></button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
