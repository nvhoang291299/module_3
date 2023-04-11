<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/4/2023
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<div class="border border-2 p-2" style="width: 500px">
    <form action="/calculator" method="post" >
        <h2 class="text-center">Calculator</h2>
        <div class="mb-3 mt-3">
            <label for="first-number" class="form-label">First operand:</label>
            <input type="number" class="form-control" id="first-number" placeholder="Enter your number" name="firstNumber">
        </div>
        <div class="mb-3">
            <label for="operator">Operator:</label>
            <select class="form-select" id="operator" name="operator">
                <option value="addition">addition</option>
                <option value="subtraction">subtraction</option>
                <option value="multiplication">multiplication</option>
                <option value="division">division</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="second-number" class="form-label">Second operand:</label>
            <input type="number" class="form-control" id="second-number" placeholder="Enter your number" name="secondNumber">
        </div>
        <div class="mb-3">
            <p>result: ${result}</p>
        </div>

        <button type="submit" class="btn btn-primary">Calculate</button>
    </form>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
