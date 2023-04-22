<?php

if($_POST['pc-id']){
    require_once('./../dbConnect.php');
    session_start();

    $stmt = $conn->prepare("SELECT Current_Build_Price(?) AS Price");
    $stmt->bind_param("i", $_POST['pc-id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $price = $result->fetch_assoc();

    $stmt = $conn->prepare("UPDATE PC_Build SET Order_Placed=TRUE, Price=? WHERE User_ID = ? AND PC_ID = ?");
    $stmt->bind_param("dii", $price['Price'], $_SESSION['user_id'], $_POST['pc-id']);
    $stmt->execute();
    
    header("Location: ./order.php?id=" . $_POST['pc-id'] . "");
}

?>
