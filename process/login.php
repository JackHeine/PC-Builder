<?php
	require_once '../dbConnect.php';
	session_start();

	$stmt = $conn->prepare("SELECT * FROM User WHERE Email = ? AND Password = ?");
	$stmt->bind_param("ss",$_POST['email'], $_POST['password']);
	$stmt->execute();
	$result = $stmt->get_result();

	if ($result->num_rows == 0) {
		header('Location: /login.php?error=Unknown email or password.');
		die();
	} else {
		$_SESSION['user_id'] = $result->fetch_assoc()['User_ID'];
		header('Location: /');
		die();
	}
?>