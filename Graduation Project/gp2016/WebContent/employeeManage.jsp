<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
     
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Manage Employee </title> 
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
                <li><a href="index.jsp" class="current">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
              
                <li><a href="contact.jsp">Contact</a></li>  
                 <li><a href="Logout.jsp">Sign out</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->
        
<div id="tooplate_main">
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	        
            <div id="contact_form_patient">
            
            <!-- Profile table -->
        		<br><br>    <h3>All Employees</h3>
				    	<section style="width: 700px;"  class="">
  						<div  class="container">
    					<table style="width: 700px;">
      					<thead>
        				<tr class="header">
          				<th style="width: 480px; border: 1px solid #fff;"">
            			<div style= "border: 1px solid #fff;">Name</div>
            			<div style= "border: 1px solid #fff;" ><input id="searchName" style="width: 120px; margin-left: 100px;" type="text" placeholder="Search by Name"></div>
          				</th>
          				<th style="width: 480px;">
            			<div style= "border: 1px solid #fff;">Activity</div>
          				</th>
						<th style="width: 480px;">
            			<div style= "border: 1px solid #fff;">Username</div>
          				<div style= "border: 1px solid #fff;"><input id="searchUsername" style="width: 120px; margin-left: 100px;" type="text" placeholder="Search by Username"></div>
          				</th>
						
        				</tr>
      					</thead>
      					<tbody>

					
					<%
        				Class.forName("com.mysql.jdbc.Driver");
        				//change localhsot password
        					java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
        				Statement statement= con.createStatement();
        				
        				ResultSet rs=statement.executeQuery("select * from emloyee2");
        					
        				while(rs.next()){
        					%>
        					<tr id='drData'>
        					<td><strong><%=rs.getString("fname")%>&nbsp;<%=rs.getString("lname")%></strong></td>
        					<td><strong><%=rs.getString("Activity")%></strong></td>
        					<td><strong><%=rs.getString("username")%></strong></td>
        					</tr>
        					<%
        					
        				}
        				%>
        				
        				</tbody>
    					</table>
  						</div>
						</section>
            
            <br></br><br></br>
				<h3>&nbsp;&nbsp;Employee Registration Form</h3>
				<h5> Fields colored by <strong style="color: red;">RED</strong> are mandatory</h5>                          
				    <!--START OF FORM -->
					<form method="post" id="signupform" name="signupform" action="NewEmployeeActions.jsp">
			        <!--START Of TABLE -->		    
			            <table id="dr" border="0" cellspacing="0" style="width: 550px; margin-left:-70px;" >
                           <tbody>
                         	
                         	<tr>
                         	<td><input type='radio' id='insert' name='action' value='insert' checked/>ADD</input></td><td><input type='radio' id='update' name='action' value='update'/>UPDATE<br><strong>&nbsp;&nbsp;By Username.</strong></input></td><td></td><td><input type='radio' id='view' name='action' value='view'/>VIEW<br><strong>&nbsp;&nbsp;By First & Last name or Username.</strong></input></td><td><input type='radio' id='delete' name='action' value='delete'/>DELETE<br><strong>&nbsp;&nbsp;By Username.</strong></input></td><td><input type='radio' id='active' name='action' value='active'/>Set to Active User<br><strong>&nbsp;&nbsp;Type username</strong></input></td>
                         	</tr>			
                         	
                         	<script type="text/javascript">
					
					$('#view').click(function(){	
						if ($('#view').prop( "checked" )) {
						 $('#fname').prop('disabled', false);
						 $('#lname').prop('disabled', false);
 						 $('#bdate').prop('disabled', true);
						 $('#email').prop('disabled', true);
						 $('#address').prop('disabled', true);
						 $('#phone').prop('disabled', true);
						 $('#male').prop('disabled', true);
						 $('#female').prop('disabled', true);
						 $('#password').prop('disabled', true);
						 $('#Job_start_date').prop('disabled', true);
						 
						 $('#passwordWord').css("color","black");
						 $('#fnameWord').css("color","red");
						 $('#lnameWord').css("color","red");
						 $('#genderWord').css("color","black");
						 $('#bdateWord').css("color","black");
						 $('#emailWord').css("color","black");
						 $('#addressWord').css("color","black");
						 $('#usernameWord').css("color","red");
						 $('#phoneWord').css("color","black");
						 $('#jobstartdateWord').css("color","black");
						 
						} 
					 });
					 
					$('#delete').click(function(){	
						if ($('#delete').prop( "checked" )) {
						 $('#fname').prop('disabled', true);
						 $('#lname').prop('disabled', true);
						 $('#bdate').prop('disabled', true);
						 $('#email').prop('disabled', true);
						 $('#address').prop('disabled', true);
						 $('#phone').prop('disabled', true);
						 $('#male').prop('disabled', true);
						 $('#female').prop('disabled', true);
						 $('#password').prop('disabled', true);
						 $('#Job_start_date').prop('disabled', true);
						 
						 $('#fnameWord').css("color","black");
						 $('#lnameWord').css("color","black");
						 $('#genderWord').css("color","black");
						 $('#bdateWord').css("color","black");
						 $('#emailWord').css("color","black");
						 $('#addressWord').css("color","black");
						 $('#usernameWord').css("color","red");
						 $('#passwordWord').css("color","black");
						 $('#phoneWord').css("color","black");
						 $('#jobstartdateWord').css("color","black");
						 
						} 
					 });
					 
					
					$('#active').click(function(){	
						if ($('#active').prop( "checked" )) {
						 $('#fname').prop('disabled', true);
						 $('#lname').prop('disabled', true);
						 $('#bdate').prop('disabled', true);
						 $('#email').prop('disabled', true);
						 $('#address').prop('disabled', true);
						 $('#phone').prop('disabled', true);
						 $('#male').prop('disabled', true);
						 $('#female').prop('disabled', true);
						 $('#password').prop('disabled', true);
						 $('#Job_start_date').prop('disabled', true);
						 
						 $('#fnameWord').css("color","black");
						 $('#lnameWord').css("color","black");
						 $('#genderWord').css("color","black");
						 $('#bdateWord').css("color","black");
						 $('#emailWord').css("color","black");
						 $('#addressWord').css("color","black");
						 $('#usernameWord').css("color","red");
						 $('#passwordWord').css("color","black");
						 $('#phoneWord').css("color","black");
						 $('#jobstartdateWord').css("color","black");
						 
						} 
					 });
					
					
					$('#insert').click(function(){	
						if ($('#insert').prop( "checked" )) {
						 $('#fname').prop('disabled', false);
						 $('#lname').prop('disabled', false);
						 $('#bdate').prop('disabled', false);
						 $('#email').prop('disabled', false);
						 $('#address').prop('disabled', false);
						 $('#phone').prop('disabled', false);
						 $('#male').prop('disabled', false);
						 $('#female').prop('disabled', false);
						 $('#password').prop('disabled', false);
						 $('#Job_start_date').prop('disabled', false);
						 
						 $('#fnameWord').css("color","red");
						 $('#lnameWord').css("color","red");
						 $('#genderWord').css("color","red");
						 $('#bdateWord').css("color","red");
						 $('#emailWord').css("color","red");
						 $('#addressWord').css("color","red");
						 $('#usernameWord').css("color","red");
						 $('#passwordWord').css("color","red");
						 $('#phoneWord').css("color","red");
						 $('#jobstartdateWord').css("color","red");
						 
						} 
					 });
				
					$('#update').click(function(){	
						if ($('#update').prop( "checked" )) {
						 $('#fname').prop('disabled', false);
						 $('#lname').prop('disabled', false);
						 $('#bdate').prop('disabled', false);
						 $('#email').prop('disabled', false);
						 $('#address').prop('disabled', false);
						 $('#phone').prop('disabled', false);
						 $('#male').prop('disabled', false);
						 $('#female').prop('disabled', false);
						 $('#password').prop('disabled', true);
						 $('#Job_start_date').prop('disabled', false);
						 
						 $('#fnameWord').css("color","black");
						 $('#lnameWord').css("color","black");
						 $('#genderWord').css("color","black");
						 $('#bdateWord').css("color","black");
						 $('#emailWord').css("color","black");
						 $('#addressWord').css("color","black");
						 $('#usernameWord').css("color","red");
						 $('#passwordWord').css("color","black");
						 $('#phoneWord').css("color","black");
						 $('#jobstartdateWord').css("color","black");
						 
						} 
					 });
					
				</script>
                         	
    <tr >
                            <td width="312" style="color: red;" id="fnameWord"><strong>First Name:</strong></td>
                            <td width="268"><input id="fname" type="text" maxlength = "45" id="fname" name="fname" class="required input_field" /></td>
                              <td width="312" style="color: red;" id="lnameWord"><strong>Last Name:</strong></td>
                            <td><input id="lname" type="text" maxlength = "45" id="lname" name="lname" class="required input_field" /></td>
                      
                              <td style="color: red;" id="genderWord"><strong>Gender:</strong></td>
                            <td width="268"><input type="radio" name="gender" id="male" value="male"> Male</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" id="female" value="female">Female</input></td>
                            <td width="312" style="color: red;" id="bdateWord"><strong>Age:</strong></td>
                            <td><input id="bdate" type="number" class="validate-bdate required input_field" name="bdate" id="bdate"/></td>
                        </tr> 
                       <tr> 
                            <td width="312" style="color: red;" id="emailWord"><strong>Email</strong></td>
                            <td><input id="email" type="email" maxlength = "45" class="validate-email required input_field" name="email" id="email" /></td>
                                <td width="312" style="color: red;" id="addressWord"><strong>Address:</strong></td>
                            <td><input type="text" maxlength = "45" class="validate-address required input_field" name="address" id="address"/></td>

                            <td width="312" style="color: red;" id="phoneWord"><strong>Phone</strong></td>
                            <td><input type = "number" maxlength = "11" class="validate-phone required input_field" name="phone" id="phone"/></td>
                       
                            <td width="312" style="color: red;" id="jobstartdateWord"><strong>Job Start Date</strong></td>
                             <td><input id="Job_start_date" type="date" class="validate-bdate required input_field" name="Job_start_date" /></td>
                            </tr> 
                          
                            
                            <tr>
                            <td width="312" style="color: red;" id="usernameWord"><strong>Username</strong></td>
                            <td><input type="text" maxlength = "45" class="validate-username required input_field" name="username" id="username" /></td>
                            <td><input type="button" value="    Generate" id="userGen" name="userGen" class="submit_btn float_l" /></td>
                           
                             <td width="312" style="color: red;" id="passwordWord"><strong>Password</strong></td>
                            <td><strong><input type="password" maxlength = "16" class="validate-password required input_field" name="password" id="password" /></strong></td>
                            <td><input type="button" value="    Generate" id="passGen" name="passGen" class="submit_btn float_l" /></td>
                            
                             <td><br><input type="submit" value="Submit" id="submit" name="submit" class="submit_btn float_l" /></td>       
                         </td>
                            </tr>
                            
                                                        
                        </tbody>
                    </table>                    
                    
