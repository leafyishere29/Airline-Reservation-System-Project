<?php
	session_start();
?>
<html>
	<head>
		<title>
			Welcome Administrator
		</title>
		<link rel="stylesheet" type="text/css" href="style.css"/>
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	</head>
	<body>
		<img class="logo" src="images/plane2.png"/> 
		<h1 id="title">
			SPEDIA AIRLINES
		</h1>
		<div>
			<ul>
				<li><a href="home_page.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				<li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<h2>Welcome Administrator!</h2>
		<table cellpadding="5">
			<tr>
				<td class="admin_func"><a href="view_booked_tickets_statistics.php"><i class="fa fa-paper-plane " aria-hidden="true"></i> View Flight Details</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="admin_view_booked_tickets.php"><i class="fa fa-paper-plane " aria-hidden="true"></i> View Passenger Details</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="add_flight_details.php"><i class="fa fa-paper-plane " aria-hidden="true"></i> Add Flight</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="modify_flight_details.php"><i class="fa fa-paper-plane " aria-hidden="true"></i> Update Flight</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="delete_flight_details.php"><i class="fa fa-paper-plane " aria-hidden="true"></i> Delete Flight</a>
				</td>
			</tr>
		</table>
	</body>
</html>