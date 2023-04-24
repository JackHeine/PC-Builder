<?php

require_once '../dbConnect.php';

session_start();

$stmt = $conn->prepare("SELECT Admin FROM User WHERE User_ID = ?");
$stmt->bind_param("i", $_SESSION['user_id']);
$stmt->execute();
$results = $stmt->get_result()->fetch_assoc();


if (!$results['Admin']) {
	header('Location: ../unauthorized-401.php');
	die();
}
?>