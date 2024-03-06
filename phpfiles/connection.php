<?php
define('DB_HOST', 'rvacdevdb.cfuwauqqmeg3.us-east-2.rds.amazonaws.com');
define('DB_USER', 'rvacnightmare');
define('DB_PASS', '6Px5ozY8NxBa74SUtabs');
define('DB_NAME', 'rvacdev');

// Create connection
$connectNow = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// Check connection
if ($connectNow->connect_error) {
    die("Connection failed: " . $connectNow->connect_error);
}

// Set character set to UTF-8
$connectNow->set_charset("utf8");
?>
