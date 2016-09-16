<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
     
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="javax.sql.*" %>

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
<%! public String un ; %>
<%! public String code; %>
        
</head>
<body> 

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loinc","root","");
Statement s = con.createStatement();
ResultSet re = s.executeQuery("select * from loinc");
%>
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
    
    <div id="tooplate_content">
        <div class="col_w270 float_l">
	        
            <div style="margin-top: -20px;" id="contact_form_patient">
            
				<h3>HL7 Request Form</h3>
                          
				    <!--START OF FORM -->
					<form method="post" id="create" name="create" action="Generate.jsp">
			        <!--START Of TABLE -->		    
			            <table style="margin-left: -90px;" border="0" cellspacing="0" style="width: 550px;" >
                           <tbody>
                            
                          
                            <tr>
                            <td width="312"><strong>First Name:</strong></td>
                            <td width="268"><input type="text" maxlength = "45" id="fname" name="fname" class="required input_field" /></td>
                              <td width="312"><strong>Last Name:</strong></td>
                            <td><input type="text" maxlength = "45" id="lname" name="lname" class="required input_field" /></td>
                            </tr> 
                            
                             
                            <tr>
                            <td width="312"><strong>TestInfo:</strong></td>
                            <td><select id="scripts" name="test" >
<c:forEach items="${tests}" var="test">
<%
while(re.next())
{
String un=re.getString("COMPONENT");
String code=re.getString("LOINC_code");
%>
 <option value="${exam.code}">${exam.un}</option>
 <option value="<%= code%>"><%= un%></option>
<% 
}
%>
</c:forEach>
 </select></td>
                   
                    
                            
                            <td width="312"><strong>TestName</strong></td>
                            <td><input type="text" size="30" name="display1" id="display1" /></td>
                                <td width="312"><strong>TestCode:</strong></td>
                            <td><input type="text" size="30" name="display" id="display" /></td>
                            </tr>
                            
                            <tr>
                            <td width="312"><strong>SSN</strong></td>
                            <td><input type="number" maxlength = "16" class="validate-username required input_field" name="ssn" id="ssn" /></td>
                             <td width="312"><strong>PatientID</strong></td>
                            <td><strong><input type="number" maxlength = "16" class="validate-password required input_field" name="id" id="id" /></strong></td>
                            <td><input type="button" value=" Show" id="showtxt" name="showtxt" class="submit_btn float_l" /></td>
                            
                            </tr>
                            
                            <tr>
                            <td width="312"><strong>Device:</strong></td>
                            <td><input type = "text" maxlength = "45" class="validate-phone required input_field" name="device" id="device"/></td>
                        
                            </tr>
                  
                            
                            
                            
                            
							<td>
                        <tr>
                         <td><br><input  type="submit" value="Submit" id="signup" name="signup" class="submit_btn float_l" /></td>       
                         </td>
                         </tr>
                         </tbody>
                        </table>    
                                         
                        </form>
					
					    
					
					<!--END OF FORM -->
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

<script >
 (function() {
    // get references to select list and display text box
    var sel = document.getElementById('scripts');
    var elcode = document.getElementById('display');
    var elname = document.getElementById('display1')
    var theContents = document.getElementById('scripts')[document.getElementById('scripts').selectedIndex].innerText;

    document.getElementById('showtxt').onclick = function () {
     elcode.value = sel.value;
     elname.value = sel.options[sel.selectedIndex].text;
     }
} ()); </script>
 
 <script type="text/javascript">
 
//validate sign up form fields.
 $("#signupform").validate({
	 rules: {
		    fname: "required",
		    lname: "required",
		    TestInfo: "required",
		    TestName: "required",
		    TestCode: "required",
		    SSN: "required",
		    PatientID: "required",
		    Device: "required",
		    Date: "required",
		    

		  },
		  
		  messages: {
		    fname: "Type your first name.",
		    lname: "Type your last name.",
		    TestInfo: "Select Test.",
		    TestName: "Use 'Show' button.",
		    TestCode: "Use 'Show' button.",
		    SSN: "We need patient SSN.",
		    PatientID: "We need patient ID.",
		    Device: "We need device name.",
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