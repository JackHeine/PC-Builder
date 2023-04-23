<?php
	require_once '../dbConnect.php';
	session_start();

	$stmt = $conn->prepare("SELECT * FROM User WHERE Email = ?");
	$stmt->bind_param("s",$_POST['email']);
	$stmt->execute();
	$result = $stmt->get_result();

	if ($result->num_rows != 0) {
		header('Location: /signup.php?error=User with that email already exists.');
		die();
	} else {
		$stmt = $conn->prepare("INSERT INTO User VALUES(DEFAULT, ?, ?, ?, ?)");
		$stmt->bind_param("ssss",$_POST['email'], $_POST['password'], $_POST['first-name'], $_POST['last-name']);
		$stmt->execute();

		// login the user immediatelly

		$stmt = $conn->preapre("SELECT User_ID FROM User WHERE Email = ? AND Password = ?");
		$stmt->bind_param("ss", $_POST['email'], $_POST['password']);
		$stmt->execute();
		$result = $stmt->get_result()->fetch_assoc();

		$_SESSION['user_id'] = $result['User_ID'];

		header('Location: /');
		die();
	}
?>