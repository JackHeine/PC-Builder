<?php
    // Include the header
    include './../header.php';
    // THIS IS A PLACE HOLDER THE USER ID IS STORED IN THE SESSION
    // THIS SHOULD BE REPLACED BY THE LOGIN MECHANISM
    session_start();

    require_once('./../dbConnect.php');
    $stmt = $conn->prepare("SELECT * FROM pc_build WHERE PC_ID = ? AND User_ID = ?");
    $stmt->bind_param("ii", $_GET['id'], $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $build = $result->fetch_assoc();
?>

<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../dashboard.php">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page"><?= $build['Nickname'] ?></li>
        </ol>
    </nav>
    <h1><?= $build['Nickname'] ?></h1>
    <h4>CPU</h4>
    <?php
        
        if($build['CPU_ID']) {
            $stmt = $conn->prepare("SELECT * FROM cpu_info WHERE CPU_ID = ?");
            $stmt->bind_param("i", $build['CPU_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $cpu = $result->fetch_assoc();
            echo "<p class='lead'>". $cpu['Manufacturer'] . ": " . $cpu['Model'] ."</p>";
            echo "<a href='./cpu.php?id=". $_GET['id'] ."' class=''>Change CPU</a>";
        } else {
            echo "<p class='lead'>None Selected</p>";
            echo "<a href='./cpu.php?id=". $_GET['id'] ."' class=''>Select CPU</a>";
        }
    ?>
    <hr>
    <h4>Motherboard</h4>
    <?php
        
        if($build['Motherboard_ID']) {
            $stmt = $conn->prepare("SELECT * FROM motherboard_info WHERE Motherboard_ID = ?");
            $stmt->bind_param("i", $build['Motherboard_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $mb = $result->fetch_assoc();
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ."</p>";
            echo "<a href='./cpu.php?id=". $_GET['id'] ."' class=''>Change CPU</a>";
        } else {
            echo "<p class='lead'>None Selected</p>";
            echo "<a href='./cpu.php?id=". $_GET['id'] ."' class=''>Select CPU</a>";
        }
    ?>
    <hr>
    <h4>RAM</h4>
    <hr>
    <h4>GPU</h4>
    <hr>
    <h4>Storage</h4>
    <hr>
    <h4>Power Supply</h4>
    <hr>
    <h4>Case</h4>
    <hr>
</div>

<?php
    include './../footer.php';
?>