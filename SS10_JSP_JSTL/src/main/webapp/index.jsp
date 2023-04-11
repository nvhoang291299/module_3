<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
<h1 class="text-center mb-3">Danh sách khách hàng</h1>
<table class="table table-striped border">
    <thead>
    <tr>
        <th>Fullname</th>
        <th>Date of birth</th>
        <th>Address</th>
        <th>Avatar</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.fullName}</td>
                <td>${customer.dateOfBirth}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.image}" alt="" width="60px" height="60px"></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>