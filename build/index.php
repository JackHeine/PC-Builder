<?php
    // Include the header
    include './../header.php';
    // THIS IS A PLACE HOLDER THE USER ID IS STORED IN THE SESSION
    // THIS SHOULD BE REPLACED BY THE LOGIN MECHANISM
    session_start();

    require_once('./../dbConnect.php');
    $stmt = $conn->prepare("SELECT * FROM PC_Build WHERE PC_ID = ? AND User_ID = ?");
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
    
    <?php include 'header.php' ?>

    <h4>CPU</h4>
    <?php
        
        if($build['CPU_ID']) {
            $stmt = $conn->prepare("SELECT * FROM cpu_info WHERE CPU_ID = ?");
            $stmt->bind_param("i", $build['CPU_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $cpu = $result->fetch_assoc();
            echo "<p class='lead'>". $cpu['Manufacturer'] . ": " . $cpu['Model'] ." ($" . $cpu['Cost'] . ")</p>";
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
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ." ($" . $mb['Cost'] .")</p>";
            echo "<a href='./motherboard.php?id=". $_GET['id'] ."' class=''>Change Motherboard</a>";
        } else {
            echo "<p class='lead'>None Selected</p>";
            echo "<a href='./motherboard.php?id=". $_GET['id'] ."' class=''>Select Motherboard</a>";
        }
    ?>
    <hr>
    <h4>RAM</h4>
    <?php
        
        if($build['RAM_ID']) {
            $stmt = $conn->prepare("SELECT * FROM ram_info WHERE RAM_ID = ?");
            $stmt->bind_param("i", $build['RAM_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $mb = $result->fetch_assoc();
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ." ($" . $mb['Cost'] .")</p>";
            echo "<a href='./ram.php?id=". $_GET['id'] ."' class=''>Change RAM</a>";
        } else {
            echo "<p class='lead'>None Selected</p>";
            echo "<a href='./ram.php?id=". $_GET['id'] ."' class=''>Select RAM</a>";
        }
    ?>
    <hr>
    <h4>GPU</h4>
    <?php
        
        if($build['GPU_ID']) {
            $stmt = $conn->prepare("SELECT * FROM gpu_info WHERE GPU_ID = ?");
            $stmt->bind_param("i", $build['GPU_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $mb = $result->fetch_assoc();
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ." ($" . $mb['Cost'] .")</p>";
            echo "<a href='./gpu.php?id=". $_GET['id'] ."' class=''>Change GPU</a>";
        } else {
            echo "<p class='lead'>None Selected</p>";
            echo "<a href='./gpu.php?id=". $_GET['id'] ."' class=''>Select GPU</a>";
        }
    ?>
    <hr>
    <h4>Storage</h4>
    <?php
        
        if($build['Storage_ID']) {
            $stmt = $conn->prepare("SELECT * FROM storage_info WHERE Storage_ID = ?");
            $stmt->bind_param("i", $build['Storage_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $mb = $result->fetch_assoc();
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ." ($" . $mb['Cost'] .")</p>";
            echo "<a href='./storage.php?id=". $_GET['id'] ."' class=''>Change Storage</a>";
        } else {
            echo "<p class='lead'>None Selected</p>";
            echo "<a href='./storage.php?id=". $_GET['id'] ."' class=''>Select Storage</a>";
        }
    ?>
    <hr>
    <h4>Power Supply</h4>
    <?php
        
        if($build['PSU_ID']) {
            $stmt = $conn->prepare("SELECT * FROM psu_info WHERE PSU_ID = ?");
            $stmt->bind_param("i", $build['PSU_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $mb = $result->fetch_assoc();
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ." ($" . $mb['Cost'] .")</p>";
            echo "<a href='./psu.php?id=". $_GET['id'] ."' class=''>Change Case</a>";
        } else {
            echo "<p class='lead'>None Selected</p>";
            echo "<a href='./psu.php?id=". $_GET['id'] ."' class=''>Select Case</a>";
        }
    ?>
    <hr>
    <h4>Case</h4>
    <?php
        
        if($build['Chassis_ID']) {
            $stmt = $conn->prepare("SELECT * FROM chasis_info WHERE Chassis_ID = ?");
            $stmt->bind_param("i", $build['Chassis_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $mb = $result->fetch_assoc();
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ." ($" . $mb['Cost'] .")</p>";
            echo "<a href='./case.php?id=". $_GET['id'] ."' class=''>Change Case</a>";
        } else {
            echo "<p class='lead'>None Selected</p>";
            echo "<a href='./case.php?id=". $_GET['id'] ."' class=''>Select Case</a>";
        }
    ?>
    <hr>
</div>

<?php
    include './../footer.php';
?>