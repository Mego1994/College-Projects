<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>


<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Doctor Profile</title>
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<link rel="stylesheet" href="tooplate_style.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

</head>
<body>


	<div id="tooplate_main">
	<div id="tooplate_menu">

		<div id="home_menu"><a href="index.jsp"></a>
		</div>

		<ul>
			<li><a href="index.jsp" class="current">Home</a></li>
			<li><a href="about.jsp">About Us</a></li>

			<li><a href="contact.jsp">Contact</a></li>
			<li><a href="Logout.jsp">| Sign out</a></li>
		</ul>

	</div>
	<!-- end of tooplate_menu -->


		<h3 style="margin:50px 0 0 1000px;">Welcome, <strong><%=session.getAttribute("LoginUsername")%>&nbsp;&nbsp;</strong></h3>
		<div id="tooplate_content">
			<div class="col_w270 float_l">
				<!-- A form for entering tests information  -->
				<div id="contact_form" style="margin: -100px 0 0 -350px;">

					<!-- Profile table -->
					<br> <br>
				<br><br> 		<h3>My Profile</h3>
					
					<div  class="container">
				
    					<table style="width: 350px;">
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
        				ResultSet rs=statement.executeQuery("select * from doctor1");
        			try{		
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
        				
        				} catch(Exception e){
        					out.print("<script>"+"window.href(Signin.jsp);"+"</script>");
        				}
        				%>

							</tbody>
						</table>
					</div>
				

				</div>

			</div>

			
					<!-- A form for entering tests information  -->
				<div id="contact_form" style="margin:-310px 0 0 300px;">

						<!-- Profile table -->
						<br> <br>
						<br><br> 	<h3>My Patients</h3>

						<form method="post" id="viewResForm" name="viewResForm" action="#">
							<table style="margin-left: -200px;" border="0" cellspacing="0"
								style="width: 550px;">
								<tbody>
									<tr>
										<td><strong>From</strong> <input type="date"
											class="validate-bdate required input_field" name="fromdate"
											id="fromdate" /></td>

										<td><strong>To</strong> <input type="date"
											class="validate-bdate required input_field" name="todate"
											id="todate" /></td>

										<td>&nbsp;&nbsp;&nbsp;<input type="button"
											onclick="sendInfo()" value="      View Results" id="viewRes"
											name="viewRes" class="submit_btn float_l" /></td>
									</tr>
								</tbody>
							</table>
						</form>
						</div>
						
						<div id="contact_form">

						<section style="width: 700px; margin: -50px 0 0 150px;" class="">
						<div class="container">
							<table style="width: 700px;">
								<thead>
									<tr class="header">
										<th  style="width: 480px ;border: 1px solid #fff;">
											<div id="div1">Name</div>
										</th>
										<th style="width: 480px;">
											<div id="div1" style="border: 1px solid #fff;">Visit Date</div>
										</th>
												<th style="width: 480px;">
											<div id="div1" style= "border: 1px solid #fff;">ID</div>
										</th>
						
										<th style="width: 480px;">
											<div id="div1" style= "border: 1px solid #fff;">Click to view profile</div>
										</th>
						
									</tr>
								</thead>
								<tbody id="tbody">

									<%
    				//current date
        			try{
    					Date dateNow = new Date();
        				SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
        				String currentDate = dateFormat.format(dateNow);
        				
        				//date of previous week
        				Calendar cal = Calendar.getInstance();
        				cal.add(Calendar.DATE, -7);				//decrease 1 week from current date
        				String previousWeekDate = dateFormat.format(cal.getTime());
    				
        				String docLoginUsername = (String) session.getAttribute("LoginUsername");
        				ResultSet rs2;
        		
        				rs2 = statement.executeQuery("select * from insertpatient where visit_date <= '"+currentDate+"' and visit_date >= '"+previousWeekDate+"' ");
        			
        				
        				while(rs2.next())
            			{
        					//<a style='color:red;' target='_blank' href='DoctorviewPatient.jsp'>
            				out.println("<tr>");
            				out.println("<td><strong>"+rs2.getString("fname")+" "+rs2.getString("lname")+"</strong></td>");
            				out.println("<td><strong>"+rs2.getString("visit_date")+"</strong></td>");
            				out.println("<td><strong>"+rs2.getString("patientID")+"</strong></td>");
            			%>
            				
							<td style="color: red"><strong><a target='_blank' href='DoctorviewPatient.jsp?id=<%=rs2.getString("patientID")%>'><button>View Profile</button></a></strong></td>
							
        			
        				<%
        					out.println("</tr>");
        				}
            			
        			} catch(Exception e){
        					response.sendRedirect("Signin.jsp");
    				}
    				
        			%>
        			
					<script>
    					function sendInfo()  
    					{  
    						var from = document.getElementById('fromdate').value;
    						var to = document.getElementById('todate').value;
    				
    						var url = "doctor_patient.jsp?fromdate=" + from + "&todate=" + to;  
    				  
    						if(window.XMLHttpRequest){  
    						request=new XMLHttpRequest();
    						
    						} else if(window.ActiveXObject){  
    							request = new ActiveXObject("Microsoft.XMLHTTP");  
    						}  
    				  
    						try{  
    							request.onreadystatechange = getInfo;  
    							request.open("GET",url,true);  
    							request.send();  
    					
    						}catch(e){
    							alert("Unable to connect to server");
    						}  
    					}  
    				
    					function getInfo(){  
    						if(request.readyState == 4 && request.status == 200){  
    							var value = request.responseText;  
    							document.getElementById('tbody').innerHTML = value;  
    						}  
    					}  
    				
    				</script>

								</tbody>
							</table>
						</div>
						</section>


				



					</form>

				</div>

			</div>

			<div class="col_w270 float_r"></div>

		</div>
		<div id="tooplate_sidebar">



			<div class="cleaner_h60"></div>




		</div>

		<div class="cleaner"></div>
	</div>
<div class="cleaner_h60"></div>
            
	<div class="cleaner"></div>

	<div id="tooplate_footer_wrapper">

		<div id="tooplate_footer">

			Copyright � 2048 <a href="#">Top Secret Bio's</a> - Design: <a
				href="http://www.tooplate.com">tooplate</a>

		</div>
		<!-- end of tooplate_footer -->

	</div>


</body>
</html>
