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
<title>Complete Care Lab | Test Results</title> 
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<link rel="stylesheet" href="tooplate_style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

</head>
<body> 


        
       
        



 <div id="tooplate_menu">
        	
            <div id="home_menu"><a href="index.jsp"></a></div>
                
            <ul>
                <li><a href="index.jsp" class="current">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
               
                <li><a href="contact.jsp">Contact</a></li>
                     <li><a href="Logout.jsp">Sign out</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->
<%

				
String sample_details=request.getParameter("sample_details");
session.setAttribute("sample_details", sample_details);

String sampledate=request.getParameter("sampledate");
session.setAttribute("sampledate", sampledate);

String time=request.getParameter("time");
session.setAttribute("time", time);

				ArrayList diseases = new ArrayList();

				if(request.getParameter("high")!= null)
					diseases.add(request.getParameter("high"));
					
				if(request.getParameter("dia")!= null)
					diseases.add(request.getParameter("dia"));
						
				if(request.getParameter("low")!= null)
					diseases.add(request.getParameter("low"));
							
				if(request.getParameter("heart")!= null)
					diseases.add(request.getParameter("heart"));
					
				if(request.getParameter("heamo")!= null)
					diseases.add(request.getParameter("heamo"));
				
				session.setAttribute("diseases", diseases);
					
				%>

<div id="tooplate_main">
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	        
	        <div id="contact_form">
    		  <form method="post" name="contact" action="#">	
    			<br><section style="width: 800px; margin-left: -50px;" class="">
  				<div  class="container">
    			<table style="width: 783px;">
      		    <thead>
        		<tr class="header">
          		<th style="width: 350px; ">
            	<div>Test</div>
          		</th>
          		<th style="width: 150px;">
            	<div>Result</div>
          		</th>
          		<th style="width: 100px;">
            	<div>Unit</div>
          		</th>
          		<th style="width: 350px;">
            	<div>Range</div>
          		</th>
          		<th style="width: 350px;">
            	<div>Test Date</div>
          		</th>
          		<th>
          		<div><input type="checkbox" id="all" name="all" value="all"/></div>
          		<script type="text/javascript">
				$("#all").click(function(){
					if ($('#all').is(':checked')==true) {
						$( 'input:checkbox' ).prop('checked', true);
        			}else
        				$( 'input:checkbox' ).prop('checked', false);
    				});	
				</script>
          		</th>
        		</tr>
      			</thead>
      			<tbody>
      			
				
			<%	
			Class.forName("com.mysql.jdbc.Driver");
			//change localhsot password
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
			Statement statement= con.createStatement();
			
			//ArrayList tests = new ArrayList();
			//ArrayList codes = new ArrayList();
			
			if(request.getParameter("checkbox") != null)
				//tests.add(request.getParameter("checkbox"));
			
					out.println("<tr>");
					out.println("<td style='color:blue;'><strong>"+session.getAttribute("checkbox")+"</strong></td>");
					out.println("<td style='color:red;'></td>");
					out.println("<td>"+""+"</td>");
					out.println("<td>Fasting: 70�110 mg/dL</td>"); 	//Range
					out.println("<td></td>");
					out.println("<td><input type='checkbox' id='p_glucose' name='p_glucose' value='p_glucose'/></td>");
					out.println("</tr>");
			  
					
					
				//try{
				//statement.executeUpdate("insert into insertpatient values ('"+session.getAttribute("fname")+"','"+session.getAttribute("lname")+"','"+session.getAttribute("bdate")+"','"+session.getAttribute("email")+"','"+session.getAttribute("username")+"','"+session.getAttribute("password")+"','"+session.getAttribute("address")+"','"+session.getAttribute("phone")+"','"+session.getAttribute("gender")+"','"+session.getAttribute("sample_details")+"','"+session.getAttribute("sampledate")+"','"+session.getAttribute("time")+"','"+session.getAttribute("drug")+"' ,'"+session.getAttribute("diseases")+"' ,'"+session.getAttribute("")+"' ,'"+"codes"+"' ,'"+"12234"+"', '"+session.getAttribute("Comments")+"')");
				//}catch(Exception e){
				//	ResultSet rs=st.executeQuery("select * from test where email='"+email+"'");
				//	if(rs.next()){
				//		out.print("<script>"+"alert('email found');"+"</script>");
				//		out.print("<script>"+"window.history.back();"+"</script>");
				//	}
					
				//}
				%>
      			
 				</tbody>
				</table>
				</div>
				</section>
				
				<br><input style="margin-left: 500px;" type="submit" value="Print" id="print" name="print" class="submit_btn float_l" />
    			</form>
    			
			</div>           
        
        </div>
        
        <div class="col_w270 float_r">
        </div>
    
    </div>
        <div id="tooplate_sidebar">
        
            <h2>Our Services</h2>
            
            <ul class="tooplate_list">
            <li><a href="user.jsp">Sample Entering</a></li>
            <li><a href="barcode.jsp">Sample Tracking</a></li>
            <li><a href="results.jsp">Sample Results</a></li>
            </ul>
            
            
            <div class="cleaner_h60"></div>
            
            <h2>Call Us</h2>
            
            <blockquote>
            <p>0123456789</p>
            
            <cite>Top Secret Bio's - <span>Web designer</span></cite>
            </blockquote>
            
        
        
        </div>
        
		<div class="cleaner"></div>
</div>

    <div class="cleaner"></div>  

<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright � 2048 <a href="#">Top Secret Bio's</a> - Design: <a href="http://www.tooplate.com">tooplate</a>
    
    </div> <!-- end of tooplate_footer -->

</div> 
    
</body>
</html> 