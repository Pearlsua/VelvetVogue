<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-....." crossorigin="anonymous" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <%String email=session.getAttribute("email").toString();  %>
            <center><h2>Online shopping </h2></center>
            <a href="addNewProduct.jsp">Add New Product <i class="fas fa-plus-square"></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class="fab fa-elementor"></i></a>
            <a href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a>
            <a href="cancelOrders.jsp">Cancel Orders <i class="fas fa-window-close"></i></a>
            <a href="../logout.jsp">Logout <i class="fas fa-share-square"></i></a>
          </div>
           <br>
           <!--table-->
