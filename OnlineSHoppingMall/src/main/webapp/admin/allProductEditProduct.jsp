<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Home</title>
  <style>
    h3 {
      color: yellow;
      text-align: center;
    }

    table {
      border-collapse: collapse;
      width: 100%;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }

    th {
      background-color: #f2f2f2;
    }

    .center-text {
      text-align: center;
      font-size: 30px;
      color: white;
    }
  </style>
</head>
<body>
  <div class="center-text">All Products & Edit Products <i class='fab fa-elementor'></i></div>
  <% 
  String msg = request.getParameter("msg");
  if ("done".equals(msg)) {
  %>
  <h3 class="alert">Product Successfully Updated!</h3>
  <% } %>
  <% 
  if ("wrong".equals(msg)) {
  %>
  <h3 class="alert">Something went wrong! Try again!</h3>
  <% } %>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Category</th>
        <th><i class="fa fa-inr"></i> Price</th>
        <th>Status</th>
        <th>Edit <i class='fas fa-pen-fancy'></i></th>
      </tr>
    </thead>
    <tbody>
      <% 
      try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from product");
        while (rs.next()) {
      %>
      <tr>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
        <td><%=rs.getString(5) %></td>
        <td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
      </tr>
      <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
      %>
    </tbody>
  </table>
  <br>
  <br>
  <br>
</body>
</html>
