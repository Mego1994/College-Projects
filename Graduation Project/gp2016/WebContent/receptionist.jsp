
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Employee</title> 
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<link rel="stylesheet" href="tooplate_style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

</head>
<body> 
<div id="tooplate_main">


        <div id="tooplate_menu">
        	
            <div id="home_menu"><a href="index.jsp"></a></div>
                
            <ul>
                <li><a href="index.jsp" class="current">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="Signin.jsp">| Sign in</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->

<h3 style="margin-left: 600px;">Welcome, <strong><%=session.getAttribute("LoginUsername")%>&nbsp;</strong><a style="text-decoration: underline;" href="Logout.jsp"><strong>Sign Out</strong></a></h3>
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	    	<!-- A form for entering tests information  -->    
	        <div id="contact_form" style="width: 1000px;">
    		  
    			<!-- Profile table -->
        		<br><br>    <h3 style="margin-left: -200px;">My Profile</h3>
<!-- 				    	<section style="width: 1000px; margin-left: -300px;" class=""> -->
  						<div  class="container">
    					<table style="width: 450px; ">
<!--       					<thead> -->
<!--         				<tr class="header"> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Name</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Telephone</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Email</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Gender</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Birth Date</div> -->
<!--           				</th> -->
<!--           				<th style="width: 500px;"> -->
<!--             			<div>Job Start Date</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Address</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Salary</div> -->
<!--           				</th> -->
<!--         				</tr> -->
<!--       					</thead> -->
      					<tbody>

        				<%
						//receptionist profile        				
        				Class.forName("com.mysql.jdbc.Driver");
        				//change localhsot password
        				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
        				Statement statement= con.createStatement();
        				//retrieving tests names from DB.
        				ResultSet rs=statement.executeQuery("select * from emloyee2");
        					
        				while(rs.next())
        				{
        					if(session.getAttribute("LoginUsername").equals(rs.getString("username")) && session.getAttribute("LoginPassword").equals(rs.getString("password"))) 
        					{
        						out.println("<tr>");
        						out.println("<td><strong> Name: "+rs.getString("fname")+" "+rs.getString("lname")+"</strong></td>");
        						out.println("</tr>");
        						out.println("<tr>");
        						out.println("<td><strong>Phone: "+rs.getString("tele")+"</strong></td>");
        						out.println("</tr>");
        						out.println("<tr>");
        						out.println("<td><strong>Email: "+rs.getString("email")+"</strong></td>");
        						out.println("</tr>");
        					
        						out.println("<tr>");
        						out.println("<td><strong>Age: "+rs.getString("age")+"</strong></td>");
        						out.println("</tr>");
        						out.println("<tr>");
        						out.println("<td><strong>Job Start Date: "+rs.getString("job_startdate")+"</strong></td>");
        						out.println("</tr>");
        						out.println("<tr>");
        						out.println("<td><strong>Address: "+rs.getString("address")+"</strong></td>");
        						
        						out.println("</tr>");
        					}
        				}
        				%>
        				
        				</tbody>
    					</table>
  						</div>
						</section>
						
    		</div>	
    			
    			</div>
    			
    			<div id="contact_form">
    				<br><br><br><h3 style="margin-left: -200px;">Actions</h3>
    				
    		
    			  <form method="post" name="addPatient" action="NewPatient.jsp">	
    									
						<br><input style="margin-left: -200px;" type="submit" value="Add Patient" id="addPatient" name="addPatient" class="submit_btn float_l" />
    			
    			</form>
    			
    			 <form method="post" name="checkPatient" action="Signin_emp.jsp">	
    									
						<input style="margin-left: 50px;" type="submit" value="Check Patient" id="checkPatient" name="checkPatient" class="submit_btn float_l" />
    			
    			</form>
    			
    			 <form   method="post" name="available" target="_blank" action="availableResults.jsp">	
    									
						<input style= " margin:-40px 0 0 300px; " type="submit" value="Available Results" id="availableResults" name="availableResults" class="submit_btn float_l" />
    			
    			</form>
    			
    			
    			<form   method="post" name="sample" target="_blank" action="searchSampleCode.jsp">	
    									
						<input style= " margin:-40px 0 0px 500px; " type="submit" value="Search Sample Code" id="sample" name="sample" class="submit_btn float_l" />
    			
    			</form>
    			
        </div>
        
        <div class="col_w270 float_r">
        </div>
    
    </div>
     
        
            <div class="cleaner_h60"></div>
            
    
        
		<div class="cleaner"></div>
</div>

    <div class="cleaner"></div>  

<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright � 2048 <a href="#">Top Secret Bio's</a> - Design: <a href="http://www.tooplate.com">tooplate</a>
    
    </div> <!-- end of tooplate_footer -->

</div> 
    <%
    Class.forName("com.mysql.jdbc.Driver");
	//change localhsot password
	java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
	Statement statement1= con1.createStatement();
	
	//inserting user information from patient registration form created in user.jsp into DB. 
    //statement1.executeUpdate("insert into insertpatient values ('"+fname+"','"+lname+"','"+bdate+"','"+email+"','"+username+"','"+password+"','"+address+"','"+phone+"','"+gender+"','"+drug+"' ,'"+diseases+"' ,'"+Comments+"')"); %>
    
</body>
</html> 