<!-- 						<table border="0" cellspacing="0" style="width: 550px;" > -->
<!--                          <tbody> -->
                         
<!--                          <tr> -->
                        
<!--                          </tr> -->
<!--                          </tbody> -->
<!--                         </table>     -->
                                         
                        </form>
					
					
					
					<!--END OF FORM -->
			</div>           
        
        </div>
        
        <div class="col_w270 float_r">
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
 
 //make id() generates random number for password.
 function makeid()  
 {  
     var text = "";  
     var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";  
   
     for( var i=0; i < 16; i++ )  
         text += possible.charAt(Math.floor(Math.random() * possible.length));  
   
     return text;  
 }  
 
 var text = makeid();
 $('#passGen').click(function(){		//assign the random number to password text box.
	 $('#password').val(text);
 });
 
 $('#userGen').click(function(){		//assign the random number to password text box.
	 var fname = document.getElementById("fname").value;
	 var lname = document.getElementById("lname").value;
	 var phone = document.getElementById("phone").value;
	 $('#username').val("emp" + fname + "" + lname + phone);
 });

 
 						//live search test with highlight
						function removeHighlighting(highlightedElements){
    						highlightedElements.each(function(){
        						var element = $(this);
        						element.replaceWith(element.html());
        					});
						}

						function addHighlighting(element, textToHighlight){
    						var text = element.text();
    						var highlightedText = '<strong style="color:red;">' + textToHighlight + '</strong>';
    						var newText = text.replace(textToHighlight, highlightedText);
    
    						element.html(newText);
						}

						$("#searchName").on("keyup", function() {
    						var value = $(this).val().toUpperCase();
    
    						removeHighlighting($("table tr strong"));

					    	$("section table tr").each(function(index) {
        						if (index !== 0) {
            						$row = $(this);
            
					            	var $tdElement = $row.find("td:first");
            						var id = $tdElement.text().toUpperCase();
            						var matchedIndex = id.indexOf(value);
            
            						//not found results
            						if (matchedIndex != 0) {
                						$row.hide();
                						//$("#tests_body").text("No tests found");
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
						
						$("#searchUsername").on("keyup", function() {
    						var value = $(this).val().toUpperCase();
    
    						removeHighlighting($("table tr strong"));

					    	$('section table tr').each(function(index) {
        						if (index !== 0) {
            						$row = $(this);
            
					            	var $tdElement = $row.find("td:last");
            						var id = $tdElement.text().toUpperCase();
            						var matchedIndex = id.indexOf(value);
            
            						//not found results
            						if (matchedIndex != 0) {
                						$row.hide();
                						//$("#tests_body").text("No tests found");
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

						</script>
 
 
 </body>
</html>