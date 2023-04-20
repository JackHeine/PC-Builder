<?php
    require_once('./../dbConnect.php');
    session_start();
    
    if($_POST['nickname']) {
        
        $stmt = $conn->prepare("INSERT INTO PC_Build (User_ID, Nickname) VALUES (?, ?)");
        $stmt->bind_param("is", $_SESSION['user_id'], $_POST['nickname']);
        $stmt->execute();
        
    }

    header("Location: ./../dashboard.php");