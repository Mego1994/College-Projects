<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Contact</title>
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

<!-- A library for disabling user from submitting when one or any fields not filled in. -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/localization/messages_en.js"></script>

<link rel="stylesheet" href="tooplate_style.css" type="text/css">

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

		<div id="home_menu">
			<a href="index.jsp"></a>
		</div>

		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="Tests.jsp">Tests</a></li>
			<li><a href="about.jsp">About Us</a></li>
			<li><a href="contact.jsp" class="current">Contact</a></li>
			<li><a href="Signin.jsp">| Sign in</a></li>
		</ul>

	</div>
	<!-- end of tooplate_menu -->



		<div id="tooplate_content">

			<h2>Contact Information</h2>
			<div class="two_column_ws float_l">

				<h6>Our Location</h6>
				225-880 Quisque odio quam, <br /> Pulvinar sit amet convallis eget,
				10110<br /> Venenatis ut turpis<br /> <br /> Tel: 020-050-5520<br />
				Fax: 020-040-1680
			</div>

			<div class="two_column_ws float_r">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13817.277029115332!2d31.225912244217163!3d30.027697407267805!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0x282c4b44cdf7e83c!2sFaculty+Of+Engineering+-+Cairo+University!5e0!3m2!1sen!2seg!4v1423231178722"
					alt="Our Location, Needs Internet Connection to View it."
					width="350" height="280" frameborder="0" style="border: 0"></iframe>
			</div>

			<div class="cleaner_h50"></div>

			<div id="contact_form">

				<h4 style="color: red;">We welcome your feedback through this form,</h4>
				<form method="post" name="contact_form"
					action="contactFormActions.jsp" id="contact_form">

					<label for="author">Name:</label> <input type="text"
						id="contactName" name="contactName" class="required input_field" />
					<div class="cleaner_h10"></div>

					<label for="email">Email:</label> <input type="email"
						class="validate-email required input_field" name="contactEmail"
						id="contactEmail" />
					<div class="cleaner_h10"></div>

					<label for="subject">Subject:</label> <input type="text"
						class="validate-subject required input_field"
						name="contactSubject" id="contactSubject" />
					<div class="cleaner_h10"></div>

					<label for="text">Message:</label>
					<textarea placeholder="Message length till 1000 characters."
						id="contactMessage" name="contactMessage" rows="0" cols="0"
						class="required"></textarea>
					<div class="cleaner_h10"></div>

					<input type="submit" value="Send" id="submit" name="submit"
						class="submit_btn float_l" />

				</form>
			</div>

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

			Copyright © 2048 <a href="#">Top Secret Bio's</a> - Design: <a
				href="http://www.tooplate.com">tooplate</a>

		</div>
		<!-- end of tooplate_footer -->

	</div>

	<script>
		//validate sign up form fields.
		$("#contact_form")
				.validate(
						{
							rules : {
								contactName : "required",
								contactEmail : "required",
								contactMessage : "required"
							},

							messages : {
								contactName : "Type your name.",
								contactEmail : "Type your email.",
								contactMessage : "Type your message. message length to 1000 characters."
							},

							highlight : function(element, errorClass) {
								$(element).fadeOut(function() {
									$(element).fadeIn();
								});
							},

							submitHandler : function(form) {
								form.submit();
							}

						});
	</script>

</body>
</html>