<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/4/2023
  Time: 2:58 PM
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
    <title>Update</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<form method="post">

    <div class="mb-3 mt-3">
        <label for="nameProduct" class="form-label">Name product:</label>
        <input type="text" class="form-control" id="nameProduct" placeholder="Enter name product" name="nameProduct" value="${products.getNameProduct()}">
    </div>
    <div class="mb-3">
        <label for="price" class="form-label">Price:</label>
        <input type="number" class="form-control" id="price" placeholder="Enter price" name="price" value="${products.getPrice()}">
    </div>
    <div class="mb-3">
        <label for="desc" class="form-label">Description:</label>
        <input type="text" class="form-control" id="desc" placeholder="Enter description" name="desc" value="${products.getDescription()}">
    </div>
    <div class="mb-3">
        <label for="producer" class="form-label">Producer:</label>
        <input type="text" class="form-control" id="producer" placeholder="Enter producer" name="producer" value="${products.getProducer()}">
    </div>
    <button type="submit" class="btn btn-primary">Update</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
