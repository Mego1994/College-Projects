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
<title>Complete Care Lab | Home</title> 
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<link rel="stylesheet" href="tooplate_style.css" type="text/css">


</head>
<body> 
	<div id="tooplate_main">

<div id="tooplate_middle_wrapper1">
	

			        <h1 style=" margin-left:10px;">Complete Care</h1>
			 <h1> Medical Laboratories </h1>  
	           <h1 style=" font-size: 22px; margin:-100px 0 0 1000px;"> Call Us </h1> 
	           <blockquote>
	            <h1 style=" font-size: 20px; margin:-5px 0 0 1000px;"> 0123456789 </h1> 
		</div>

   
        <div id="tooplate_menu">
        	
            <div id="home_menu"><a href="index.jsp"></a></div>
                
            <ul>
                <li><a href="index.jsp" class="current">Home</a></li>
                  <li><a href="Tests.jsp">Tests</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                 <li><a href="Signin.jsp">| Sign in</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->

	<br><br>             <h3 style=" margin-left:300px;">Available Tests </h3>
				    	<section style="width: 567px; margin: 20px 400px; class="">
  						<div  class="container">
    					<table style="width: 550px;">
      					<thead>
        				<tr class="header">
          				<th style="width: 480px;">
            			<div>Tests</div>
          				</th>
          			
        				</tr>
      					</thead>
      					<tbody>
      				
      					
      						<%
        				
        				Class.forName("com.mysql.jdbc.Driver");
        				//change localhsot password
        				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
        				Statement statement= con.createStatement();
        				//retrieving tests names from DB.
        				ResultSet rs=statement.executeQuery("select * from tests_db");
        					
        				while(rs.next())
        				{
        					out.println("<tr>");
        					out.println("<td><strong>"+rs.getString("name")+"</strong></td>");
        					
        					out.println("</tr>");
        					
        					
        				}
        				%>

    </tbody>
    					</table>
  						</div>
						</section>
    <div id="tooplate_content">
    <div class="col_w270 float_r">
        

      
			       
        
        </div>
           
  
		
     
        
     
         
     
        <div class="cleaner_h30"></div>
        
        <div class="col_w270 float_l">
	        
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