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

	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "medical";

	$conn = new mysqli($servername, $username, $password,$dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	$x1 = $_POST['name'];
	$x2 = $_POST['mother_company'];
	$x3 = $_POST['type'];
	$x4 = $_POST['code'];
	$x5 = $_POST['location'];
	$x6 = $_POST['description'];
	$action = $_POST['action'];
	switch ($action){
	
	case "insert":
	$sql = "INSERT INTO company(company_name,mother_company,type,code,location,description)
	VALUES ('$x1','$x2','$x3','$x4','$x5','$x6')";
	if ($conn->query($sql) === TRUE) {
    echo '<h2>New record created successfully.</h2>';
	} else {
    echo "<h2>Error: can't insert record.</h2";
	}
	$conn->close();
	break;
	
	case "update":
	$sql = "UPDATE company
	SET company_name='$x1',mother_company = '$x2', type = '$x3', location = '$x5',description = '$x6'
	WHERE company.code = $x4";
	if ($conn->query($sql) === TRUE) {
    echo '<h2>Record updated successfully.</h2>';
	} else {
    echo "<h2>Error: can't update record.</h2>";
	}
	$conn->close();
	break;
	
	case "delete":
	$sql = "delete from company	WHERE company.code = $x4";
	if ($conn->query($sql) === TRUE) {
    echo '<h2>Record deleted successfully.</h2>';
	} else {
    echo "<h2>Error: can't delete record.</h2>";
	}
	$conn->close();
	
	break;
	default:
	$sql = "INSERT INTO company(company_name,mother_company,type,code,location,description)
	VALUES ('$x1','$x2','$x3','$x4','$x5','$x6')";
	if ($conn->query($sql) === TRUE) {
    echo '<h2>New record created successfully.</h2>';
	} else {
    echo "<h2>Error: can't insert record.</h2";
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
