<?php
DEFINE('DB_USER','saarthak');
DEFINE('DB_PASSWORD','1234');
DEFINE('DB_HOST','localhost');
DEFINE('DB_NAME','spedia');

$dbc=mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME)
OR dies('Could not connect to MySQL:' .
	mysqli_connect_error());
?>
