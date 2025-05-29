<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Delete Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Delete Product</h2>
    <form action="DeleteProductServlet" method="get">
        <div class="mb-3">
            <label class="form-label">Product ID:</label>
            <input type="number" name="productId" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-danger">Delete Product</button>
    </form>
</div>
</body>
</html>
