<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
     
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Sample Code Search</title> 
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<link rel="stylesheet" href="tooplate_style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- A library for disabling user from submitting when one or any fields not filled in. -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/localization/messages_en.js"></script>

</head>
<body> 



        <div id="tooplate_menu">
        	
            <div id="home_menu"><a href="index.jsp"></a></div>
                
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="Logout.jsp"  >Sign out</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->
        

<div id="tooplate_main">
    
    <div id="tooplate_content">
        
            <!-- Sign in form -->
            <div style="margin-bottom: 212px;" id="contact_form">
            		
				<!-- Profile table -->
					<br> </br><br> </br><br> </br>
					
					<section style="width: 1000px; margin-left: -300px;" class="">
					<div class="container">
						<table style="width: 980px;">
							<thead>
								<tr class="header">
									<th style="width: 480px;  border: 1px solid #fff;">
										<div>Name</div>
									</th>
									<th style="width: 480px;">
										<div style=" border: 1px solid #fff;">Patient ID</div>
									</th>
									<th style="width: 480px;">
										<div style=" border: 1px solid #fff;">Visit Date</div>
									</th>
									<th style="width: 480px;">
										<div style=" border: 1px solid #fff;">Sample Code</div>
										<div style=" border: 1px solid #fff;"><input id="searchCode" style="width: 130px; margin-left: 105px; border: 1px solid #fff;" type="text" placeholder="Search Sample Code"></div>
									</th>
									
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

						$("#searchCode").on("keyup", function() {
    						var value = $(this).val().toUpperCase();
    
    						removeHighlighting($("table tr strong"));

					    	$("section table tr").each(function(index) {
        						if (index !== 0) {
            						$row = $(this);
            
					            	var $tdElement = $row.find("td:last");
            						var id = $tdElement.text().toUpperCase();
            						var matchedIndex = id.indexOf(value);
            
            						//not found results
            						if (matchedIndex != 0) {
                						$row.hide();
                						
            						}
            					
            						//found results
            						else {
                						addHighlighting($tdElement, value);
                						$row.show();
            						}
				        		}
    						});
					
						});
						
						</script>
									
									
								</tr>
							</thead>
							<tbody>
							<%
							Class.forName("com.mysql.jdbc.Driver");
			        		//change localhsot password
			        		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
			        		Statement statement= con.createStatement();
			        		
			        		
			        		ResultSet rs = statement.executeQuery("select * from samples");;
			        		
			        		while(rs.next())
			            	{
			            			out.println("<tr>");
			            			out.println("<td><strong>"+rs.getString("fname")+" "+rs.getString("lname")+"</strong></td>");
			            			out.println("<td><strong>"+rs.getString("patientID")+"</strong></td>");
			            			out.println("<td><strong>"+rs.getString("visitDate")+"</strong></td>");
			            			out.println("<td><strong>"+rs.getString("sampleCode")+"</strong></td>");
			            			out.println("</tr>");
			    			}
			    			
			    			%>	
								
							</tbody>
						</table>
					</div>
					</section>
				
				
			</div>           
            
    </div>
    
        		<div class="cleaner"></div>
</div>

    <div class="cleaner"></div>  

<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright � 2048 <a href="#">Top Secret Bio's</a> - Design: <a href="http://www.tooplate.com">tooplate</a>
    
    </div> <!-- end of tooplate_footer -->

</div> 
 
<script type="text/javascript"> 

 //validate sign in form fields.
 $("#searchSampleCode").validate({
	 rules: {
		 sampleCode: "required"
		},
		
		  //message to be shown when these fields not filled in
		  messages: {
			sampleCode: "Type samplecode."
		    }, 
	 
	 highlight: function(element, errorClass) {
	    $(element).fadeOut(function() {
	      $(element).fadeIn();
	    });
	  },
 
	 submitHandler: function(form) {			 
		 form.submit();
	 }
 
 });
 
</script>

 </body>
</html>