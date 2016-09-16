<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Medical+</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<body>

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
	
	?>

<h2>Company Table</h2>
<table width="1000" border="1 px" cellpadding="1" cellspacing="1">
	<tr>
    <th>Code</th>
    <th>Company Name</th>
    <th>Mother Company</th>
    <th>Type</th>
    <th>Location</th>
    <th>Description</th>
    
    <?php
		echo "<tr>";
		$sql = "SELECT * FROM company ";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
    	// output data of each row
   			 while($row = $result->fetch_assoc()) {
				echo "<td>".$row['code']."</td>";
				echo "<td>".$row['company_name']."</td>";
				echo "<td>".$row['mother_company']."</td>";
				echo "<td>".$row['type']."</td>";
				echo "<td>".$row['location']."</td>";
				echo "<td>".$row['description']."</td>";
				
				echo "</tr>";
			 }
			 
		}
		
		
	?>
    </table>
<br />
    
    <h2>Biomedical Engineers Table</h2>
    <table width="1000" border="1 px" cellpadding="1" cellspacing="1">
	<tr>
    <th>ID</th>
    <th>First Name</th>
    <th>Middle Name</th>
    <th>Last Name</th>
    <th>Birth Date</th>
    <th>Address</th>
    <th>Salary</th>
    <th>Sex</th>
	<th>Company Code</th>
    <tr>
    <?php
		
		//echo "<tr>";
		$sql = "SELECT * FROM biomedical_engineer ";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
    	// output data of each row
   			 while($row = $result->fetch_assoc()) {
				echo "<td>".$row['bio_id']."</td>";
				echo "<td>".$row['bio_f_name']."</td>";
				echo "<td>".$row['bio_m_name']."</td>";
				echo "<td>".$row['bio_l_name']."</td>";
				echo "<td>".$row['bio_birth_date']."</td>";
				echo "<td>".$row['bio_address']."</td>";
				echo "<td>".$row['bio_salary']."</td>";
				echo "<td>".$row['bio_sex']."</td>";
				echo "<td>".$row['company_bio']."</td>";
				
				echo "</tr>";
			 }
		}
	?>
    </table>
    
    <br />
    
    <h2>Device Table</h2>
    <table width="1000" border="1 px" cellpadding="1" cellspacing="1">
	<tr>
    <th>Serial Number</th>
    <th>Name</th>
    <th>Manufacture</th>
    <th>Productio Date</th>
    <th>Life Time</th>
    <th>Status</th>
    <th>Biomedical Engineer ID</th>
    <th>Company Code</th>
    <tr>
    <?php
		
		//echo "<tr>";
		$sql = "SELECT * FROM device ";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
    	// output data of each row
   			 while($row = $result->fetch_assoc()) {
				echo "<td>".$row['serial_no']."</td>";
				echo "<td>".$row['d_name']."</td>";
				echo "<td>".$row['manufacture']."</td>";
				echo "<td>".$row['production_date']."</td>";
				echo "<td>".$row['life_time']."</td>";
				echo "<td>".$row['status']."</td>";
				echo "<td>".$row['device_bio']."</td>";
				echo "<td>".$row['device_company']."</td>";
				
				echo "</tr>";
			 }
		}
	?>
    </table>
    <br />
    
    <h2>Physician Table</h2>
    <table width="1000" border="1 px" cellpadding="1" cellspacing="1">
	<tr>
    <th>ID</th>
    <th>First Name</th>
    <th>Middle Name</th>
    <th>Last Name</th>
    <th>Birth Date</th>
    <th>Address</th>
    <th>Salary</th>
    <th>Sex</th>
	<th>Device Serial Number</th>
	<th>Biomedical Engineer ID</th>
    <tr>
    <?php
		
		//echo "<tr>";
		$sql = "SELECT * FROM physician ";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
    	// output data of each row
   			 while($row = $result->fetch_assoc()) {
				echo "<td>".$row['phy_id']."</td>";
				echo "<td>".$row['phy_f_name']."</td>";
				echo "<td>".$row['phy_m_name']."</td>";
				echo "<td>".$row['phy_l_name']."</td>";
				echo "<td>".$row['phy_birth_date']."</td>";
				echo "<td>".$row['phy_address']."</td>";
				echo "<td>".$row['phy_salary']."</td>";
				echo "<td>".$row['phy_sex']."</td>";
				echo "<td>".$row['phy_device']."</td>";
				echo "<td>".$row['phy_bio']."</td>";
				echo "</tr>";
			 }
		}
	?>
    </table>
    
    
    
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    
   <div id="footer">
    
    <p>&copy; 2015 <b>Medical+</b></p>
  </div>
</div>
</body>
</html>