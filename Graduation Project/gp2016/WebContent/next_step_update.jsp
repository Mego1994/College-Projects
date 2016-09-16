<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>


<%!
public static long generateRandom(int length) {
    Random random = new Random();
    char[] digits = new char[length];
    digits[0] = (char) (random.nextInt(9) + '1');
    for (int i = 1; i < length; i++) {
        digits[i] = (char) (random.nextInt(10) + '0');
    }
    return Long.parseLong(new String(digits));
}

%>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Next Step</title> 
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

    <h3 style="margin:50px 0 0 1000px;">Welcome, <a style="text-decoration: underline;" href="#"><strong><%=session.getAttribute("PatientID") %></strong></a></h3>
    
    	<%
		//current date
		Date dateNow = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat ("dd-MM-yyyy");
		String currentDate = dateFormat.format(dateNow);
		
	%>
    
    <h5 style="color: red; margin:10px 0 0 1000px;">Today date is: <%=currentDate %></h5>
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	    	<!-- A form for entering tests information  -->    
	        <div id="contact_form" style="margin:-130px 0 0 -350px;">
	        
	        <!--Barcode form-->
				<form target='_blank' action="barcodeCheck.jsp" method="post">
                          <br>
                          Sample code <input type="text" name="datatoencode" value="<%=generateRandom(12)%>"/>
                          <input id="barcode_submit" onclick="open" type="submit" name="barcode" value="Generate Barcode"/>
                          </form>
	        
	        
	        
    		  <form method="post" name="sample" id="sample" action="profile_update.jsp">	
    		  
    		  	<table>
				<tbody>
<!-- 				<tr> -->
<!--                             <td><br><strong>Sample Details:</strong></td> -->
<!--                             <td width="268"><br><input type="radio" name="sample_details" id="sample_details" value="Fasting"> Fasting</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sample_details" value="Non-fasting"> Non-fasting</input></td> -->
<!--                             </tr>   -->
                            
<!--                             <tr id="tr_date"> -->
<!--                             <td width="312"><strong>Date:</strong></td> -->
<!--                             <td><input type="date" class="validate-bdate required input_field" name="sampledate" id="sampledate"/></td> -->
<!--                             </tr> -->
                            
<!--                             <tr id="tr_time"> -->
<!--                             <td width="312"><strong>Time:</strong></td> -->
<!--                             <td><input type="time" class="validate-bdate required input_field" name="time" id="time"/></td> -->
<!--                             </tr> -->
                         
				</tbody>
				</table>
				
				
    			<!-- Tests table -->
        		<br><br>    <h3>Choose Tests</h3>
				    	<section style="width: 700px; margin-top:-50px;" class="">
  						<div  class="container">
