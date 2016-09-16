<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
     
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Sign in</title> 
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<link rel="stylesheet" href="tooplate_style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- A library for disabling user from submitting when one or any fields not filled in. -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/localization/messages_en.js"></script>

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
                <li><a href="index.jsp">Home</a></li>
                 <li><a href="Tests.jsp">Tests</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="Signin.jsp" class="current">| Sign in</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->
    <div id="tooplate_content">
        
            <div class="cleaner_h50"></div>
            
            <!-- Sign in form -->
            <div style="margin-bottom: 212px;" id="contact_form">
            
					<form id="signin" action="LoginCheck.jsp" method="post">
						Username: &nbsp;&nbsp;&nbsp;<input type="text" maxlength="45" name="username" class="required input_field">
						<br></br> 
                        Password: &nbsp;&nbsp;&nbsp;<input type="password" name="password" maxlength="16" class="required input_field">
                        
                        <br><br><input style="margin-left: 150px;" type="submit" value="Login" class="submit_btn float_l"> 
                    </form>
				
			</div>           
               <div class="cleaner_h60"></div> 
    </div>
    
      
        <div class="cleaner"></div>
		
</div>

    <div class="cleaner"></div>  

<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright © 2048 <a href="#">Top Secret Bio's</a> - Design: <a href="http://www.tooplate.com">tooplate</a>
    
    </div> <!-- end of tooplate_footer -->

</div> 
 
<script type="text/javascript"> 

 //validate sign in form fields.
 $("#signin").validate({
	 rules: {
		   username: "required",
		   password: "required"
		},
		
		  //message to be shown when these fields not filled in
		  messages: {
		    username: "Type your username.",
		    password: "Type password"
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