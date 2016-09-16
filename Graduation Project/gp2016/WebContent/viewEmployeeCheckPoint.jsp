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
	String fname = (String) session.getAttribute("fname");
	String lname = (String) session.getAttribute("lname");
	String gender = (String) session.getAttribute("gender");
	String bdate = (String) session.getAttribute("bdate");
	String email = (String) session.getAttribute("email");
	String address = (String) session.getAttribute("address");
	String username = (String) session.getAttribute("empUsername");
	String password = (String) session.getAttribute("empPassword");
	String phone = (String) session.getAttribute("phone");
	String jobStartDate = (String) session.getAttribute("empJobStartDate");
	
	//check if Dr's username and password are of any Dr in DB. (update/view)
	Class.forName("com.mysql.jdbc.Driver");
	//change localhsot password
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");	
	Statement statement= con.createStatement();
	//retrieving tests names from DB.
	ResultSet rs2=statement.executeQuery("select * from emloyee2 where username = '"+username+"' or fname='"+fname+"' and lname= '"+lname+"'");
	
	while(rs2.next()){
		if (session.getAttribute("Check") == "view"){
			response.sendRedirect("viewReceptionist.jsp");
			break;
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
    
        <h1 id="msg" style="color: red">Check username or First <br></br> or Last name.</h1>
    	
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
            window.location.href = "employeeManage.jsp";
        }
        function showtime() {
            document.getElementById("spntime").innerHTML = count;
            count--;
            setTimeout(showtime, 1000);
        }
    </script>
        
    </div>
    
        <div id="tooplate_sidebar">
        
         
            
            
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