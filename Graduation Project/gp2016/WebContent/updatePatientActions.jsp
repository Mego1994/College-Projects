<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

//Collecting patient information from patient registration form.
String fname=request.getParameter("fname");
session.setAttribute("fname", fname);	//saving fname value to session.

String lname=request.getParameter("lname");
session.setAttribute("lname", lname);

String bdate=request.getParameter("bdate");
session.setAttribute("bdate", bdate);

String email=request.getParameter("email");
session.setAttribute("email", email);

String username=request.getParameter("username");
session.setAttribute("patientUsername", username);

String password=request.getParameter("password");
session.setAttribute("patientPassword", password);

String item=request.getParameter("item");
session.setAttribute("item", item);

String address=request.getParameter("address");
session.setAttribute("address", address);

String phone=request.getParameter("phone");
session.setAttribute("phone", phone);

String gender=request.getParameter("gender");
session.setAttribute("gender", gender);

String lpdate=request.getParameter("lpdate");
session.setAttribute("lpdate", lpdate);

String referingdoc=request.getParameter("referingdoc");
session.setAttribute("referingdoc", referingdoc);

String drug=request.getParameter("drug");
session.setAttribute("drug", drug);

String fasting=request.getParameter("fasting");
session.setAttribute("fasting", fasting);

String fhours=request.getParameter("fhours");     
session.setAttribute("fhours", fhours);

String Comments=request.getParameter("Comments");
session.setAttribute("Comments", Comments);

String value="";
if(request.getParameterValues("diseases") != null){
	  String[] diseases =request.getParameterValues("diseases");
         for(int p=0;p<diseases.length;p++)
         {
             value += diseases[p]+",";
         }
session.setAttribute("value", value);
}


Class.forName("com.mysql.jdbc.Driver");
//change localhost password
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
Statement statement= con.createStatement();
ResultSet rs=statement.executeQuery("select * from insertpatient");
// 	//while(rs.next()){	
// 		//if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
// 		//{
			
		
			if(fname != "")
				statement.executeUpdate("update insertpatient set fname='"+fname+"' where patientID='"+session.getAttribute("PatientID")+"'");
			
			if(lname != "")
				statement.executeUpdate("update insertpatient set lname='"+lname+"' where patientID='"+session.getAttribute("PatientID")+"'");
			
			if(gender != null)
				statement.executeUpdate("update insertpatient set gender='"+gender+"'where patientID='"+session.getAttribute("PatientID")+"'");
			
			if(lpdate != null)
				statement.executeUpdate("update insertpatient set lpdate='"+lpdate+"' where patientID='"+session.getAttribute("PatientID")+"'");
			
			
			if(bdate != "")
				statement.executeUpdate("update insertpatient set bdate='"+bdate+"' where patientID='"+session.getAttribute("PatientID")+"'");
			
			if(email != "")
			    statement.executeUpdate("update insertpatient set email='"+email+"' where patientID='"+session.getAttribute("PatientID")+"'");
		
			if(address != "")
				statement.executeUpdate("update insertpatient set address='"+address+"' where patientID='"+session.getAttribute("PatientID")+"'");
			
			if(phone != ""){
				statement.executeUpdate("update insertpatient set phone='"+phone+"' where patientID='"+session.getAttribute("PatientID")+"'");
				statement.executeUpdate("UPDATE roles SET tele = "+phone+" where patientID='"+session.getAttribute("PatientID")+"'");
			}
			
		
			if(referingdoc != "")
				statement.executeUpdate("update insertpatient set refdoc='"+referingdoc+"'where patientID='"+session.getAttribute("PatientID")+"'");
			
			if(fasting != null)
				statement.executeUpdate("update insertpatient set fasting='"+fasting+"'where patientID='"+session.getAttribute("PatientID")+"'");
			
			if(fhours != null)
				statement.executeUpdate("update insertpatient set fhours='"+fhours+"' where patientID='"+session.getAttribute("PatientID")+"'");
			
			
			if(drug != null)
				statement.executeUpdate("update insertpatient set drugTherapy='"+drug+"' where patientID='"+session.getAttribute("PatientID")+"'");
			
			if(item != "")
				statement.executeUpdate("update insertpatient set doc_username='"+item+"' where patientID='"+session.getAttribute("PatientID")+"'");

			if(value!= null)
				statement.executeUpdate("update insertpatient set diseases='"+value+"' where patientID='"+session.getAttribute("PatientID")+"'");

			if(Comments != "")
				statement.executeUpdate("update insertpatient set comments='"+Comments+"' where patientID='"+session.getAttribute("PatientID")+"'");

			response.sendRedirect("next_step_update.jsp");
%>
</body>
</html>