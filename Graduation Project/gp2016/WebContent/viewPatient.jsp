<%@page import="com.sun.xml.internal.ws.server.sei.SEIInvokerTube"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%--     <%ResultSet rs4 =null;%> --%>
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

<%
	//check if patient's username and password are of any patient in DB.
	Class.forName("com.mysql.jdbc.Driver");
	//change localhsot password
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
	Statement statement= con.createStatement();
	//retrieving tests names from DB.
	ResultSet rs2=statement.executeQuery("select * from insertpatient");
%>

<div id="tooplate_main">
   <div id="tooplate_menu">
        	
            <div id="home_menu"><a href="index.jsp"></a></div>
                
            <ul>
                <li><a href="index.jsp" class="current">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                
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
		 out.print("<h3 style='margin:57px 0 0 1000px;'>Welcome, <a style='text-decoration: underline;' href='#'><strong >"+rs1.getString("fname")+" "+rs1.getString("lname")+" "+rs1.getString("phone")+" </strong></a></h3>");
	}

%>
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	    	<!-- A form for entering tests information  -->    
	        <div id="contact_form" style="margin:-20px 0 0 -350px;">
    		  
    			<!-- Profile table -->
        		<br><br>    <h3>Profile</h3>
				    	
						<div  class="container"> 
   					<table style="width: 300px;"> 
<!--       					<thead> -->
<!--         				<td class="header"> -->
        				
<!--           					<tr> -->
<!--                             <td><br><strong>Name</strong></td> -->
<!--                             </tr> -->
                            
<!--           				<tr> -->
<!--                             <td><br><strong>Birth Date</strong></td> -->
<!--                             </tr> -->
<!--           				<tr> -->
<!--                             <td><br><strong>Gender</strong></td> -->
<!--                             </tr> -->
<!--           				<tr> -->
<!--                             <td><br><strong>ID</strong></td> -->
<!--                             </tr> -->
          				
<!--         				</td> -->
<!--       					</thead> -->
      					<tbody>

        				<%
        				
        				ResultSet rs=statement.executeQuery("select * from insertpatient ");
        				
        				try{
        					while(rs.next()){
        						if(session.getAttribute("name").equals(rs.getString("fname")+" "+rs.getString("lname")) && session.getAttribute("bdate").equals(rs.getString("bdate"))) 
        						{	
        							String fname = rs.getString("fname");
                					session.setAttribute("patientFname", fname);
                				
                					String lname = rs.getString("lname");
                					session.setAttribute("patientLname", lname);
                				
                					String bdate = rs.getString("bdate");
                					session.setAttribute("patientBdate", bdate);
                				
                					String gender = rs.getString("gender");
                					session.setAttribute("patientGender", gender);
                				
                					String patientID = rs.getString("patientID");
                					session.setAttribute("PatientID", patientID);
                				
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
        							out.println("<td><strong> ID: "+rs.getString("patientID")+"</strong></td>");
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
					 <form method="post" name="update" action="updatePatient.jsp">	
						<br><input style="margin:-100 0 0 300px;" type="submit" value="Update" id="update" name="update" class="submit_btn float_l" />
						</form>
    		</div>	
    			
    			<div id="contact_form" style="margin:-322px 0 0 20px;">
    				<form method="post" name="resultTest" target="_blank" action="reportMailCall.jsp">	
    			<!-- Tests table -->
        		
        		<h3 style="color: red;"> Choose test to view PDF or recieve by Mail.</h3>
				    	<section style="width: 550px;" class="">
  						<div  class="container">
    					<table style="width: 550px;">
      					<thead>
        				<tr class="header">
          				<th style="width: 550px; border: 1px solid #fff;">
            			<div>Test</div>
          				</th>
          				<th style="width: 550px;">
            			<div style= "border: 1px solid #fff;">Date</div>
          				</th>
          				
        				</tr>
      					</thead>
      					<tbody>

      				<% 
      			//retrieving tests names from DB.
    				ResultSet rs4 = statement.executeQuery("select * from samples");
    				
    				try{
    					while(rs4.next())
    					{
    						if(session.getAttribute("name").equals(rs4.getString("fname")+" "+rs4.getString("lname")) && session.getAttribute("bdate").equals(rs4.getString("bdate")))
    						{
    							String tests = rs4.getString("tests");
    							String dates = rs4.getString("visitDate");
    							session.setAttribute("patientdates", dates);
    							if(tests != null){
    								String testsBracketsRemoved = tests.replaceAll("\\[", "").replaceAll("\\]","");
            						String[] testsCommaSplit = testsBracketsRemoved.split(",");
							
//             						String datesBracketsRemoved = dates.replaceAll("\\[", "").replaceAll("\\]","");
//             						String[] datesCommaSplit = datesBracketsRemoved.split(",");
								
            						String testAndDate;
							
            						int i = 0;
									
            						while( i< testsCommaSplit.length ){
    									out.println("<tr>");
        								out.println("<td><strong>"+testsCommaSplit[i]+"</strong></td>");
	    								out.println("<td><strong>"+dates+"</strong></td>");
	    							
// 	    								testAndDate = testsCommaSplit[i] + "," + datesCommaSplit[i]; 
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
						</section>
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
        <div class="col_w270 float_r">
        </div>
    
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