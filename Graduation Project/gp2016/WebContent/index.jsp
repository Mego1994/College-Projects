<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Complete Care Lab | Home</title> 
<meta name="keywords" content="" />
<meta name="description" content="Lab Information System" />

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
        	
            <div id="home_menu"><a href="index.jsp"></a></div>
                
            <ul>
                <li><a href="index.jsp" class="current">Home</a></li>
                  <li><a href="Tests.jsp">Tests</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                 <li><a href="Signin.jsp">| Sign in</a></li>
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->


         <div class="image_wrapper fl_img"><h8>Get Your Test Results Online!</h8> </div> 
    
    <div id="tooplate_content">
    <div class="col_w270 float_r">
        

            
         <div>
         
         
      <img id="imgBanner" src="" alt="" />
        </div> 
			       
        
        </div>
           
     
            <!-- Sign in form -->
            <div id="contact_form"  style="margin:100px 0 0 -200px;">
            
					<form id="signin" action="LoginCheck.jsp" method="post">
						Username: &nbsp;&nbsp;&nbsp;<input type="text" maxlength="45" name="username" class="required input_field">
						<br></br> 
                        Password: &nbsp;&nbsp;&nbsp;<input type="password" name="password" maxlength="16" class="required input_field">
                        
                        <br><br><input style="margin-left: 150px;" type="submit" value="Login" class="submit_btn float_l"> 
                    </form>
				
			</div>           
               <div class="cleaner_h60"></div> 
         
        <div class="cleaner_h30 horizon_divider"></div>
         
       
        <div class="cleaner_h30"></div>
        
        <div class="col_w270 float_l">
	        
        </div>
        
        
        <script type="text/javascript">
            var picPaths = ['images/130405354.jpg','images/tubessss.jpg'];
            var curPic = -1;
            //preload the images for smooth animation
            var imgO = new Array();
            for(i=0; i < picPaths.length; i++) {
                imgO[i] = new Image();
                imgO[i].src = picPaths[i];
            }

            function swapImage() {
                curPic = (++curPic > picPaths.length-1)? 0 : curPic;
                imgCont.src = imgO[curPic].src;
                setTimeout(swapImage,4000);
            }

            window.onload=function() {
                imgCont = document.getElementById('imgBanner');
                swapImage();
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
    
        Copyright © 2048 <a href="#">Top Secret Bio's</a> - Design: <a href="http://www.tooplate.com">tooplate</a>
    
    </div> <!-- end of tooplate_footer -->

</div> 
    
</body>
</html>