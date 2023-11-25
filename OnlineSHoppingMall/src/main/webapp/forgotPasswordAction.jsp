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
String mobileNumber = request.getParameter("mobileNumber");
String newPassword = request.getParameter("newPassword");

int check = 0;
try
{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and mobileNumber = '"+mobileNumber+"'");
	while(rs.next())
	{
		check = 1;
		st.executeUpdate("update users set password = '"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invlalid");
	}
}
catch (Exception e)
{
	System.out.println(e);	
}
%>
</body>
</html>