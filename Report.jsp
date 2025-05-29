<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 40px;
            padding-bottom: 40px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: 600;
        }
        .form-label {
            font-weight: 500;
        }
        table th, table td {
            vertical-align: middle;
        }
        .btn-primary {
            background-color: #0069d9;
            border-color: #0062cc;
        }
        .btn-primary:hover {
            background-color: #005cbf;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="card mb-5 shadow-sm">
        <div class="card-header">
            <h3 class="mb-0">Generate Product Reports</h3>
        </div>
        <div class="card-body">
            <form method="get" action="ReportsServlet" class="row g-3">
                <div class="col-md-4">
                    <label for="minPrice" class="form-label">Products with Price Greater Than</label>
                    <input type="number" step="0.01" id="minPrice" name="minPrice" class="form-control" placeholder="E.g. 1000.00">
                </div>
                <div class="col-md-4">
                    <label for="category" class="form-label">Products in Category</label>
                    <input type="text" id="category" name="category" class="form-control" placeholder="E.g. Electronics">
                </div>
                <div class="col-md-4">
                    <label for="topN" class="form-label">Top N Products by Quantity</label>
                    <input type="number" id="topN" name="topN" class="form-control" placeholder="E.g. 5">
                </div>
                <div class="col-12 text-end">
                    <button type="submit" class="btn btn-primary">Get Report</button>
                </div>
            </form>
        </div>
    </div>

    <%
        List<Product> reportList = (List<Product>) request.getAttribute("reportList");
        String reportType = (String) request.getAttribute("reportType");

        if(reportList != null) {
    %>
    <div class="card shadow-sm">
        <div class="card-header">
            <h4 class="mb-0">Report Results - <%= reportType %></h4>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-striped table-hover mb-0">
                    <thead class="table-primary">
                        <tr>
                            <th scope="col">Product ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Category</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Product p : reportList) { %>
                        <tr>
                            <td><%= p.getProductId() %></td>
                            <td><%= p.getProductName() %></td>
                            <td><%= p.getCategory() %></td>
                            <td><%= String.format("%.2f", p.getPrice()) %></td>
                            <td><%= p.getQuantity() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <% } %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
