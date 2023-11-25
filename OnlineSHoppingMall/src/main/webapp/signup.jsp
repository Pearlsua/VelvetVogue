<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="signupAction.jsp" method="post">
  <input type="text" name="ID" placeholder="Enter ID" required>
  <input type="text" name="name" placeholder="Enter Name" required>
  <input type="password" name="password" placeholder="Enter Password" required>
  <input type="email" name="email" placeholder="Enter Email" required>
  <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
  </select>
  <input type="submit" value="signup">
  </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>

<%
String msg = request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h1>환영합니다^^</h1>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h1>실패했습니다! 다시 접속해보세요!</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>