<%@page import="com.sun.xml.internal.ws.server.sei.SEIInvokerTube"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
	
 				Class.forName("com.mysql.jdbc.Driver");
 	//change localhost password
 	java.sql.Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
        							Statement statement4= con4.createStatement();
        				ResultSet rs4 = statement4.executeQuery("select * from samples where patientID = '"+"patientID"+"' ");

        				
        				//retrieving tests names from DB.
        						//where patientID = //'"+rs.getString("patientID")+"'
        			
        				try{
        					while (rs4.next())
        					{
//         					String PATIENTid=rs4.getString("patientID");
  						//if(rs4.getString("patientID") == rs.getString("patientID"))
  							//+" "+rs.getString("lname")) && session.getAttribute("bdate").equals(rs.getString("bdate")))
        						//{
        							String tests = rs4.getString("tests");
        							String dates = rs4.getString("visitDate");
        						
        							if(tests != null){
        								String testsBracketsRemoved = tests.replaceAll("\\[", "").replaceAll("\\]","");
                						String[] testsCommaSplit = testsBracketsRemoved.split(",");
								
                						String datesBracketsRemoved = dates.replaceAll("\\[", "").replaceAll("\\]","");
                						String[] datesCommaSplit = datesBracketsRemoved.split(",");
									
                						String testAndDate;
								
                						int i = 0;
										
                						while( i< testsCommaSplit.length ){
        									out.println("<tr>");
	        								out.println("<td><strong>"+testsCommaSplit[i]+"</strong></td>");
    	    								out.println("<td><strong>"+datesCommaSplit[i]+"</strong></td>");
    	    							
    	    								testAndDate = testsCommaSplit[i] + "," + datesCommaSplit[i]; 
    	    								//String url = "report.jsp?testName=" + testsCommaSplit[i];
        									out.println("</tr>");
        									i++;

//                                         out.println("<tr>");
//  	    								out.println("<td><strong>"+rs4.getString("tests")+"</strong></td>");
//  	    								out.println("<td><strong>"+rs4.getString("visitDate")+"</strong></td>");
//  	    								out.println("</tr>");
										}
        							}
        						//}
        					
        				}
        					
        				} catch(Exception e){
        					response.sendRedirect("Signin_emp.jsp");
        				}
        				
        				%>
</body>
</html>