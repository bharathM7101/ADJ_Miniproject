<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Add New Product</h2>
    <form action="AddProductServlet" method="post">
        <div class="mb-3">
            <label class="form-label">Product Name:</label>
            <input type="text" name="productName" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Category:</label>
            <input type="text" name="category" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Price:</label>
            <input type="number" step="0.01" name="price" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Quantity:</label>
            <input type="number" name="quantity" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-primary">Add Product</button>
    </form>
</div>
</body>
</html>
