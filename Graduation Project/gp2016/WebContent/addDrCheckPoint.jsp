<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Message</title> 
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<link rel="stylesheet" href="tooplate_style.css" type="text/css">


</head>
<body> 

<%
	//check if Dr's username is of any Dr in DB. (add)
	Class.forName("com.mysql.jdbc.Driver");
	//change localhsot password
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
	Statement statement= con.createStatement();
	//retrieving tests names from DB.
	
	String fname = (String) session.getAttribute("fname");
	String lname = (String) session.getAttribute("lname");
	String gender = (String) session.getAttribute("gender");
	String bdate = (String) session.getAttribute("bdate");
	String email = (String) session.getAttribute("email");
	String address = (String) session.getAttribute("address");
	String username = (String) session.getAttribute("docUsername");
	String password = (String) session.getAttribute("docPassword");
	String phone = (String) session.getAttribute("phone");
	String jobStartDate = (String) session.getAttribute("docJobStartDate");
	
	
	ResultSet rs2 = statement.executeQuery("select * from doctor1 where username = '"+username+"'");
	
	if(rs2.next() == false){
		if(fname == "" || lname == "" || bdate == "" || email == "" || username == "" || password == "" || gender == "" || address == "" || phone == "" || jobStartDate == "")
			response.sendRedirect("addDrFillAllFields.jsp");
		else{	
			statement.executeUpdate("insert into doctor1 values ('"+username+"','"+fname+"','"+lname+"','"+phone+"','"+email+"','"+address+"','"+password+"','"+gender+"','"+bdate+"','"+jobStartDate+"', '"+"active"+"')");
			statement.executeUpdate("insert into roles values ('"+username+"','"+password+"','"+"doctor"+"','"+phone+"', '"+"active"+"' , '"+"doctor"+"')");
			response.sendRedirect("addedmsgdoc.jsp");
		}
		
	
	}
	
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

    
    <div id="tooplate_content">
    
        <h1>Username is already found<br></br></h1>
        <h1 style="color: red;">Choose another username.</h1>
    	
		<div class="cleaner_h30 horizon_divider"></div>
        <div class="cleaner_h30"></div>
        
        <p style="color: red;">This page will redirect in <span id="spntime"></span> seconds....</p>
   <script language="JavaScript">
    var count = 3;
    window.onload = function () {
        setTimeout(reloadpage, 3500);
        showtime();
    }
        function reloadpage() {
            window.location.href = "doctorManage.jsp"
        }
        function showtime() {
            document.getElementById("spntime").innerHTML = count;
            count--;
            setTimeout(showtime, 1000);
        }
    </script>
        
    </div>
     <div class="cleaner_h60"></div>
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