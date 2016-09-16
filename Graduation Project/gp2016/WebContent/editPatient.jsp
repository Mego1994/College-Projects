<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<%
//Generating random number to use for barcode generetor.
Random rand = new Random();
int n = rand.nextInt(90000) + 10000;
%>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Edit Patient</title> 
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
                     <li><a href="Logout.jsp">| Sign out</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->

<%
 	Class.forName("com.mysql.jdbc.Driver");
 	//change localhost password
 	java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
 	Statement statement1= con1.createStatement();

	//retrieving tests names from DB.
	ResultSet rs1=statement1.executeQuery("select * from insertpatient where '"+session.getAttribute("name")+"' = fullName");

	while(rs1.next()){
		out.print("<h3 style='margin-left: 600px;'>Welcome, <a style='text-decoration: underline;' href='#'><strong>"+rs1.getString("fname")+" "+rs1.getString("lname")+" "+rs1.getString("phone")+" </strong></a></h3>");
	}

%>
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	    	<!-- A form for entering tests information  -->    
	        <div id="contact_form">
    		  <form method="post" name="contact" action="tests_results.jsp">	
    		  
    		  	<table>
				<tbody>
				<tr>
                            <td><br><strong>Sample Details:</strong></td>
                            <td width="268"><br><input type="radio" name="sample_details" value="Fasting"> Fasting</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sample_details" value="Non-fasting"> Non-fasting</input></td>
                            </tr>  
                            
                            <tr>
                            <td width="312"><strong>Date:</strong></td>
                            <td><input type="date" class="validate-bdate required input_field" name="sampledate" id="sampledate"/></td>
                            </tr>
                            
                            <tr>
                            <td width="312"><strong>Time:</strong></td>
                            <td><input type="time" class="validate-bdate required input_field" name="time" id="time"/></td>
                            </tr>
                            
                            
                            	<!--Barcode form-->
				<form action="create.php" method="post">
                          <br>
                          Sample code <input type="text" name="datatoencode" value="<%=n%>"/>
                          <input id="barcode_submit" onclick="open" type="submit" name="barcode" value="barcode"/>
                          </form>
				</tbody>
				</table>
				
				
    			<!-- Tests table -->
        		<br><br>    <h3><strong>Choose Tests</strong></h3>
				    	<section style="width: 567px; class="">
  						<div  class="container">
    					<table style="width: 550px;">
      					<thead>
        				<tr class="header">
          				<th style="width: 480px;">
            			<div>Tests</div>
          				</th>
          				<th>
          				<div><input id="searchText" style="width: 100px;" type="text" placeholder="Search Test"></div>
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
        					out.println("<td>"+"<input name='checkbox' type='checkbox'/>"+"</td>");
        					out.println("</tr>");
        					
        					if (request.getParameter("checkbox") != null){
        						String testName = (String)rs.getString("name");
        						session.setAttribute("testName", testName);
        					}
        					
        				}
        				%>
        				
        				</tbody>
    					</table>
  						</div>
						</section>
				      			
				<br><input style="margin-left: 500px;" type="submit" value="Order" id="order" name="order" class="submit_btn float_l" />
    			</form>
    			
			</div>           
        
        </div>
        
        <div class="col_w270 float_r">
        </div>
    
    </div>
       
            
            <div class="cleaner_h60"></div>
            
          
            
            </blockquote>
            
        
        </div>
        
		<div class="cleaner"></div>


    <div class="cleaner"></div>  

<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright � 2048 <a href="#">Top Secret Bio's</a> - Design: <a href="http://www.tooplate.com">tooplate</a>
    
    </div> <!-- end of tooplate_footer -->

</div> 
    
</body>
</html> 