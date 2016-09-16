<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

			<%
			
				String fromdate = request.getParameter("fromdate");
				String todate = request.getParameter("todate");
        				
				Class.forName("com.mysql.jdbc.Driver");
        		//change localhsot password
        		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis","root","");
        		Statement statement= con.createStatement();
        		
        		String docLoginUsername = (String) session.getAttribute("LoginUsername");
        		//out.print(docLoginUsername);
        		
        		ResultSet rs;
        				
        		//current date
        		Date dateNow = new Date();
        		SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
        		String currentDate = dateFormat.format(dateNow);
        				
        		//date of previous week
        		Calendar cal = Calendar.getInstance();
        		cal.add(Calendar.DATE, -7);				//decrease 1 week from current date
        		String previousWeekDate = dateFormat.format(cal.getTime());
        		//out.print(datePreviousWeek);
        				
        				
        		if(fromdate == "" && todate == ""){
        			rs = statement.executeQuery("select * from insertpatient where visit_date <= '"+currentDate+"' and visit_date >= '"+previousWeekDate+"' ");
        			
        			while(rs.next())
            		{
            			out.println("<tr>");
            			out.println("<td><strong>"+rs.getString("fname")+" "+rs.getString("lname")+"</strong></td>");
            			out.println("<td><strong>"+rs.getString("visit_date")+"</strong></td>");
            			out.println("<td><strong>"+rs.getString("patientID")+"</strong></td>");	
            			%>
            				
							<td style="color: red"><strong><a target='_blank' href='DoctorviewPatient.jsp?id=<%=rs.getString("patientID")%>'><button>View Profile</button></a></strong></td>
						
    					<%
    					out.println("</tr>");
    				}

        					
        		}else if(todate == ""){
					rs = statement.executeQuery("select * from insertpatient where visit_date >= '"+fromdate+"' ");
        			
        			while(rs.next())
        			{
        				out.println("<tr>");
        				out.println("<td><strong>"+rs.getString("fname")+" "+rs.getString("lname")+"</strong></td>");
						out.println("<td><strong>"+rs.getString("visit_date")+"</strong></td>");
						out.println("<td><strong>"+rs.getString("patientID")+"</strong></td>");            				
            			%>
            				
							<td style="color: red"><strong><a target='_blank' href='DoctorviewPatient.jsp?id=<%=rs.getString("patientID")%>'><button>View Profile</button></a></strong></td>
						
    					<%
    					out.println("</tr>");
    				}
        			
        		}else if(fromdate == ""){
					rs = statement.executeQuery("select * from insertpatient where visit_date <= '"+todate+"' ");
        			
        			while(rs.next())
        			{
        				out.println("<tr>");
        				out.println("<td><strong>"+rs.getString("fname")+" "+rs.getString("lname")+"</strong></td>");
						out.println("<td><strong>"+rs.getString("visit_date")+"</strong></td>");
						out.println("<td><strong>"+rs.getString("patientID")+"</strong></td>");	
            			%>
            				
							<td style="color: red"><strong><a target='_blank' href='DoctorviewPatient.jsp?id=<%=rs.getString("patientID")%>'><button>View Profile</button></a></strong></td>
						
    					<%
    					out.println("</tr>");
    				}
        			
        		}else{
        				
        			rs = statement.executeQuery("select * from insertpatient where visit_date >= '"+fromdate+"' and visit_date <= '"+todate+"' ");
        			
        			while(rs.next())
        			{
        				out.println("<tr>");
        				out.println("<td><strong>"+rs.getString("fname")+" "+rs.getString("lname")+"</strong></td>");
						out.println("<td><strong>"+rs.getString("visit_date")+"</strong></td>");
						out.println("<td><strong>"+rs.getString("patientID")+"</strong></td>");	
            			%>
            				
							<td style="color: red"><strong><a target='_blank' href='DoctorviewPatient.jsp?id=<%=rs.getString("patientID")%>'><button>View Profile</button></a></strong></td>
						
    					<%
    					out.println("</tr>");
    				}
        		}
        			
        	%>
