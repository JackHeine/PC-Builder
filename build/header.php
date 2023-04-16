<?php

    // THIS IS A PLACE HOLDER THE USER ID IS STORED IN THE SESSION
    // THIS SHOULD BE REPLACED BY THE LOGIN MECHANISM
    session_start();

    require_once('./../dbConnect.php');
    $stmt = $conn->prepare("SELECT * FROM pc_build WHERE PC_ID = ? AND User_ID = ?");
    $stmt->bind_param("ii", $_GET['id'], $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $build = $result->fetch_assoc();

    $stmt = $conn->prepare("SELECT current_build_percent(?) AS Percent");
    $stmt->bind_param("i", $build['PC_ID']);
    $stmt->execute();
    $result = $stmt->get_result();
    $percent = $result->fetch_assoc();

    $stmt = $conn->prepare("SELECT current_build_price(?) AS Price");
    $stmt->bind_param("i", $build['PC_ID']);
    $stmt->execute();
    $result = $stmt->get_result();
    $price = $result->fetch_assoc();

?>

<div>
        <div class="clearfix">
        <h1 class="float-left"><?= $build['Nickname'] ?></h1>
    <h2 class="float-right">Est. Price $<?= $price['Price'] ?></h2>
            </div>
   
    </div>
    <br>
    <div class="progress">
        <div class="progress-bar" role="progressbar" style="width: <?= $percent['Percent'] ?>%" aria-valuenow="<?= $percent['Percent'] ?>" aria-valuemin="0" aria-valuemax="100"><?= $percent['Percent'] ?>%</div>
    </div>
    <br>
    <br>