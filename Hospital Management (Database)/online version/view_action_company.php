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
      <div class="left-box">    <h2>This is the basic version of our website.</h2>   </div>
    </div>
    <div id="main"> 
      <p><a name="TemplateInfo"></a>

<?php

	$servername = "mysql.hostinger.ae";
	$username = "u645183775_root";
	$password = "11223344";
	$dbname = "u645183775_medic";

	// Create connection
	$conn = new mysqli($servername, $username, $password,$dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	// To count what was checked
	$inputArray = array();	// array creation
	$outputArray = array();
	
	if($_POST['company_code']==""){
		echo "<h2> Company code can't be empty. </h2> ";
		}
		
		else {
		$len = count($inputArray);
		$selectedItems = "company_code";
		for($i = 0;$i<$len;$i++){
			$selectedItems = $selectedItems.",".$inputArray[$i];
		}
		
		
		$len = $len + 1;
		$temp = $_POST['company_code'];
		$sql = "SELECT * FROM company WHERE code = $temp";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
    	// output data of each row
   			 while($row = $result->fetch_assoc()) {
				 echo '<h1>'."From Company: ".'</h1>';
				 echo '<h2>'."Name: " . $row["company_name"]. '</h2>'.'<h2>'."Mother Company: " . $row["mother_company"]. '</h2>'.'<h2>'."Type: " . $row["type"]. '</h2>'.'<h2>'."Location: " . $row["location"]. '</h2>'.'<h2>'."Description: " . $row["description"]. '</h2>';
    	 	}
		} else {
		 echo "<h2>Company does not exist!</h2>" ;
		 echo"";
		 echo"<h2>Please check company code.</h2>";
		}
		
		$conn->close();
		}
	?>

 </p>
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
