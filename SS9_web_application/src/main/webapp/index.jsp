<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
</head>
<body>
    <form action="/display-discount" method="post">
        <div class="input-group mb-3">
            <label for="product-desc" class="form-label">Product Description:</label>
            <input type="text" class="form-control" name="product-desc" id="product-desc" placeholder="">
        </div>
        <div class="input-group mb-3">
        <label for="prices" class="form-label">List Price:</label>
        <input type="number" class="form-control" name="prices" id="prices" placeholder="">
        </div>
        <div class="input-group mb-3">
        <label for="discount" class="form-label">Discount Percent:</label>
        <input type="number" class="form-control" name="discount" id="discount" placeholder="">
        </div>
        <div>
            <p>description: ${desc}</p>
            <p>price: ${price}$</p>
            <p>discount percent: ${discount}</p>
            <p>discount amount: ${amount}</p>
            <p>discount price: ${discountPrice}</p>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</body>
</html>