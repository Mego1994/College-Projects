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
<title>Complete Care Lab | Patient</title> 
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
                <li><a href="Logout.jsp">Sign out</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->
<div id="tooplate_main">
     <h3 style="margin:57px 0 0 1000px;">Welcome, <strong><%=session.getAttribute("LoginUsername")%>&nbsp;&nbsp;</strong></h3> 
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	    	<!-- A form for entering tests information  -->    
	        <div id="contact_form" style="margin-left:-350px;">
    		  
    			<!-- Profile table -->
        		   <h3>Profile</h3>		
        		   <div  class="container">
    			   <table style="width: 350px;">
      		
      				<tbody>

        				<%
        				
        				Class.forName("com.mysql.jdbc.Driver");
        				//change localhsot password
        				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
        				Statement statement= con.createStatement();
        				//retrieving tests names from DB.
        				ResultSet rs=statement.executeQuery("select * from insertpatient");
        				
        				try{
        					while(rs.next()){
        						if(session.getAttribute("LoginUsername").equals(rs.getString("username")) && session.getAttribute("LoginPassword").equals(rs.getString("password"))) 
        						{	
        							String fname = rs.getString("fname");
                					session.setAttribute("patientFname", fname);
                				
                					String lname = rs.getString("lname");
                					session.setAttribute("patientLname", lname);
                				
                					String bdate = rs.getString("bdate");
                					session.setAttribute("patientBdate", bdate);
                				
                					String gender = rs.getString("gender");
                					session.setAttribute("patientGender", gender);
                				
                					String docUsername = rs.getString("doc_username");
                					session.setAttribute("patientDocUsername", docUsername);
                				
        							out.println("<tr>");
        							out.println("<td><strong> Name: "+rs.getString("fname")+" "+rs.getString("lname")+"</strong></td>");
        							out.println("</tr>");
        							out.println("<tr>");
        							out.println("<td><strong> Birth Date: "+rs.getString("bdate")+"</strong></td>");
        							out.println("</tr>");
        							out.println("<tr>");
        							out.println("<td><strong> Gender: "+rs.getString("gender")+"</strong></td>");
        							out.println("</tr>");
        							out.println("<tr>");
        							out.println("<td><strong> Diseases: "+rs.getString("value")+"</strong></td>");
        							out.println("</tr>");
        						}
        					}
        				
        				} catch(Exception e){
        					out.print("<script>"+"window.href(Signin.jsp);"+"</script>");
        				}
        				
        				
        				%>
        				
        				</tbody>
    					</table>
  						</div>
					
						
    		</div>	
    			
    		 	<div id="contact_form" style="margin:-240px 0 0 100px;">

    				<form method="post" name="resultTest" target="_blank" action="reportMail.jsp">	
    			<!-- Tests table -->
   
        		<h3 style="color: red;">Choose tests to view PDF or recieve by Mail.</h3>
		        	
<!-- 				    	<section style="width: 567px;" class=""> -->
  						<div  class="container">
    					<table style="width: 400px;">
      					<thead>
        				<tr>
        			
          				<td style="width: 350px;"><strong>Test</strong></td>
            			<td style="width: 350px;"><strong>Date</strong></td>
          		
<!--           				<td style="width: 480px;"> -->
<!--             			<div>Date</div> -->
<!--           				</td> -->
          				
                
        				</tr>
      					</thead>
      					<tbody>

        				<%
        				
        				//retrieving tests names from DB.
        				ResultSet rs2 = statement.executeQuery("select * from samples");
        				
        				try{
        					while(rs2.next())
        					{
        						if(session.getAttribute("LoginUsername").equals(rs2.getString("username")) && session.getAttribute("LoginPassword").equals(rs2.getString("password")))
        						{
        							String tests = rs2.getString("tests");
        							String dates = rs2.getString("visitDate");
        							session.setAttribute("patientdates", dates);
        							
        						
        							if(tests != null){
        								String testsBracketsRemoved = tests.replaceAll("\\[", "").replaceAll("\\]","");
                						String[] testsCommaSplit = testsBracketsRemoved.split(",");
								
//                 						String datesBracketsRemoved = dates.replaceAll("\\[", "").replaceAll("\\]","");
//                 						String[] datesCommaSplit = datesBracketsRemoved.split(",");
									
                						String testAndDate;
								
                						int i = 0;
										
                						while( i< testsCommaSplit.length ){
        									out.println("<tr>");
	        								out.println("<td><strong>"+testsCommaSplit[i]+"</strong></td>");
    	    								out.println("<td><strong>"+dates+"</strong></td>");
    	    							
    	    								testAndDate = testsCommaSplit[i] + "," + dates; 
    	    								//String url = "report.jsp?testName=" + testsCommaSplit[i];
        				
        									out.println("</tr>");
        									i++;
										}
        							}
        						}
        					
        				}
        					
        				} catch(Exception e){
        					response.sendRedirect("Signin.jsp");
        				}
        				
        				%>
        				
        				
        				</tbody>
    					</table>
  						</div>
					
						<table >
						<br>
						<tr>
						<td style= "border: 1px solid #fff;"><button style="margin-left: 400px;" type="submit"  id="pdf" name="pdf"><img src="images/pdf.ico" alt="View PDF file" /></button></td>
    					<td style= "border: 1px solid #fff;"><button style="margin-left: -150px;" type="submit"  id="mail" name="mail"><img src="images/mail.png" alt="Send by Mail" /></button></td>
    					</tr>
    					
    					</table>
    			</form>
    			</div>
    			
    		   
    			
        </div>
           <div class="cleaner_h60"></div> 	
     
       <div class="cleaner_h60"></div> 	
    </div>
   	
       
            

        
        </div>
        
		
</div>



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