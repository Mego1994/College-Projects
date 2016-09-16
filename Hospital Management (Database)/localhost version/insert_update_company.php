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
      <div class="left-box"> <h2>This is the basic version of our website.</h2>      </div>
    </div>
<div id="main"> <a name="TemplateInfo"></a>
<h2><a id="show" style="text-decoration:underline" onclick="open" href="data_tables.php">Show data tables before insert.</h2></a>
    
    <script>
		var show=document.getElementById("show");
    	show.onclick=function open(){
				show.target="_target";
		}
	
    </script>

    <h2> Insert into Company table</h2>
    <h3>
    <form action = "action_company.php" method = "POST">
Company Name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type = "text" maxlength = "45" name = "name">
<br />
<br />
Mother Company: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type = "text" maxlength = "45" name="mother_company">
<br />
<br />
Type: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type = "text" maxlength = "45" name = "type">
<br />
<br />
Code: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type = "number" maxlength = "10" name ="code" >
<br />
<br />
Address: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type= "text" maxlength = "45" name ="location">
<br />
<br />
Description: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type = "text" maxlength = "45" name = "description">
	<br/><br/>
	<input type="radio" name="action" value="insert">
Insert new record &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type="radio" name="action" value="update">
Update record &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type="radio" name="action" value="delete">
Delete record
	<br/><br/>
	<button type = "submit"><h3>Submit
	</button>
	</form></h3>
		  
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