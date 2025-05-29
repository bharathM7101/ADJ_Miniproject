<%@ page contentType="text/html; charset=UTF-8" import="model.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
        response.sendRedirect("ProductDisplay.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card" style="max-width: 600px; margin: 0 auto;">
        <div class="card-header bg-warning text-dark">
            <h3 class="mb-0">Update Product</h3>
        </div>
        <div class="card-body">
            <form action="UpdateProductServlet" method="post">
                <!-- Hidden product ID -->
                <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
                
                <div class="mb-3">
                    <label class="form-label">Product Name: <span class="text-danger">*</span></label>
                    <input type="text" name="productName" class="form-control" 
                           value="<%= product.getProductName() %>" required />
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Category: <span class="text-danger">*</span></label>
                    <input type="text" name="category" class="form-control" 
                           value="<%= product.getCategory() %>" required />
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Price: <span class="text-danger">*</span></label>
                    <input type="number" step="0.01" name="price" class="form-control" 
                           value="<%= product.getPrice() %>" required min="0" />
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Quantity: <span class="text-danger">*</span></label>
                    <input type="number" name="quantity" class="form-control" 
                           value="<%= product.getQuantity() %>" required min="0" />
                </div>
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="ProductDisplay.jsp" class="btn btn-secondary me-md-2">Cancel</a>
                    <button type="submit" class="btn btn-warning">Update Product</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
