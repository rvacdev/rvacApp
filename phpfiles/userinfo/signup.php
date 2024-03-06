<?php
include '../connection.php';

// Allow from any origin
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");

// Allow credentials for specific origin
if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: http://localhost:port");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');    // cache for 1 day
}

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

    exit(0);
}
// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    header("Access-Control-Allow-Origin: *"); // Adjust as needed for your security requirements
    header("Access-Control-Allow-Methods: POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");
    exit();
}

$userName = $_POST['user_name'];
$userEmail = $_POST['user_email'];
$userPassword = password_hash($_POST['user_password'], PASSWORD_BCRYPT);

$sqlQuery = "INSERT INTO users_table (user_name, user_email, user_password) VALUES ('$userName', '$userEmail', '$userPassword')";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery) {
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}
?>
