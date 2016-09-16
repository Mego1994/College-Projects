<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.sun.xml.internal.ws.server.sei.SEIInvokerTube"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
Class.forName("com.mysql.jdbc.Driver");
//change localhsot password
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","root");
Statement statement= con.createStatement();
String Paid=request.getParameter("Paid_up");
String Rest=request.getParameter("Rest");


ResultSet rs3 = statement.executeQuery("select * from insertpatient");
int patientId = 0;
while (rs3.next()) {
	patientId = rs3.getInt("patientID");
}

//statement.executeUpdate("insert into insertpatient values ('"+session.getAttribute("fname")+"','"+session.getAttribute("lname")+"','"+session.getAttribute("bdate")+"','"+session.getAttribute("email")+"','"+session.getAttribute("patientUsername")+"','"+session.getAttribute("patientPassword")+"','"+session.getAttribute("address")+"','"+session.getAttribute("phone")+"','"+session.getAttribute("gender")+"','"+session.getAttribute("drug")+"' ,'"+session.getAttribute("diseases")+"' ,'"+request.getParameter("tests")+"','"+request.getParameter("dates")+"','"+session.getAttribute("Comments")+"','"+session.getAttribute("docusername")+"', '"+request.getParameter("currentDate")+"', '"+request.getParameter("datatoencode")+"', '"+request.getParameter("sample_details")+"', '"+request.getParameter("sampledate")+"', '"+request.getParameter("time")+"','"+request.getParameter("afterDiscount")+"','"+Paid+"','"+Rest+"')");
String fullName=session.getAttribute("fname")+ " " + session.getAttribute("lname");
	statement.executeUpdate("insert into insertpatient values ('"+session.getAttribute("fname")+"','"+session.getAttribute("lname")+"','"+session.getAttribute("bdate")+"','"+session.getAttribute("email")+"','"+session.getAttribute("patientUsername")+"','"+session.getAttribute("patientPassword")+"','"+session.getAttribute("address")+"','"+session.getAttribute("phone")+"','"+session.getAttribute("gender")+"','"+session.getAttribute("drug")+"' ,'"+session.getAttribute("value")+"' ,'"+request.getParameter("tests")+"','"+request.getParameter("dates")+"','"+session.getAttribute("Comments")+"','"+session.getAttribute("item")+"', '"+request.getParameter("currentDate")+"', '"+session.getAttribute("sampleCode")+"', '"+request.getParameter("currentDate")+"', '"+request.getParameter("time")+"', '"+session.getAttribute("referingdoc")+"','"+ ++patientId +"','"+session.getAttribute("lpdate")+"','"+session.getAttribute("fasting")+"','"+session.getAttribute("fhours")+"','"+fullName+"','"+session.getAttribute("afterDiscount")+"','"+Paid+"','"+Rest+"')");
	statement.executeUpdate("insert into roles values ('"+session.getAttribute("patientUsername")+"','"+session.getAttribute("patientPassword")+"','"+"patient"+"','"+session.getAttribute("phone")+"' ,'"+"active"+"','"+ ++patientId +"')");
// 	statement.executeUpdate("insert into samples values ('"+session.getAttribute("patientUsername")+"','"+session.getAttribute("patientPassword")+"','"+"patient"+"','"+session.getAttribute("phone")+"' ,'"+"active"+"','"+ ++patientId +"')");
%>

<% 
	session.invalidate();
	response.sendRedirect("NewPatient.jsp");
%>
</body>
</html>