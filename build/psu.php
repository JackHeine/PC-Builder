<?php
    // Include the header
    include './../header.php';
    // THIS IS A PLACE HOLDER THE USER ID IS STORED IN THE SESSION
    // THIS SHOULD BE REPLACED BY THE LOGIN MECHANISM
    session_start();

    require_once('./../dbConnect.php');

    if($_POST['psu_id']) {
        $stmt = $conn->prepare("UPDATE PC_Build SET PSU_ID = ? WHERE PC_ID = ? AND User_ID = ?");
        $stmt->bind_param("iii", $_POST['psu_id'], $_GET['id'], $_SESSION['user_id']);
        $stmt->execute();
        
        header("Location: ./index.php?id=" . $_GET['id']);
    }


    $stmt = $conn->prepare("SELECT * FROM PC_Build WHERE PC_ID = ? AND User_ID = ?");
    $stmt->bind_param("ii", $_GET['id'], $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $build = $result->fetch_assoc();

    // If the build doesn't exist, redirect to the dashboard
     if(!$build) {
        header("Location: ./../dashboard.php");
    }
    // If the build is complete, redirect to the order
    if($build['Order_Placed'] == 1) {
        header("Location: ./order.php?id=". $_GET['id']);
    }


    $sql = "SELECT * FROM psu_info";
    $results =$conn->query($sql);
?>

<div class="container">
<nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../dashboard.php">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="./index.php?id=<?php echo($build['PC_ID']); ?>"><?= $build['Nickname'] ?></a></li>
            <li class="breadcrumb-item active" aria-current="page">Choose PSU</li>
        </ol>
    </nav>
<?php include 'header.php' ?>
    
    <h3>Choose a PSU</h3>
    <form method="POST">
    <?php
        foreach($results as $psu){
            
            echo "<div class='card'>";
            echo "<div class='card-body'>";
            if($psu['PSU_ID'] == $build['PSU_ID']) {
                echo "<div class='form-check'><input class='form-check-input' type='radio' name='psu_id' id='psu-". $psu['PSU_ID']."' value='". $psu['PSU_ID']."' checked><label class='form-check-label' for='psu-". $psu['PSU_ID']."'><h5 class='card-title'>" . $psu['Manufacturer'] . ": " . $psu['Model'] . "</label></div></h5>";
            
            } else {
                echo "<div class='form-check'><input class='form-check-input' type='radio' name='psu_id' id='psu-". $psu['PSU_ID']."' value='". $psu['PSU_ID']."'><label class='form-check-label' for='psu-". $psu['PSU_ID']."'><h5 class='card-title'>" . $psu['Manufacturer'] . ": " . $psu['Model'] . "</label></div></h5>";
            }
            echo "<p class='card-text'></p>";
            echo "<p class='card-text'>Price: $" . $psu['Cost'] . ", Wattage: " . $psu['Wattage'] . "W </p>";
            echo "</div>";
            echo "</div>";
            echo "<br>";
        }
    ?>
        <input type="submit" class="btn btn-primary" value="Save">
    </form>
    <br>
</div>

<?php
    include './../footer.php';
?>