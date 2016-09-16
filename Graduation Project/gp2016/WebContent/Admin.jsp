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
<title>Complete Care Lab | Admin</title> 
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
                     <li><a href="Logout.jsp">Sign Out</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->

<h3 style="margin-left: 600px;">Welcome, <strong><%=session.getAttribute("LoginUsername")%>&nbsp;</strong><a style="text-decoration: underline;" href="Logout.jsp"><strong>Sign Out</strong></a></h3>
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	    	<!-- A form for entering tests information  -->    
	        <div id="contact_form">
    		  
    		  <!-- Profile table -->
<!--         		<br><br>    <h3>Welcome</h3> -->
<!-- 				    	<section style="width: 567px;" class=""> -->
<!--   						<div  class="container"> -->
    					<!-- <table style="width: 550px;">
      					<thead>
        				<tr class="header">
          				<th style="width: 480px;">
            			<div>Receptionists</div>
          				</th>
          				<th style="width: 480px;">
            			<div>Doctors</div>
          				</th>
          				<th style="width: 480px;">
            			<div>Patients</div>
          				</th>
        				</tr>
      					</thead> -->
      					<tbody>

        				<%
        				
//         				Class.forName("com.mysql.jdbc.Driver");
//         				//change localhsot password
//         				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
//         				Statement statement= con.createStatement();
//         				//retrieving tests names from DB.
//         				ResultSet rs=statement.executeQuery("select * from emloyee2");
        					
//         				while(rs.next())
//         				{
//         					out.println("<tr>");
//         					out.println("<td><strong>"+rs.getString("First name")+" "+rs.getString("Last name")+"</strong></td>");
//         					out.println("<td><strong>"+rs.getString("tele")+"</strong></td>");
//         					out.println("<td><strong>"+rs.getString("email")+"</strong></td>");
//         					out.println("</tr>");
        					
//         				}
        				%>
        				
<!--         				</tbody> -->
<!--     					</table> -->
<!--   						</div> -->
<!-- 						</section> -->
						
   		</div>	
    			
    			<div id="contact_form">
    			  <form method="post" name="addPatient" action="employeeManage.jsp">	
    									
						<br><input style="margin-left: 200px;" type="submit" value="    Manage Receptionists" id="addrec" name="addrec" class="submit_btn float_l" />
    			
    			</form>
    			
    			  <form method="post" name="adddoc" action="doctorManage.jsp">	
    									
						<br><input style="margin-left: 200px;" type="submit" value="    Manage Doctors" id="adddoc" name="adddoc" class="submit_btn float_l" />
    			
    			</form>
    			
    			 <form method="post" name="addPatient" action="NewPatient.jsp">	
    									
						<br><input style="margin-left: 200px;" type="submit" value="    Manage Patients" id="addPatient" name="addPatient" class="submit_btn float_l" />
    			
    			</form>
    			</div>
    			
        </div>
          <div class="cleaner_h60"></div>
        <div class="col_w270 float_r">
        </div>
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
    <%
//     Class.forName("com.mysql.jdbc.Driver");
// 	//change localhsot password
// 	java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
// 	Statement statement1= con1.createStatement();
	
	//inserting user information from patient registration form created in user.jsp into DB. 
    //statement1.executeUpdate("insert into insertpatient values ('"+fname+"','"+lname+"','"+bdate+"','"+email+"','"+username+"','"+password+"','"+address+"','"+phone+"','"+gender+"','"+drug+"' ,'"+diseases+"' ,'"+Comments+"')"); %>
    
</body>
</html> 