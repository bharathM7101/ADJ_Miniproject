<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, model.Product, dao.ProductDAO" %>
<%
    String message = request.getParameter("message");
    List<Product> products = null;
    try {
        products = ProductDAO.getAllProducts();
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error fetching products: " + e.getMessage() + "</div>");
        return;
    }
%>
<html>
<head>
    <title>Product Display</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Product Inventory</h2>
    
    <!-- Success Message -->
    <% if (message != null) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <% } %>
    
    <!-- Products Table -->
    <div class="card">
        <div class="card-body">
            <% if (products.isEmpty()) { %>
                <p class="text-muted">No products found.</p>
            <% } else { %>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Product product : products) { %>
                                <tr>
                                    <td><%= product.getProductId() %></td>
                                    <td><%= product.getProductName() %></td>
                                    <td><%= product.getCategory() %></td>
                                    <td>$<%= String.format("%.2f", product.getPrice()) %></td>
                                    <td><%= product.getQuantity() %></td>
                                    <td>
                                        <a href="EditProductServlet?productId=<%= product.getProductId() %>" 
                                           class="btn btn-sm btn-warning me-1">Edit</a>
                                        <a href="DeleteProduct.jsp?productId=<%= product.getProductId() %>" 
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } %>
        </div>
    </div>
    
    <div class="mt-3">
        <a href="index.jsp" class="btn btn-secondary">Back to Menu</a>
        <a href="ProductAdd.jsp" class="btn btn-success ms-2">Add New Product</a>
    </div>
</div>

<!-- Bootstrap JS for dismissible alerts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
