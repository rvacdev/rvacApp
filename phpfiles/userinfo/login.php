<?php
include '../connection.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    exit();
}

$userEmail = $_POST['user_email'];
$userPassword = $_POST['user_password'];

$sqlQuery = "SELECT * FROM users_table WHERE user_email = '$userEmail'";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery->num_rows > 0) {
    $userRecord = $resultOfQuery->fetch_assoc();

    if (password_verify($userPassword, $userRecord['user_password'])) {
        echo json_encode(array(
            "success" => true,
            "userData" => $userRecord
        ));
    } else {
        echo json_encode(array("success" => false));
    }
} else {
    echo json_encode(array("success" => false));
}
?>
