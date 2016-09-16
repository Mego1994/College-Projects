<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.Barcode128"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.Document"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>

<%
Document document = new Document();
response.setContentType("application/pdf");
PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());

document.open();

//Barcode 128
//document.add(new Paragraph((String)session.getAttribute("fname") + " " + (String)session.getAttribute("lname")));

Barcode128 code128 = new Barcode128();
code128.setCodeType(Barcode128.CODE128);
code128.setGenerateChecksum(true);
code128.setCode((String)session.getAttribute("datatoencode"));
//code128.setCode("mohamedmagdy");

//Add Barcode to PDF document
//document.add(code128.createImageWithBarcode(writer.getDirectContent(), null, null));
Image code128Image = code128.createImageWithBarcode(writer.getDirectContent(), null, null);
code128Image.scalePercent(200);
document.add(code128Image);    

document.close();

%>

</body>
</html>



