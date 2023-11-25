<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

// Assume user does not exist initially
boolean userExists = false;

if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
    session.setAttribute("email", email);
    response.sendRedirect("admin/adminHome.jsp");
} else {
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from users where email = '" + email + "' and password = '" + password + "'");
        
        while (rs.next()) {
            userExists = true;
            session.setAttribute("email", email);
            response.sendRedirect("home.jsp");
        }

        if (!userExists) {
            response.sendRedirect("login.jsp?msg=notexist");
        }
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("login.jsp?msg=invalid");
    }
}
%>
</body>
</html>
