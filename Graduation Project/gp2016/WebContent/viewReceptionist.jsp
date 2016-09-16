<%@page import="com.sun.xml.internal.ws.server.sei.SEIInvokerTube"%>
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
<title>Complete Care Lab | View Employee</title> 
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<link rel="stylesheet" href="tooplate_style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

</head>
<body> 

<%
Class.forName("com.mysql.jdbc.Driver");
//change localhsot password
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
Statement statement= con.createStatement();
//retrieving tests names from DB.
%>


 <div id="tooplate_main">
        <div id="tooplate_menu">
        	
            <div id="home_menu"><a href="index.jsp"></a></div>
                
            <ul>
                <li><a href="index.jsp" class="current">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                     <li><a href="Logout.jsp"> Sign out</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->

	<div id="tooplate_content">
        <div class="col_w270 float_l">
	    	<!-- A form for entering tests information  -->    
	        <div id="contact_form">
    		  
    			<!-- Profile table -->
        		<br><br>    <h3>Profile</h3>
				    
  						<div  class="container">
    						<table style="width: 350px;">
<!-- 				    	<section style="width: 567px;" class=""> -->
<!--       					<thead> -->
<!--         				<tr class="header"> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Name</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Username</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Age</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Gender</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Email</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Job Start Date</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Activity</div> -->
<!--           				</th> -->
          				
<!--         				</tr> -->
<!--       					</thead> -->
      					<tbody>

        				<%
        				
        				ResultSet rs=statement.executeQuery("select * from emloyee2 where username = '"+session.getAttribute("empUsername")+"' or fname = '"+session.getAttribute("fname")+"' and lname = '"+session.getAttribute("lname")+"'");
        				while(rs.next())
        				{
        				out.println("<tr>");
						out.println("<td><strong style='color:red;'> Name: "+rs.getString("fname")+" "+rs.getString("lname")+"</strong></td>");
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
						
						out.println("<tr>");
						out.println("<td></td>");
						
						out.println("</tr>");
					}
        				%>
        				
        				</tbody>
    					</table>
  						</div>
					
						
    		</div>	
    			
    			
        </div>
        
        <div class="col_w270 float_r">
        </div>
    
    </div>
        <div id="tooplate_sidebar">
        
          
            
            <div class="cleaner_h60"></div>
            
         
        </div>
          
            <div class="cleaner_h60"></div>
		<div class="cleaner"></div>
</div>
  
            <div class="cleaner_h60"></div>
    <div class="cleaner"></div>  

<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright � 2048 <a href="#">Top Secret Bio's</a> - Design: <a href="http://www.tooplate.com">tooplate</a>
    
    </div> <!-- end of tooplate_footer -->

</div> 
    
</body>
</html> 