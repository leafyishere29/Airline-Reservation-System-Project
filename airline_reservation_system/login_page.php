<?php
	session_start();
?>
<html>
	<head>
		<title>
			Account Login
		</title>
		<style>
			input {
    			border: 1.5px solid #030337;
    			border-radius: 4px;
    			padding: 7px 30px;
			}
			input[type=submit] {
				background-color: #030337;
				color: orange;
    			border-radius: 4px;
    			padding: 7px 45px;
    			margin: 0px 60px
			}
		</style>
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
		<br>
		<br>
		<br>
		<form class="float_form" style="padding-left: 600px" action="login_handler.php" method="POST" >
			<fieldset>
				<legend>Login Details:</legend>
				<strong>Username:</strong><br>
				<input type="text" name="username" placeholder="Enter Username" required><br><br>
				<strong>Password:</strong><br>
				<input type="password" name="password" placeholder="Enter Password" required><br><br>
				<strong>User Type:</strong><br>
				<input type='radio' name='user_type' value='Customer' checked/>
				Customer/Passenger
				<br>  
				<input type='radio' name='user_type' value='Administrator'/>
				Administrator 
				<br><br>
				<?php
					if(isset($_GET['msg']) && $_GET['msg']=='failed')
					{
						echo "<br>
						<strong style='color:red'>Invalid Credentials!!</strong>
						<br><br>";
					}
				?>
				<input type="submit" name="Login" value="Login">
			</fieldset>
			<br>
			<a href="new_user.php"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign Up</a>
		</form>
	</body>
</html>