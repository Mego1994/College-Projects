<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
     
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="javax.sql.*" %>
<%ResultSet resultset =null;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Patient Registration </title> 
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
        
        <div id="tooplate_menu">
        	
            <div id="home_menu"><a href="index.jsp"></a></div>
                
            <ul>
                <li><a href="index.jsp" class="current">Home</a></li>
                <li><a style="width:120px;" href="availableResults.jsp">Available Results</a></li>
                <li><a style="width:120px;" href="searchSampleCode.jsp">Search Samples</a></li> 
                <li ><a style="width:120px;" href="Signin_emp.jsp">Check Patient</a></li> 
                 <li><a href="Logout.jsp">| Sign out</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->
        

    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	        
            <div id="contact_form_patient">
            
				
			
                          
				    <!--START OF FORM -->
					<form method="post" id="signupform" name="signupform" action="NewPatientActions.jsp">
			        <!--START Of TABLE -->		    
			            <table style="margin-left: -10px;" border="0" cellspacing="0" style="width: 550px;" >
                           <tbody>
<!--                             <tr> -->
<!--                             <td><input type='radio' id='insert' name='action' value='insert' checked/><strong>ADD</strong><br>&nbsp;&nbsp;&nbsp;3 Steps</input></td><td><input type='radio' id='update' name='action' value='update'/><strong>UPDATE</strong><br>&nbsp;&nbsp;&nbsp;3 Steps</input></td> -->
                    
<!--                             </tr> -->
                          
                            <tr>
                            <td width="312" id="fnameWord" ><strong>First Name:</strong></td>
                            <td width="268"><input type="text" maxlength = "45" id="fname" name="fname" /></td>
                              <td width="312" id="lnameWord" ><strong>Last Name:</strong></td>
                            <td><input type="text" maxlength = "45" id="lname" name="lname" /></td>
                           
                          
                          
                              <td><strong id="genderWord" >Gender:</strong></td>
                            <td width="268"><input type="radio" id="male" name="gender" value="male"> Male</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" id="female" value="female">Female</input></td>
                              <td width="312"><strong>Last Period Date:</strong></td>
                            <td><input type="date" name="lpdate" id="lpdate"/></td>
                   
                              </tr>  
                              <tr>
                            <td width="312" id="bdateWord" ><strong>Birth Date:</strong></td>
                            <td><input type="date"  name="bdate" id="bdate"/></td>
                   
                    <% session.getAttribute("PatientID");%>
                            
                            <td width="312" id="emailWord" ><strong>Email</strong></td>
                            <td><input type="email" maxlength = "45" name="email" id="email" /></td>
                                <td width="312" id="addressWord" ><strong>Address:</strong></td>
                            <td><input type="text" maxlength = "45"  name="address" id="address"/></td>
                             <td width="312" id="phoneWord" ><strong>Phone:</strong></td>
                            <td><input type = "number" maxlength = "11" name="phone" id="phone"/></td>
                            </tr>
                            
                            <tr>
                          
                              <td width="312" id="referringdocWord" ><strong>Refering Doctor Name </strong></td>
                            <td><input type="text" maxlength = "45"  name="referingdoc" id="referingdoc" /></td>
                             <td><br><strong id="fastWord" >Fasting:</strong></td>
                            <td width="268"><br><input id="yes" type="radio" name="fasting" value="Yes"> Yes</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="fasting" id="no" value="No">No</input></td>
                            <td width="312" ><strong>Fasting Hours</strong></td>
                            <td><input type="number" maxlength = "45"  name="fhours" id="fhours" /></td>
                         <%   
                         
                         
                        
                                try{
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");

                                Statement statement = con.createStatement() ;

                                resultset =statement.executeQuery("select * from doctor1") ;
                             %>

                            <td width="312" id="testdoctorWord" ><strong>Testing Doctor</strong></td>
                           
                           <td>
                            <select name="item">
                            <%  while(resultset.next()){ %>
                              <option><%= resultset.getString(1)%></option>
                            <% } %>
                            </select>
                          
                            </td>
                            </tr>
                            <%
							
       						}
       						catch(Exception e)
        					{
             				  out.println("wrong entry"+e);
      					    }
                         %>
                            
                            
                            <tr>
                           
                            <td><strong id="drugWord" >Drug Therapy:</strong></td>
                            <td width="268"><input id="yes" type="radio" name="drug" value="Yes"> Yes</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="drug" id="no" value="No">No</input></td>
                                               
                            
                            
                            
                            
                         <td><strong id="diseasesWord">Diseases you have:</strong></td>
                         <td> <select name="diseases" multiple>
                          <option value="High blood pressure">High blood pressure</option>
                          <option value="Low blood pressure">Low blood pressure</option>
                            <option value="Bleeding diathesis">Bleeding diathesis</option>
                              <option value="Diabetes">Diabetes</option>
                              <option value="Heart disease">Heart disease</option>
                              </select></td>
                             
                           
                                      
                       
                         			
                       
 		                 <td><br><strong>Comments:</strong></td>
 		                 <td><input width="268" type="text" name="Comments" id="Comments" /></td>             
                        
                         
                        </tr>
                        
                          <tr>
                            <td width="312" id="usernameWord" ><strong>Username</strong></td>
                            <td><strong><input type="text" maxlength = "45"  name="username" id="username"  placeholder="User Name length till 16 characters." /></strong></td>
                            <td><input type="button" value="    Generate" id="userGen" name="userGen" class="submit_btn float_l" /></td>
                             <td width="312" id="passwordWord"><strong>Password</strong></td>
                            <td><strong><input type="password" maxlength = "16" name="password" id="password" placeholder="Password length till 16 characters." /></strong></td>
                            <td><input type="button" value="    Generate" id="passGen" name="passGen" class="submit_btn float_l" /></td>
                            
                            </tr>
                         <table style="margin-left:350px;border: 1px solid #fff;" >
                           <tr >
                         <td style="border: 1px solid #fff;"><br ><input type="submit" value="Submit" id="signup" name="signup" class="submit_btn float_l" /></td>       
                       
                         </tr>
                         </table>
                         </tbody>
                        </table>    
                                         
                        </form>
					
<!-- 					    	<script type="text/javascript"> -->
					
					
					 

<!-- 				</script> -->
                
					
					<!--END OF FORM -->
			</div>           
        
        </div>
        
       
    
    </div>
    <div class="cleaner_h60"></div>
              <div class="cleaner_h60"></div>
            
</div>
  <div class="cleaner_h60"></div>
            
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
     var possible = "BACDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";  
   
     for( var i=0; i < 16; i++ )  
         text += possible.charAt(Math.floor(Math.random() * possible.length));  
   
     return text;  
 }  
 
 var text = makeid();
 $('#passGen').click(function(){		//assign the random number to password text box.
	 $('#password').val(text);
 });
 
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
 $('#userGen').click(function(){		//assign the random number to password text box.
	 $('#username').val(text);
 });
 
// //validate sign up form fields.
//  $("#signupform").validate({
// 	 rules: {
// 		    username: "required",
// 		    password: "required"
// 		  },
		  
// 		  messages: {
// 		    username: "Type your username. Save it for Login later.",
// 		    password: "Type password or use 'Generate' button."
// 		  }, 
	 
// 	 highlight: function(element, errorClass) {
// 	    $(element).fadeOut(function() {
// 	      $(element).fadeIn();
// 	    });
// 	  },
 
// 	 submitHandler: function(form) {			 
// 		 form.submit();
// 	 }
 
//  });
  
 </script>
 
 </body>
</html>