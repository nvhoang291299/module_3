<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/4/2023
  Time: 3:45 PM
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
  <title>User product</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <style>
    a {
      text-decoration: none;
      color: white;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>User management</h1>
    <div class="mb-2">
      <button type="submit" class="btn btn-primary"><a href="/user?actionUser=create">Create</a></button>
    </div>
    <form action="/user" class="mb-2">
      <label for="search">
        <button type="submit" class="btn btn-primary">Search</button>
      </label>
      <input type="search" name="search" id="search" placeholder="enter name...">
      <input type="hidden" name="actionUser"  value="search" >
    </form>
    <form action="/user" class="mb-2">
        <button type="submit" class="btn btn-primary">Sort</button>
      <input type="hidden" name="actionUser"  value="sort" >
    </form>

    <table class="table table-striped text-center border bound-1">
      <thead>
        <th>no</th>
        <th>name</th>
        <th>age</th>
        <th>country</th>
      </thead>
      <tbody>
      <c:forEach var="user" items="${users}" varStatus="loop">
        <tr>
          <td>${loop.count}</td>
          <td>${user.getName()}</td>
          <td>${user.getEmail()}</td>
          <td>${user.getCountry()}</td>
          <td><button type="submit" class="btn btn-primary"><a href="/user?actionUser=update&id=${user.getId()}">Update</a></button>
            <button onclick="deleteId(${user.getId()}, '${user.getName()}')"
                    type="button" class="btn btn-danger" data-bs-toggle="modal"
                    data-bs-target="#modelId">Delete</button></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="modelTitleId"></h4>
            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Do you want to <span class="text-danger" id="nameDelete"></span>
          </div>
          <div class="modal-footer">
            <form action="/user">
              <div class="input-group">
                <input id="idDelete" type="hidden"
                       class="form-control" name="idDel">
                <input type="hidden" name="actionUser" value="delete">
              </div>

              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Delete</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script>
    function deleteId(id, name){
      document.getElementById("idDelete").value = id;
      document.getElementById("nameDelete").innerText = name;
    }
  </script>
</body>
</html>
