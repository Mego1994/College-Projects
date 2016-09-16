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

	$conn = new mysqli($servername, $username, $password,$dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	$x1 = $_POST['name'];
	$x2 = $_POST['manufacture'];
	$x22 = $_POST['production_date'];
	$x3 = $_POST['life_time'];
	$x4 = $_POST['serial_no'];
	$x5 = $_POST['status'];
	$x6 = $_POST['bio_eng_id'];
	$x7 = $_POST['company_code'];
	$action = $_POST['action'];
	switch ($action){
	case "insert":
	$sql = "INSERT INTO device(d_name,manufacture,life_time,production_date,serial_no,status,device_bio,device_company)
	VALUES ('$x1','$x2','$x22','$x3','$x4','$x5','$x6','$x7')";
	if ($conn->query($sql) === TRUE) {
    echo '<h2>New record created successfully.</h2>';
	} else {
    echo "<h2>Error: can't insert record.</h2";
	}
	$conn->close();
	break;
	case "update":
	$sql = "UPDATE device
	SET d_name='$x1',manufacture = '$x2', production_date='$x22' ,life_time = '$x3', status ='$x5',  device_bio= '$x6',device_company = '$x7'
	WHERE  serial_no= $x4";
	if ($conn->query($sql) === TRUE) {
    echo '<h2>Record updated successfully.</h2>';
	} else {
    echo "<h2>Error: can't update record.</h2>";
	}

	$conn->close();
	break;
	
	case "delete":
	$sql = "delete from device	WHERE serial_no = $x4";
	if ($conn->query($sql) === TRUE) {
    echo '<h2>Record deleted successfully.</h2>';
	} else {
    echo "<h2>Error: can't delete record.</h2>";
	}
	$conn->close();
	break;
	
	default:
	$sql = "INSERT INTO device(d_name,manufacture,life_time,production_date,serial_no,status,device_bio,device_company)
	VALUES ('$x1','$x2','$x22','$x3','$x4','$x5','$x6','$x7')";
	if ($conn->query($sql) === TRUE) {
    echo '<h2>New record inserted successfully0</h2>';
	} else {
    echo "<h2>Error: can't insert record.</h2>";
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
