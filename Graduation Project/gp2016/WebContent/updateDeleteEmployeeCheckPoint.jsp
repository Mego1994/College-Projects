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
	ResultSet rs2=statement.executeQuery("select * from emloyee2 where username = '"+username+"'");
	
	String empTele = "";
	while(rs2.next()){
		empTele = rs2.getString("tele");
		
		if (session.getAttribute("Check") == "update"){
			
			if(fname != "")
				statement.executeUpdate("update emloyee2 set fname='"+fname+"' where username = '"+username+"'");
			
			if(lname != "")
				statement.executeUpdate("update emloyee2 set lname='"+lname+"' where username = '"+username+"'");
			
			if(gender != null)
				statement.executeUpdate("update emloyee2 set gender='"+gender+"' where username = '"+username+"'");
					
			if(bdate != "")
				statement.executeUpdate("update emloyee2 set age='"+bdate+"' where username = '"+username+"'");
					
			if(email != "")
				statement.executeUpdate("update emloyee2 set email='"+email+"' where username = '"+username+"'");
					
			if(address != "")
				statement.executeUpdate("update emloyee2 set address='"+address+"' where username = '"+username+"'");
					
			if(phone != ""){
				statement.executeUpdate("update emloyee2 set tele='"+phone+"' where username = '"+username+"'");
				statement.executeUpdate("UPDATE roles SET tele = "+phone+" WHERE username = '"+username+"'");
			}
					
			if(jobStartDate != "")
				statement.executeUpdate("update emloyee2 set job_startdate='"+jobStartDate+"' where username = '"+username+"'");
					
			response.sendRedirect("adminupdatedemployeemsg.jsp");
			break;
		}
		else if (session.getAttribute("Check") == "delete"){
			statement.executeUpdate("update emloyee2 set Activity='"+"inactive"+"' where username = '"+username+"'");
			statement.executeUpdate("update roles set Activity='"+"inactive"+"' where username = '"+username+"' and role = '"+"receptionist"+"'");
			response.sendRedirect("deleted.jsp");
			break;
		}
		
		else if (session.getAttribute("Check") == "active"){
			statement.executeUpdate("update emloyee2 set Activity='"+"active"+"' where username = '"+username+"'");
			statement.executeUpdate("update roles set Activity='"+"active"+"' where username = '"+username+"' and role = '"+"receptionist"+"'");
			response.sendRedirect("active.jsp");
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
    
        <h1 id="msg" style="color: red">Check username.</h1>
    	
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