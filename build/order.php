<?php
    // Include the header
    include './../header.php';
    session_start();

    require_once('./../dbConnect.php');
    $stmt = $conn->prepare("SELECT * FROM PC_Build WHERE PC_ID = ? AND User_ID = ?");
    $stmt->bind_param("ii", $_GET['id'], $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $build = $result->fetch_assoc();

    // If the build doesn't exist, redirect to the dashboard
    if(!$build) {
        header("Location: ./../dashboard.php");
    }
    // If the build is not complete, redirect to the builder
    if($build['Order_Placed'] == 0) {
        header("Location: ./index.php?id=". $_GET['id']);
    }

?>

<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../dashboard.php">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page"><?= $build['Nickname'] ?></li>
        </ol>
    </nav>
    
    
<div>
    <div class="clearfix">
        <h1 class="float-left">
            <?= $build['Nickname'] ?>
        </h1>
        <h2 class="float-right">$
            <?= $build['Price'] ?>
        </h2>
    </div>

</div>
    <?php
        if($build['Shipped'] == 0) {
            echo "<div class='alert alert-primary' role='alert'>
            Your order has been placed, this page will be updated when the order has been shipped.
            </div>";
        } else {
            echo "<div class='alert alert-primary' role='alert'>
            Your order has been shipped, you will receive your PC in the next couple of days.
            </div>";
        }
    ?>

    <hr>
    <h4>CPU</h4>
    <?php
        
        if($build['CPU_ID']) {
            $stmt = $conn->prepare("SELECT * FROM cpu_info WHERE CPU_ID = ?");
            $stmt->bind_param("i", $build['CPU_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $cpu = $result->fetch_assoc();
            echo "<p class='lead'>". $cpu['Manufacturer'] . ": " . $cpu['Model'] ." ($" . $cpu['Cost'] . ")</p>";
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
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ." - ". $mb['Size'] ."GB ($" . $mb['Cost'] .")</p>";

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
        }
    ?>
    <hr>
    <h4>Case</h4>
    <?php
        
        if($build['Chassis_ID']) {
            $stmt = $conn->prepare("SELECT * FROM chassis_info WHERE Chassis_ID = ?");
            $stmt->bind_param("i", $build['Chassis_ID']);
            $stmt->execute();
            $result = $stmt->get_result();
            $mb = $result->fetch_assoc();
            echo "<p class='lead'>". $mb['Manufacturer'] . ": " . $mb['Model'] ." ($" . $mb['Cost'] .")</p>";
        }
    ?>
    <hr>
    <br>

    <br>
</div>

<?php
    include './../footer.php';
?>