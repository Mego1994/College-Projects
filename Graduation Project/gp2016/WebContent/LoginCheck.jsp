<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<% 
String username =(String) request.getParameter("username");
session.setAttribute("LoginUsername", username);

String password =(String) request.getParameter("password");
session.setAttribute("LoginPassword", password);

Class.forName("com.mysql.jdbc.Driver");
//change localhost password
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
Statement statement= con.createStatement();

//retrieving tests names from DB.
ResultSet rs=statement.executeQuery("select * from roles");

while(rs.next()){
	
	if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")) && rs.getString("Activity").equals("active")) 
		{
			if (rs.getString("role").equals("receptionist"))	
				response.sendRedirect("receptionist.jsp");
			else if(rs.getString("role").equals("patient"))
				response.sendRedirect("patient.jsp");
			else if(rs.getString("role").equals("doctor"))
				response.sendRedirect("Doctor.jsp");
			else if(rs.getString("role").equals("admin"))
				response.sendRedirect("Admin.jsp");
			
		}else
			//case username or password not true
			out.print("<script>"+"window.location.href = 'Signin.jsp'"+"</script>");
}
%>