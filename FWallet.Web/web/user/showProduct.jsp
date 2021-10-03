<%-- 
    Document   : showProduct
    Created on : Oct 3, 2021, 11:11:24 AM
    Author     : pphuh
--%>

<%@page import="fwallet.data.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    </head>
    <body>
        <h1>All Product</h1>
        <div class="col mb-5" style="display: inline-flex;">
            <%
                List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("LIST_PRODUCT");
                if(list!=null){
                for(ProductDTO p : list){
            %>
                        <div class="card h-100" style="margin: auto 30px;">
                            <!-- Product image-->
                            <img class="card-img-top" src="<%= p.getImage() %>" alt="" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%= p.getProductName() %></h5>
                                    <!-- Product price-->
                                    <%= p.getPrice() %>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <form action="ChargePointController">
                                    </div>
                                        <button type="submit" name="action" value="Add to cart" class="btn btn-outline-dark mt-auto">Get</button>
                                    </div>
                                </form>
            <%
                    }
            %>
            <%
                }else{
            %>                        
                <h1>No Product</h1>
            <%
                }
            %>
                            </div>

                        </div>
                    </div>
    </body>
</html>
