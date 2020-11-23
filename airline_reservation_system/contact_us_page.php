<?php
	session_start();
	// if($_SESSION['login_user']==null){
	// 	header('location:home_page.php');
	// }
?>
<html>
	<head>
		<title>
			Welcome Customer
		</title>

		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	</head>
	<body>
		<img class="logo" src="images/plane2.png"/> 
		<h1 id="title">
			SPEDIA AIRLINES
		</h1>
		<div>
			<ul>
				<li><a href="home_page.php"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i> Home</a></li>
			</ul>
        </div>
        <h2 padding-left=0>Made By</h2>
		<table cellpadding="5" class="contact_info">
			<tr>
				<td ><i class="fa fa-address-card"></i> Saarthak Jain
				</td>
                <td><i class="fa fa-graduation-cap" ></i> 2K18/CO/306
				</td>
			</tr>
            <tr>
				<td><i class="fa fa-address-card" ></i> Samar Saini
                </td>
                <td><i class="fa fa-graduation-cap" ></i> 2K18/CO/312
				</td>
			</tr>
		</table>    
		</table>
	</body>
</html>