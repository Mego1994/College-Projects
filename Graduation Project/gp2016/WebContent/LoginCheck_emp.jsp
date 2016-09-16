<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<% 

String name = (String) request.getParameter("name");
session.setAttribute("name", name);
String bdate = (String) request.getParameter("bdate");
session.setAttribute("bdate", bdate);

Class.forName("com.mysql.jdbc.Driver");
//change localhost password
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
Statement statement= con.createStatement();

//retrieving tests names from DB.
ResultSet rs=statement.executeQuery("select * from insertpatient");

while(rs.next()){
	if(name.equals(rs.getString("fname")+" "+rs.getString("lname")) && bdate.equals(rs.getString("bdate")) ) 
		response.sendRedirect("viewPatient.jsp");
	
}

%>