<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%
	//get values entered in contact form in "Contact.jsp"
	String contactName = request.getParameter("contactName");
	String contactEmail = request.getParameter("contactEmail");
	String contactSubject = request.getParameter("contactSubject");
	String contactMessage = request.getParameter("contactMessage");

	Class.forName("com.mysql.jdbc.Driver");
	//change localhost password
	java.sql.Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/lis", "root", "");
	Statement statement = con.createStatement();

	ResultSet rs = statement.executeQuery("select * from contactform");

	int id = 0;
	while (rs.next()) {
		id = rs.getInt("id");
	}

	//insert contact form values in "contactform" table.
	statement.executeUpdate("insert into contactform values ('" + ++id + "', '" + contactName + "', '" + contactEmail + "', '" + contactSubject + "', '" + contactMessage + "')");
	response.sendRedirect("index.jsp");
%>
