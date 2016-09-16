<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.ColumnText"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="javax.mail.BodyPart"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="javax.mail.util.ByteArrayDataSource"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	<%!
		void grayFill(PdfPCell cell2, float value){
			cell2.setGrayFill(value);	
			
		}
		
		%>
<%

if (request.getParameter("mail") != null) {
		Class.forName("com.mysql.jdbc.Driver");
		//change localhsot password
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis", "root", "");
		Statement statement = con.createStatement();
		//retrieving tests names from DB.
		ResultSet rs1 = statement.executeQuery("select * from insertpatient where username = '" + session.getAttribute("LoginUsername") + "'");

		String to;

		while (rs1.next()) {
			to = rs1.getString("email");

			final String from = "CompleteCareLab@gmail.com";
			final String password = "completecarelab2016";

			//configuration
			Properties props = new Properties();
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");

			javax.mail.Session session2 = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, password);
				}
			});

			Transport transport = session2.getTransport();
			InternetAddress addressFrom = new InternetAddress(from);

			//mail message
			MimeMessage message = new MimeMessage(session2);
			message.setSender(addressFrom);
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			ByteArrayOutputStream outputStream = null;
			BodyPart messageBodyPart = new MimeBodyPart();

			//write the PDF content to the output stream
			outputStream = new ByteArrayOutputStream();

			//pdf file
			Document document = new Document();
			// response.setContentType("application/pdf");
			PdfWriter.getInstance(document, outputStream);
			document.open();

			document.addSubject("Test Results");
			document.addAuthor("Complete Care Lab");

			//document.add(new Paragraph("Complete Care Lab"));

			//Inserting Image in PDF
		    Image image = Image.getInstance ("C://gp2016/WebContent/images/logo.png");
		    //image.scaleAbsolute(120f, 60f);				//image width,height	
			image.scalePercent(65);
		    image.setAlt("Complete Care Lab");
		    image.setAlignment(image.MIDDLE);
			

			//Inserting patientTable in PDF
			PdfPTable patientTable = new PdfPTable(4);
			patientTable.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell cell = new PdfPCell(new Paragraph("Patient Information"));

			cell.setColspan(4);
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPadding(10.0f);
			cell.setBackgroundColor(new BaseColor(153, 204, 255));
			patientTable.addCell(cell);

			//1st row
			cell = new PdfPCell(new Phrase("Patient Username"));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setGrayFill(0.70f);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase((String) session.getAttribute("LoginUsername")));
			cell.setBorder(Rectangle.NO_BORDER);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase("Referred By"));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setGrayFill(0.70f);
			patientTable.addCell(cell);

			rs1 = statement.executeQuery("select * from insertpatient where username = '" + session.getAttribute("LoginUsername") + "'");

			while (rs1.next()) {
				if(rs1.getString("refdoc").equals("")){
					if(rs1.getString("gender").equals("male")){
						cell = new PdfPCell(new Phrase("himself"));
						cell.setBorder(Rectangle.NO_BORDER);
						patientTable.addCell(cell);
					}else if(rs1.getString("gender").equals("female")){
						cell = new PdfPCell(new Phrase("herself"));
						cell.setBorder(Rectangle.NO_BORDER);
						patientTable.addCell(cell);
					}
				}else{
					cell = new PdfPCell(new Phrase("Dr." + (String) rs1.getString("refdoc")));
					cell.setBorder(Rectangle.NO_BORDER);
					patientTable.addCell(cell);
				}
			}

			//2nd row
			cell = new PdfPCell(new Phrase("Name"));
			cell.setBorder(Rectangle.NO_BORDER);
		
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase((String) session.getAttribute("patientFname") + " " + (String) session.getAttribute("patientLname")));
			cell.setBorder(Rectangle.NO_BORDER);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase(""));
			cell.setBorder(Rectangle.NO_BORDER);
			//cell.setGrayFill(0.85f);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase(""));
			cell.setBorder(Rectangle.NO_BORDER);
			patientTable.addCell(cell);

			//3rd row
			cell = new PdfPCell(new Phrase("Birth Date"));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setGrayFill(0.70f);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase((String) session.getAttribute("patientBdate")));
			cell.setBorder(Rectangle.NO_BORDER);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase(""));
			cell.setBorder(Rectangle.NO_BORDER);
			//cell.setGrayFill(0.85f);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase(""));
			cell.setBorder(Rectangle.NO_BORDER);
			patientTable.addCell(cell);

			//4th row
			cell = new PdfPCell(new Phrase("Gender"));
			cell.setBorder(Rectangle.NO_BORDER);
			
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase((String) session.getAttribute("patientGender")));
			cell.setBorder(Rectangle.NO_BORDER);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase(""));
			cell.setBorder(Rectangle.NO_BORDER);
			//cell.setGrayFill(0.85f);
			patientTable.addCell(cell);

			cell = new PdfPCell(new Phrase(""));
			cell.setBorder(Rectangle.NO_BORDER);
			patientTable.addCell(cell);

			patientTable.setSpacingBefore(30.0f); // Space Before patientTable starts, like margin-top in CSS
			patientTable.setSpacingAfter(30.0f); // Space After patientTable starts, like margin-Bottom in CSS								          

			//Inserting testTable in PDF
			PdfPTable testTable = new PdfPTable(5);
			testTable.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell cell2 = new PdfPCell(new Paragraph("Tests Information"));

			cell2.setColspan(5);
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell2.setPadding(10.0f);
			cell2.setBackgroundColor(new BaseColor(153, 204, 255));
			testTable.addCell(cell2);

			//1st row
			cell2 = new PdfPCell(new Phrase("Test"));
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setGrayFill(0.70f);
			testTable.addCell(cell2);

			cell2 = new PdfPCell(new Phrase("Date"));
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setGrayFill(0.70f);
			testTable.addCell(cell2);

			cell2 = new PdfPCell(new Phrase("Result"));
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setGrayFill(0.70f);
			testTable.addCell(cell2);

			cell2 = new PdfPCell(new Phrase("Unit"));
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setGrayFill(0.70f);
			testTable.addCell(cell2);

			cell2 = new PdfPCell(new Phrase("Range"));
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setGrayFill(0.70f);
			testTable.addCell(cell2);

			//2nd row
			//view all tests in one pdf report.
		
		document.addTitle("Tests Results Report");

		String[] testsCommaSplit = {};
		String[] datesCommaSplit = {};
		int i = 0;
		
		rs1 = statement.executeQuery("select * from samples");
		
		while(rs1.next())
		{
			if(session.getAttribute("LoginUsername").equals(rs1.getString("username")) && session.getAttribute("LoginPassword").equals(rs1.getString("password")))
			{
				String tests = rs1.getString("tests");
// 				String dates = rs1.getString("test_date");
			
				if(tests != null){
					String testsBracketsRemoved = tests.replaceAll("\\[", "").replaceAll("\\]","");
					testsCommaSplit = testsBracketsRemoved.split(",");
			
// 					String datesBracketsRemoved = dates.replaceAll("\\[", "").replaceAll("\\]","");
// 					datesCommaSplit = datesBracketsRemoved.split(",");
				
				}
				
			}
			
		}
				
		while (i < testsCommaSplit.length) {
			if (i%2!=0){
			
			if (testsCommaSplit[i].startsWith(" "))
				testsCommaSplit [i] = testsCommaSplit[i].substring(1);
				
			cell2 = new PdfPCell(new Phrase(testsCommaSplit[i]));
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setGrayFill(0.90f);
			testTable.addCell(cell2);

			cell2 = new PdfPCell(new Phrase((String)session.getAttribute("patientdates")));;
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setGrayFill(0.90f);
			testTable.addCell(cell2);

			//result
			String sampleCode = null;
			rs1 = statement.executeQuery("select * from insertpatient where username = '" + session.getAttribute("LoginUsername") + "'");
			if (rs1.next()) {
				sampleCode = rs1.getString("sampleCode");
			}
			
			rs1 = statement.executeQuery("select * from results where specimenID = '" + sampleCode + "'");
			if (rs1.next()) {
				cell2 = new PdfPCell(new Phrase(rs1.getString("result")));
				cell2.setBorder(Rectangle.NO_BORDER);
				grayFill( cell2,  0.90f);

				testTable.addCell(cell2);
			}
			
			rs1 = statement.executeQuery("select * from tests_db where name = '" + testsCommaSplit[i] + "'");
			
			if (rs1.next()) {
// 				cell2 = new PdfPCell(new Phrase(""));
// 				cell2.setBorder(Rectangle.NO_BORDER);
// 				cell2.setGrayFill(0.90f);
// 				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase((String) rs1.getString("units")));
				cell2.setBorder(Rectangle.NO_BORDER);
				cell2.setGrayFill(0.90f);
				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase((String) rs1.getString("ranges")));
				cell2.setBorder(Rectangle.NO_BORDER);
				cell2.setGrayFill(0.90f);
				testTable.addCell(cell2);

			}else {
				cell2 = new PdfPCell(new Phrase(""));
				cell2.setBorder(Rectangle.NO_BORDER);
				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase(""));
				cell2.setBorder(Rectangle.NO_BORDER);
				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase(""));
				cell2.setBorder(Rectangle.NO_BORDER);
				testTable.addCell(cell2);

			}
}
			else{
				
				if (testsCommaSplit[i].startsWith(" "))
					testsCommaSplit [i] = testsCommaSplit[i].substring(1);
					
				cell2 = new PdfPCell(new Phrase(testsCommaSplit[i]));
				cell2.setBorder(Rectangle.NO_BORDER);
				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase(datesCommaSplit[i]));
				cell2.setBorder(Rectangle.NO_BORDER);
				testTable.addCell(cell2);

				rs1 = statement.executeQuery("select * from tests_db where name = '" + testsCommaSplit[i] + "'");
				
				if (rs1.next()) {
					cell2 = new PdfPCell(new Phrase(""));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

					cell2 = new PdfPCell(new Phrase((String) rs1.getString("units")));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

					cell2 = new PdfPCell(new Phrase((String) rs1.getString("ranges")));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

				}else {
					cell2 = new PdfPCell(new Phrase(""));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

					cell2 = new PdfPCell(new Phrase(""));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

					cell2 = new PdfPCell(new Phrase(""));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

				}
			}
			
			i++;
			
		}
			
			//mail subject
			String subject = "Tests Results Report";
			message.setSubject(subject);
			
			
			testTable.setSpacingBefore(30.0f); // Space Before patientTable starts, like margin-top in CSS
			testTable.setSpacingAfter(30.0f); // Space After patientTable starts, like margin-Bottom in CSS								          


			//Now Insert Every Thing Into PDF Document
			document.open();		//PDF document opened........			       

			document.add(image);

			document.add(Chunk.NEWLINE); //Something like in HTML :-)

			document.add(patientTable);
			document.add(Chunk.NEWLINE); //Something like in HTML :-)
			document.add(testTable);
			//document.newPage();            //Opened new page

			document.close();

			byte[] bytes = outputStream.toByteArray();

			//construct the pdf body part
			DataSource dataSource = new ByteArrayDataSource(bytes, "application/pdf");
			
			MimeBodyPart pdfBodyPart1 = new MimeBodyPart();
			pdfBodyPart1.setContent("<strong>Complete Care Lab</strong> wishes you are in a good health. We attached the required tests results report here. Please kindly review it. <br><br>Best Regards, <br>Complete Care Lab", "text/html");
			
			MimeBodyPart pdfBodyPart2 = new MimeBodyPart();
			pdfBodyPart2.setDataHandler(new DataHandler(dataSource));
			pdfBodyPart2.setFileName("Tests Results Report.pdf");

			//construct the mime multi part
			MimeMultipart mimeMultipart = new MimeMultipart();
			mimeMultipart.addBodyPart(pdfBodyPart1);
			mimeMultipart.addBodyPart(pdfBodyPart2);

			//create the sender/recipient addresses
			InternetAddress iaSender = new InternetAddress(from);
			InternetAddress iaRecipient = new InternetAddress(to);

			message.setContent(mimeMultipart);
			
			try{
				transport.connect();
				Transport.send(message);
				transport.close();
				response.sendRedirect("Mail.jsp?case=Mail.Sent.Successfully");
			} catch(Exception e){
				//out.print("<h1>Mail Not Sent</h1>");
				response.sendRedirect("Mail.jsp?case=Mail.Not.Sent");
			}
			
		}
		
	} else if (request.getParameter("pdf") != null) {

		Document document = new Document();
		response.setContentType("application/pdf");
		PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
		document.open();

		document.addSubject("Test Results");
		document.addAuthor("Complete Care Lab");

		//document.add(new Paragraph("Complete Care Lab"));

		//Inserting Image in PDF
// 		    Image image = Image.getInstance ("C://gp2016/WebContent/images/logo.png");
// 		    //image.scaleAbsolute(120f, 60f);				//image width,height	
// 			image.scalePercent(65);
// 		    image.setAlt("Complete Care Lab");
// 		    image.setAlignment(image.MIDDLE);
		    
		//Inserting patientTable in PDF
		PdfPTable patientTable = new PdfPTable(4);
		patientTable.setHorizontalAlignment(Element.ALIGN_CENTER);

		PdfPCell cell = new PdfPCell(new Paragraph("Patient Information"));

		cell.setColspan(4);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setPadding(10.0f);
		cell.setBackgroundColor(new BaseColor(153, 204, 255));
		patientTable.addCell(cell);

		//1st row
		cell = new PdfPCell(new Phrase("Patient Username"));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setGrayFill(0.90f);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase((String) session.getAttribute("LoginUsername")));
		cell.setBorder(Rectangle.NO_BORDER);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase("Referred By"));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setGrayFill(0.90f);
		patientTable.addCell(cell);

		Class.forName("com.mysql.jdbc.Driver");
		//change localhsot password
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lis", "root", "");
		Statement statement = con.createStatement();
		//retrieving tests names from DB.
		ResultSet rs1 = statement.executeQuery("select * from insertpatient where username = '" + session.getAttribute("LoginUsername") + "'");

		while (rs1.next()) {
			if(rs1.getString("refdoc").equals("")){
				if(rs1.getString("gender").equals("male")){
					cell = new PdfPCell(new Phrase("himself"));
					cell.setBorder(Rectangle.NO_BORDER);
					patientTable.addCell(cell);
				}else if(rs1.getString("gender").equals("female")){
					cell = new PdfPCell(new Phrase("herself"));
					cell.setBorder(Rectangle.NO_BORDER);
					patientTable.addCell(cell);
				}
			}else{
				cell = new PdfPCell(new Phrase("Dr." + (String) rs1.getString("refdoc")));
				cell.setBorder(Rectangle.NO_BORDER);
				patientTable.addCell(cell);
			}
		}

		//2nd row
		cell = new PdfPCell(new Phrase("Name"));
		cell.setBorder(Rectangle.NO_BORDER);
	
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase((String) session.getAttribute("patientFname") + " " + (String) session.getAttribute("patientLname")));
		cell.setBorder(Rectangle.NO_BORDER);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase(""));
		cell.setBorder(Rectangle.NO_BORDER);
		//cell.setGrayFill(0.85f);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase(""));
		cell.setBorder(Rectangle.NO_BORDER);
		patientTable.addCell(cell);

		//3rd row
		cell = new PdfPCell(new Phrase("Birth Date"));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setGrayFill(0.90f);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase((String) session.getAttribute("patientBdate")));
		cell.setBorder(Rectangle.NO_BORDER);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase(""));
		cell.setBorder(Rectangle.NO_BORDER);
		//cell.setGrayFill(0.85f);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase(""));
		cell.setBorder(Rectangle.NO_BORDER);
		patientTable.addCell(cell);

		//4th row
		cell = new PdfPCell(new Phrase("Gender"));
		cell.setBorder(Rectangle.NO_BORDER);
	
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase((String) session.getAttribute("patientGender")));
		cell.setBorder(Rectangle.NO_BORDER);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase(""));
		cell.setBorder(Rectangle.NO_BORDER);
		//cell.setGrayFill(0.85f);
		patientTable.addCell(cell);

		cell = new PdfPCell(new Phrase(""));
		cell.setBorder(Rectangle.NO_BORDER);
		patientTable.addCell(cell);

		patientTable.setSpacingBefore(30.0f); // Space Before patientTable starts, like margin-top in CSS
		patientTable.setSpacingAfter(30.0f); // Space After patientTable starts, like margin-Bottom in CSS								          

		//Inserting testTable in PDF
		PdfPTable testTable = new PdfPTable(5);
		testTable.setHorizontalAlignment(Element.ALIGN_CENTER);

		PdfPCell cell2 = new PdfPCell(new Paragraph("Tests Information"));

		cell2.setColspan(5);
		cell2.setBorder(Rectangle.NO_BORDER);
		cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell2.setPadding(10.0f);
		cell2.setBackgroundColor(new BaseColor(153, 203, 255));
		testTable.addCell(cell2);

		//1st row
		cell2 = new PdfPCell(new Phrase("Test"));
		cell2.setBorder(Rectangle.NO_BORDER);
		cell2.setGrayFill(0.70f);
		testTable.addCell(cell2);

		cell2 = new PdfPCell(new Phrase("Date"));
		cell2.setBorder(Rectangle.NO_BORDER);
		cell2.setGrayFill(0.70f);
		testTable.addCell(cell2);

		cell2 = new PdfPCell(new Phrase("Result"));
		cell2.setBorder(Rectangle.NO_BORDER);
		cell2.setGrayFill(0.70f);
		testTable.addCell(cell2);

		cell2 = new PdfPCell(new Phrase("Unit"));
		cell2.setBorder(Rectangle.NO_BORDER);
		cell2.setGrayFill(0.70f);
		testTable.addCell(cell2);

		cell2 = new PdfPCell(new Phrase("Range"));
		cell2.setBorder(Rectangle.NO_BORDER);
		cell2.setGrayFill(0.70f);
		testTable.addCell(cell2);

		
		//2nd row
		//view all tests in one pdf report.
		
		document.addTitle("Tests Results Report");

		String[] testsCommaSplit = {};
		String[] datesCommaSplit = {};
		int i = 0;
		
		rs1 = statement.executeQuery("select * from samples");
		
		while(rs1.next())
		{
			if(session.getAttribute("LoginUsername").equals(rs1.getString("username")) && session.getAttribute("LoginPassword").equals(rs1.getString("password")))
			{
				String tests = rs1.getString("tests");
// 				String dates = rs1.getString("test_date");
			
				if(tests != null){
					String testsBracketsRemoved = tests.replaceAll("\\[", "").replaceAll("\\]","");
					testsCommaSplit = testsBracketsRemoved.split(",");
			
// 					String datesBracketsRemoved = dates.replaceAll("\\[", "").replaceAll("\\]","");
// 					datesCommaSplit = datesBracketsRemoved.split(",");
				
				}
				
			}
			
		}
		%>	
		
	
		
		
		<%
		while (i < testsCommaSplit.length) {
			
			if (i%2!=0){
			if (testsCommaSplit[i].startsWith(" "))
				testsCommaSplit [i] = testsCommaSplit[i].substring(1);
				
			cell2 = new PdfPCell(new Phrase(testsCommaSplit[i]));
			cell2.setBorder(Rectangle.NO_BORDER);
			grayFill( cell2,  0.90f);
			testTable.addCell(cell2);
			

			cell2 = new PdfPCell(new Phrase((String)session.getAttribute("patientdates")));
			cell2.setBorder(Rectangle.NO_BORDER);
			grayFill( cell2,  0.90f);

			testTable.addCell(cell2);

			//result
			String sampleCode = null;
			rs1 = statement.executeQuery("select * from samples where username = '" + session.getAttribute("LoginUsername") + "'");
			if (rs1.next()) {
				sampleCode = rs1.getString("sampleCode");
			}
			
			rs1 = statement.executeQuery("select * from results where specimenID = '" + sampleCode + "'");
			if (rs1.next()) {
				cell2 = new PdfPCell(new Phrase(rs1.getString("result")));
				cell2.setBorder(Rectangle.NO_BORDER);
				grayFill( cell2,  0.90f);

				testTable.addCell(cell2);
			}
			
			rs1 = statement.executeQuery("select * from tests_db where name = '" + testsCommaSplit[i] + "'");
			
			if (rs1.next()) {
//  				cell2 = new PdfPCell(new Phrase(""));
//  				cell2.setBorder(Rectangle.NO_BORDER);
//  				grayFill( cell2,  0.90f);

// 				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase((String) rs1.getString("units")));
				cell2.setBorder(Rectangle.NO_BORDER);
				grayFill( cell2,  0.90f);

				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase((String) rs1.getString("ranges")));
				cell2.setBorder(Rectangle.NO_BORDER);
				grayFill( cell2,  0.90f);

				testTable.addCell(cell2);

			}else {
				cell2 = new PdfPCell(new Phrase(""));
				cell2.setBorder(Rectangle.NO_BORDER);
				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase(""));
				cell2.setBorder(Rectangle.NO_BORDER);
				testTable.addCell(cell2);

				cell2 = new PdfPCell(new Phrase(""));
				cell2.setBorder(Rectangle.NO_BORDER);
				testTable.addCell(cell2);

			}

			}else{
				
				if (testsCommaSplit[i].startsWith(" "))
					testsCommaSplit [i] = testsCommaSplit[i].substring(1);
					
				cell2 = new PdfPCell(new Phrase(testsCommaSplit[i]));
				cell2.setBorder(Rectangle.NO_BORDER);
			
				testTable.addCell(cell2);
				


				cell2 = new PdfPCell(new Phrase((String)session.getAttribute("patientdates")));
				cell2.setBorder(Rectangle.NO_BORDER);
		

				testTable.addCell(cell2);

				rs1 = statement.executeQuery("select * from tests_db where name = '" + testsCommaSplit[i] + "'");
				
				if (rs1.next()) {
					cell2 = new PdfPCell(new Phrase(""));
					cell2.setBorder(Rectangle.NO_BORDER);
				

					testTable.addCell(cell2);

					cell2 = new PdfPCell(new Phrase((String) rs1.getString("units")));
					cell2.setBorder(Rectangle.NO_BORDER);
				

					testTable.addCell(cell2);

					cell2 = new PdfPCell(new Phrase((String) rs1.getString("ranges")));
					cell2.setBorder(Rectangle.NO_BORDER);
					

					testTable.addCell(cell2);

				}else {
					cell2 = new PdfPCell(new Phrase(""));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

					cell2 = new PdfPCell(new Phrase(""));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

					cell2 = new PdfPCell(new Phrase(""));
					cell2.setBorder(Rectangle.NO_BORDER);
					testTable.addCell(cell2);

				}

			}
			i++;
			
		}

		testTable.setSpacingBefore(30.0f);		// Space Before patientTable starts, like margin-top in CSS
		testTable.setSpacingAfter(30.0f); 		// Space After patientTable starts, like margin-Bottom in CSS								          
		
		//Now Insert Every Thing Into PDF Document
		document.open();//PDF document opened........			       

		//document.add(image);

		document.add(Chunk.NEWLINE); //Something like in HTML :-)

		document.add(patientTable);
		document.add(Chunk.NEWLINE); //Something like in HTML :-)
		document.add(testTable);
		//document.newPage();            //Opened new page
		
// 		Paragraph signature = new Paragraph("Signature\n Dr.");
// 		//signature.setAlignment(signature.ALIGN_CENTER); 
// 		ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_LEFT, signature, 450, PageSize.A4.getWidth()-560, 0);
// 		//document.add(signature);
		
		document.close();

	}
	
%>

<%!%>
<html>
<body>
	<center></center>
	</p>
</body>
</html>