<!--   						<div><input id="searchText" style="width: 100px;" type="text" placeholder="Search Test"></div> -->
    					<table style="width: 680px;">
      					<thead >
        				<tr class="header">
          			    <th style="width: 400px ;border: 1px solid #fff;">
            			<div>Test</div>
          				</th>
          				<th style="width:200px ;border: 1px solid #fff;">
            			<div style="border: 1px solid #fff;">Price</div>
          				</th>
          				<th>
          				<div  style="border: 1px solid #fff;"><input id="searchText" style="width: 105px;" type="text" placeholder="Search Test"></div>
          				</th>
        				</tr>
      					</thead>
      					<tbody id="tests_body">
						
        				<%
        				
        				ResultSet rs=statement.executeQuery("select * from tests_db");
        					
        				int id = 0;
        				
        				while(rs.next())
        				{
        					
        				%>
        				
        				<tr>
        				
        				<%
        					out.println("<td><strong>"+rs.getString("name")+"</strong></td>");
        				out.println("<td><strong>"+rs.getString("Price")+"</strong></td>");
        				%>
        				
        				<td><input name='checkbox<%=id%>' value='<%=rs.getString("name").toUpperCase() %>' type='checkbox'/></td>
        				<td><input name='checkbox2<%=id%>' value='<%= rs.getString("Price")%>' type='checkbox'/></td>
        				<%
        					id++;
        					//out.println("<td>"+"<input name='checkbox' type='checkbox'/>"+"</td>");
        					
        					out.println("</tr>");
        					
        					
        				}
        				
        				%>
        				
        				</tbody>
    					</table>
  						</div>
						</section>

											</section>

						
						

	  <br><br>    <h3>Payment</h3>
				    	<section style="width: 567px; margin-top:-50px;" class="">
  						<div  class="container">
    					<table style="width: 550px;">
      					<thead>
        				<tr class="header">
          				<th style="width: 480px; border: 1px solid #fff;">
            			<div>Payment method</div>
          				</th>
          				<th style="width: 480px; border: 1px solid #fff;">
            			<div style="border: 1px solid #fff;">Discount_Class1</div>
          				</th>
          				<th style="width: 480px; border: 1px solid #fff;">
            			<div style="border: 1px solid #fff;">Discount_Class2</div>
          				</th>
          				
          				
          				 <th style="width: 480px;">
            			
          				
          				
        				</tr>
        				
        			
          				
      					</thead>
      					
      					<tbody>
	  <%
	  Class.forName("com.mysql.jdbc.Driver");
		//change localhsot password
		java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
		Statement statement1= con1.createStatement();
		//retrieving tests names from DB.
		ResultSet rs1=statement.executeQuery("select * from Payment");
		
		
		
		int id1=0;
		while(rs1.next())
		{
			
		%>
		
		<tr>
		
		<%
			out.println("<td><strong>"+rs1.getString("Payment_method")+"</strong></td>");
		
		out.println("<td><strong>"+rs1.getString("Discount_Class1")+"</strong></td>");
		out.println("<td><strong>"+rs1.getString("Discount_Class2")+"</strong></td>");
		
	
		%>
	
	
		<td><input name='checkbox3<%=id%>' value='<%=rs1.getString("Discount_Class1")%>' type='checkbox'/></td>
		
		<td><input name='checkbox4<%=id%>' value='<%=rs1.getString("Discount_Class2")%>' type='checkbox'/></td>
		
		
		
		<%
		
		
			id1++;
		
			//out.println("<td>"+"<input name='checkbox' type='checkbox'/>"+"</td>");
			
			out.println("</tr>");
			
			
		}
		 %>
	  
	  	   	  
	 
                        
												
						</tbody>
    					</table>
  						</div>
						</section>
						
						      
				 
							
						<script>
						//live search test with highlight
						function removeHighlighting(highlightedElements){
    						highlightedElements.each(function(){
        						var element = $(this);
        						element.replaceWith(element.html());
    						})
						}

						function addHighlighting(element, textToHighlight){
    						var text = element.text();
    						var highlightedText = '<strong style="color:red;">' + textToHighlight + '</strong>';
    						var newText = text.replace(textToHighlight, highlightedText);
    
    						element.html(newText);
						}

						$("#searchText").on("keyup", function() {
    						var value = $(this).val().toUpperCase();
    
    						removeHighlighting($("table tr strong"));

					    	$("table tr").each(function(index) {
        						if (index !== 0) {
            						$row = $(this);
            
					            	var $tdElement = $row.find("td:first");
            						var id = $tdElement.text().toUpperCase();
            						var matchedIndex = id.indexOf(value);
            
            						//not found results
            						if (matchedIndex != 0) {
                						$row.hide();
                						//$("#tests_body").text("No tests found");
                						$('#tr_date').show();
                						$('#tr_time').show();
                						$(".header").show();
            						}
            					
            						//found results
            						else {
                						addHighlighting($tdElement, value);
                						//$("#tests_body").text("");
                						$row.show();
            						}
				        		}
    						});
					
						});
						
						$("#x").click(function() {
							$('#searchText').text(" ");
							
						});
						
					
						
						</script>
						
				      			
				<br><input style="margin: -150px 0 0 600px;" type="submit" value="Order" id="order" name="order" class="submit_btn float_l" />


    			</form>
    			
			</div>           
        
        </div>
        
        <div class="col_w270 float_r">
        </div>
      <div class="cleaner_h60"></div>
    </div>
        <div id="tooplate_sidebar">
        
       
            
            
            <div class="cleaner_h60"></div>
            
           
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