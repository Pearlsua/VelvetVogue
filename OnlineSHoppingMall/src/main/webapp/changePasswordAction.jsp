<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

if (!confirmPassword.equals(newPassword)) {
    response.sendRedirect("changePassword.jsp?msg=notMatch");
} else {
    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
        ps.setString(1, email);
        ps.setString(2, oldPassword);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Old password is correct, update the password
            PreparedStatement updatePs = con.prepareStatement("UPDATE users SET password=? WHERE email=?");
            updatePs.setString(1, newPassword);
            updatePs.setString(2, email);
            updatePs.executeUpdate();
            
            response.sendRedirect("changePassword.jsp?msg=done");
        } else {
            // Old password is incorrect
            response.sendRedirect("changePassword.jsp?msg=wrong");
        }

        // Close resources
        rs.close();
        ps.close();
        con.close();
    } catch (SQLException e) {
        // Handle SQL exception
        e.printStackTrace();
        response.sendRedirect("changePassword.jsp?msg=invalid");
    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();
        response.sendRedirect("changePassword.jsp?msg=invalid");
    }
}
%>
