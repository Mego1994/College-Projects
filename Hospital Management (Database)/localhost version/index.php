<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Medical+</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="image/Envision.css" type="text/css" />
</head>
<body>
<div id="wrap">
  <div id="header">
    <a href="index.php"><h1 id="logo-text">Medical+</h1></a>
    <h2 id="slogan">We serve you anywhere you are.</h2>
  </div>
  <div  id="menu">
    <ul>
      <li id="current"><a href="index.php">Home</a></li>
      <li></li>
      <li></li>
      <li></li>
      <li class="last"><a href="About.php">About</a></li>
    </ul>
  </div>
  <div id="content-wrap">
    <div id="sidebar">
      <div class="left-box">
        <h2>This is the basic version of our website.</h2>
      </div>
    </div>
    <div id="main"> <a name="TemplateInfo"></a>
      <h1>WHO WE ARE?</h1>
      <p><strong>Medical+</strong> is a medical company specialized in the <strong>radiotherapy field</strong>.You can know about our vision and mission in  <a href="About.php">About</a>.</p>
      <p>&nbsp;</p>
      <h1>SELECT WHAT TO DO? </h1>
      <ul>
      <h1>
      <li> <a name="insert_db" id="insert_db" href="">Insert or Update or Delete</a></li>

            	<script>
				var insert=document.getElementById("insert_db");
				insert.onclick=function checkCode(){
				var code=prompt("Only Administrator can insert or update or delete.\nType the required code to access database:");
					if(code=="11223344"){
						  insert.target="_parent";
						  insert.href="insert.php";

					}else{
					       alert("Please check your code !");
						 }
				};
			</script>

			<h1>
			  <li> <a href = "view.php">Search </a> </li></h1>
			</h2>	
	  </ul>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </div>
  </div>
 		    
 <div id="footer">
    <p> &copy; 2015 <b>Medical+</b></p>
  </div>
</div>
</body>
</html>