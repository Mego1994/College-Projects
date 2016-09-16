<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<%!
public static String generateRandom(int length) {
    Random random = new Random();
    char[] digits = new char[length];
    digits[0] = (char) (random.nextInt(9) + '1');
    for (int i = 1; i < length; i++) {
        digits[i] = (char) (random.nextInt(10) + '0');
    }
    return new String(digits);
}

%>

<%
		//current date
		Date dateNow = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat ("dd-MM-yyyy");
		String currentDate = dateFormat.format(dateNow);
		
		String barCode= generateRandom(12);
	%>
	
<%String datatoencode=request.getParameter("datatoencode");
        				session.setAttribute("datatoencode", datatoencode);
        				%>
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

     <h3 style="margin:57px 0 0 1000px;">Welcome, <a style="text-decoration: underline;" href="#"><strong><%=session.getAttribute("patientUsername")%></strong></a></h3> 
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	    	<!-- A form for entering tests information  -->    
	        <div id="contact_form" style="margin:-100px 0 0 -350px;">
    		  
    			<!-- Profile table -->
        		<br><br>    <h3>Profile</h3>
<!-- 				    	<section style="width: 567px;" class=""> -->
  						<div  class="container">
    					<table style="width: 300px;">
<!--       					<thead> -->
<!--         				<tr class="header"> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Name</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Birth Date</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Gender</div> -->
<!--           				</th> -->
<!--           				<th style="width: 480px;"> -->
<!--             			<div>Diseases</div> -->
<!--           				</th> -->
<!--         				</tr> -->
<!--       					</thead> -->
      					<tbody>

        				<%
        					Class.forName("com.mysql.jdbc.Driver");
        					//change localhsot password
        					java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","root");
        					Statement statement= con.createStatement();
        					
							ResultSet rs = statement.executeQuery("select * from insertpatient");
        					
        					while(rs.next()){
        						if(session.getAttribute("PatientID").equals(rs.getString("patientID"))){
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
        						
        					//modify diseases to be from DB not from session
        					
        					out.println("</tr>");
        				
        				%>
        				
        				</tbody>
    					</table>
  						</div>
<!-- 						</section> -->
						
    		</div>	
    			
    			
    			<div id="contact_form" style="margin:-280px 0 0 20px;">
    			  <form method="post" name="resultTest" action="updatedmsg.jsp">	
    			<!-- Tests table -->
        		<br><br>    <h3>Test Results</h3>
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
        				
        				//current date
//         				Date dateNow = new Date();
//         				SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
//         				String currentDate = dateFormat.format(dateNow);
        				
        				ArrayList tests = new ArrayList();
        				ArrayList dates = new ArrayList();
        				int [] Price = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        				//retrieving tests names from DB.
        				ResultSet rs2 = statement.executeQuery("select * from tests_db");
        				
        				int id = 0;
        				String checkboxID;
        				String checkboxValue;
        				
        				String testDateID;
        				String testDateIDValue;
        				String checkbox2ID;
        				String checkbox2Value;
        				
        				int sum =0;
        				while(rs2.next()){
        					testDateID = "testdate" + id;
        					testDateIDValue = request.getParameter(testDateID);
        					checkboxID = "checkbox" + id;
        					checkboxValue = request.getParameter(checkboxID);
        					checkbox2ID= "checkbox2" + id;
        					checkbox2Value=request.getParameter(checkbox2ID);
        					if(checkboxValue != null&&checkbox2Value!=null)
        					{
        						tests.add(checkboxValue);
        						dates.add(testDateIDValue);
        						Price[id] = Integer.valueOf(checkbox2Value);
        						checkboxValue = null;
        						checkbox2Value = null;
        					}
        					
        					id++;
        				}
        				for ( int i=0;i<Price.length;i++)
            				
       				 {
       					        				  
						//	int value = Integer.valueOf(Price[i]);        					  
       					sum+=  Price[i];
       					  
       				 }
        				if(tests.size() != 0)
//         					statement.executeUpdate("update insertpatient set tests='"+tests+"', test_date= '"+dates+"'  where patientID='"+session.getAttribute("PatientID")+"'");
        					
        				statement.executeUpdate("insert into samples values ( '"+session.getAttribute("PatientID")+"', '"+barCode+"','"+tests+"',  '"+currentDate+"' , '"+session.getAttribute("fasting")+"', '"+session.getAttribute("fhours")+"','"+session.getAttribute("fname")+"','"+session.getAttribute("lname")+"','"+session.getAttribute("bdate")+"','"+session.getAttribute("patientUsername")+"','"+session.getAttribute("patientPassword")+"')");
    					
        				//retrieving tests and dates from insertpatient table 
        				ResultSet rs3 = statement.executeQuery("select * from samples");
        				while(rs3.next()){
    						if(session.getAttribute("PatientID").equals(rs3.getString("patientID"))){
    				
    							String testsDB = rs3.getString("tests");
    							String datesDB = rs3.getString("visitDate");
    						
    							if(tests != null){
    								String testsBracketsRemoved = testsDB.replaceAll("\\[", "").replaceAll("\\]","");
            						String[] testsCommaSplit = testsBracketsRemoved.split(",");
							
//             						String datesBracketsRemoved = datesDB.replaceAll("\\[", "").replaceAll("\\]","");
//             						String[] datesCommaSplit = datesBracketsRemoved.split(",");
								
            						String testAndDate;
							
            						int i = 0;
									
            						while( i< testsCommaSplit.length ){
    									out.println("<tr>");
        								out.println("<td><strong>"+testsCommaSplit[i]+"</strong></td>");
	    								out.println("<td><strong>"+datesDB+"</strong></td>");
	    								
	    								out.println("</tr>");
    									i++;
									}
    							}
	    						
							}
        				}
        				
        				if(request.getParameter("datatoencode") != null)
        					statement.executeUpdate("update insertpatient set sample_code='"+request.getParameter("datatoencode")+"' where patientID='"+session.getAttribute("PatientID")+"'");
        				
//         				if(request.getParameter("sample_details") != null)
//         					statement.executeUpdate("update insertpatient set sample_code='"+request.getParameter("sample_details")+"' where patientID='"+session.getAttribute("PatientID")+"'");
        				
//         				if(request.getParameter("sampledate") != "")
//         					statement.executeUpdate("update insertpatient set sample_date='"+request.getParameter("sampledate")+"' where patientID='"+session.getAttribute("PatientID")+"'");
        				
        				if(request.getParameter("time") != "")
        					statement.executeUpdate("update insertpatient set sample_time='"+request.getParameter("time")+"' where patientID='"+session.getAttribute("PatientID")+"'");
        				
        				%>
        				
        				</tbody>
    					</table>
  						</div>
						</section>
						
						
                             <%
                             
                             Class.forName("com.mysql.jdbc.Driver");
             				//change localhsot password
             				java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","root");
             				Statement statement1= con1.createStatement();
                             ResultSet rs1 = statement.executeQuery("select * from tests_db");
                             String checkbox3ID;
             				String checkbox3Value;
             				String checkbox4ID;
            				String checkbox4Value;
            				String Discount="0";
            				double afterDiscount=0;
            				while(rs1.next())
            				{
                             checkbox3ID= "checkbox3" + id;
         					checkbox3Value=request.getParameter(checkbox3ID);
         					checkbox4ID= "checkbox4" + id;
        					checkbox4Value=request.getParameter(checkbox4ID);
        					if(checkbox3Value!=null){
        						  Discount = checkbox3Value;}
        					else if(checkbox4Value!=null)
        					{
        						Discount=(checkbox4Value);
        					}
        					        			             				
            				}
            			double	Discount1=Double.valueOf(Discount);
            				  afterDiscount=sum-(sum*Discount1);
            				
            				
                             
                             %>
                           <table style="width:300px;  border: 1px solid #fff;">
                           <tr > 
                          <td  style="border: 1px solid #fff;">Price : </td>
                          <td  style="border: 1px solid #fff;"><input type="text" size="10" maxlength="5" value=<%=sum%>></td>
                          <td  style="border: 1px solid #fff;">Discount : </td>
                          <td  style="border: 1px solid #fff;"><input type="text" size="10" maxlength="5" value=<%=Discount%> ></td>
                        
                           <td  style="border: 1px solid #fff;"> Price after discount : </td>
                           <td  style="border: 1px solid #fff;"><input type="text" size="10" maxlength="5" value=<%= afterDiscount%> ></td>
                            </tr> 
                          </table>
                               
                                <%
                      
                            //  statement.executeUpdate("insert into insertpatient values ('"+session.getAttribute("fname")+"','"+session.getAttribute("lname")+"','"+session.getAttribute("bdate")+"','"+session.getAttribute("email")+"','"+session.getAttribute("patientUsername")+"','"+session.getAttribute("patientPassword")+"','"+session.getAttribute("address")+"','"+session.getAttribute("phone")+"','"+session.getAttribute("gender")+"','"+session.getAttribute("drug")+"' ,'"+session.getAttribute("diseases")+"' ,'"+tests+"','"+dates+"','"+session.getAttribute("Comments")+"','"+session.getAttribute("docusername")+"', '"+currentDate+"', '"+request.getParameter("datatoencode")+"', '"+request.getParameter("sample_details")+"', '"+request.getParameter("sampledate")+"', '"+request.getParameter("time")+"','"+afterDiscount+"','"+session.getAttribute("Paid_up")+"','"+session.getAttribute("Rest")+"')");
            					//statement.executeUpdate("insert into roles values ('"+session.getAttribute("patientUsername")+"','"+session.getAttribute("patientPassword")+"','"+"patient"+"','"+session.getAttribute("phone")+"')");
            					
                                %>
                            
                         </tbody>
                        </table>    
                                         
                    		
						
<!-- 						<br><input style="margin-left: 400px;" type="submit" value="Print" id="print" name="order" class="submit_btn float_l" /> -->
    			
    			
    				
    				   <!--START OF FORM -->
					<!--START Of TABLE -->		    
			        	 <form method="post" name="Paid" id="Paid" action="Paid.jsp">
			            <table style="margin-left: -200px;" border="0" cellspacing="0" style="width: 550px;" >
                           <tbody>
                            
                          
                            <tr>
                            <td width="312" id="Paid_up" style="color: red"><strong>Paid UP:</strong></td>
                            <td width="268"><input type="text" maxlength = "45" id="Paid_up" name="Paid_up" class="required input_field" /></td>
                              <td width="312" id="Rest" style="color: red"><strong>Rest:</strong></td>
                            <td><input type="text" maxlength = "45" id="Rest" name="Rest" class="required input_field" /></td>
                           
                          
                          
                                </tr>  
                      <table style="margin-left:150px;border: 1px solid #fff;">       

    			   <tr>
                         <td  style="border: 1px solid #fff;"><br><input  type="submit" value="Paid" id="Paid" name="signup" class="submit_btn float_l" /></td>       
                         
                         
						</tr>
						</table>
						</tbody>
						</table>
					
    			</div>
    			
        </div>
        
        <div class="col_w270 float_r">
        </div>
    <div class="cleaner_h60"></div>
            
    </div>
        
        
		<div class="cleaner"></div>
</div>
<div class="cleaner_h60"></div>
            
    <div class="cleaner"></div>  

<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright © 2048 <a href="#">Top Secret Bio's</a> - Design: <a href="http://www.tooplate.com">tooplate</a>
    
    </div> <!-- end of tooplate_footer -->

</div> 
    
</body>
</html> 