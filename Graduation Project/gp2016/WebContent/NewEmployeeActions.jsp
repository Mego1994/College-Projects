<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<%
String Check = "";

// Collecting patient information from patient registration form.
String fname=request.getParameter("fname");
session.setAttribute("fname", fname);	//saving fname value to session.

String lname=request.getParameter("lname");
session.setAttribute("lname", lname);

String bdate=request.getParameter("bdate");
session.setAttribute("bdate", bdate);

String email=request.getParameter("email");
session.setAttribute("email", email);

String password=request.getParameter("password");
session.setAttribute("empPassword", password);

String username=request.getParameter("username");
session.setAttribute("empUsername", username);

String address=request.getParameter("address");
session.setAttribute("address", address);

String phone=request.getParameter("phone");
session.setAttribute("phone", phone);

String gender=request.getParameter("gender");
session.setAttribute("gender", gender);

String jobStartDate=request.getParameter("Job_start_date");
session.setAttribute("empJobStartDate", jobStartDate);

String salary=request.getParameter("salary");
session.setAttribute("empSalary", salary);

Class.forName("com.mysql.jdbc.Driver");
//change localhost password
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
Statement statement= con.createStatement();


if(request.getParameter("action").equals("insert")){
	response.sendRedirect("addEmployeeCheckPoint.jsp");
	
}else if(request.getParameter("action").equals("update")){
	//ResultSet rs=statement.executeQuery("select * from insertpatient");
	//while(rs.next()){	
		//if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
		//{
			Check = "update";
			response.sendRedirect("updateDeleteEmployeeCheckPoint.jsp");
		//}else 
			//out.print("<script>"+"window.location.href = 'index.jsp'"+"</script>");
	
}else if(request.getParameter("action").equals("view")){
	Check = "view";
	response.sendRedirect("viewEmployeeCheckPoint.jsp");

}else if(request.getParameter("action").equals("delete")){
	Check = "delete";
	response.sendRedirect("updateDeleteEmployeeCheckPoint.jsp");
}

else if(request.getParameter("action").equals("active")){
	Check = "active";
	response.sendRedirect("updateDeleteEmployeeCheckPoint.jsp");
}


session.setAttribute("Check", Check);


%>