<?php
    // Include the header
    include './../header.php';

    session_start();

    require_once('./../dbConnect.php');

    if($_POST['cpu_id']) {
        $stmt = $conn->prepare("UPDATE PC_Build SET CPU_ID = ? WHERE PC_ID = ? AND User_ID = ?");
        $stmt->bind_param("iii", $_POST['cpu_id'], $_GET['id'], $_SESSION['user_id']);
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


    $sql = "SELECT * FROM cpu_info";
    $results =$conn->query($sql);
?>

<div class="container">
<nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../dashboard.php">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="./index.php?id=<?php echo($build['PC_ID']); ?>"><?= $build['Nickname'] ?></a></li>
            <li class="breadcrumb-item active" aria-current="page">Choose CPU</li>
        </ol>
    </nav>
<?php include 'header.php' ?>
    
    <h3>Choose a CPU</h3>
    <form method="POST">
    <?php
        foreach($results as $cpu){
            
            echo "<div class='card'>";
            echo "<div class='card-body'>";
            if($cpu['CPU_ID'] == $build['CPU_ID']) {
                if($cpu['Stock'] != '0')
                    echo "<div class='form-check'><input class='form-check-input' type='radio' name='cpu_id' id='cpu-". $cpu['CPU_ID']."' value='". $cpu['CPU_ID']."' checked><label class='form-check-label' for='cpu-". $cpu['CPU_ID']."'><h5 class='card-title'>" . $cpu['Manufacturer'] . ": " . $cpu['Model'] . "</label></div></h5>";
                else
                    echo "<div class='form-check'><input class='form-check-input' type='radio' name='cpu_id' id='cpu-". $cpu['CPU_ID']."' value='". $cpu['CPU_ID']."' disabled checked><label class='form-check-label' for='cpu-". $cpu['CPU_ID']."'><h5 class='card-title'>" . $cpu['Manufacturer'] . ": " . $cpu['Model'] . " - Out of Stock</label></div></h5>";

            } else {
                if($cpu['Stock'] != '0')
                    echo "<div class='form-check'><input class='form-check-input' type='radio' name='cpu_id' id='cpu-". $cpu['CPU_ID']."' value='". $cpu['CPU_ID']."'><label class='form-check-label' for='cpu-". $cpu['CPU_ID']."'><h5 class='card-title'>" . $cpu['Manufacturer'] . ": " . $cpu['Model'] . "</label></div></h5>";
                else 
                    echo "<div class='form-check'><input class='form-check-input' type='radio' name='cpu_id' id='cpu-". $cpu['CPU_ID']."' value='". $cpu['CPU_ID']."' disabled><label class='form-check-label' for='cpu-". $cpu['CPU_ID']."'><h5 class='card-title'>" . $cpu['Manufacturer'] . ": " . $cpu['Model'] . " - Out of Stock</label></div></h5>";
                   
            }
            echo "<p class='card-text'></p>";
            echo "<p class='card-text'>Price: $" . $cpu['Cost'] . ", Power Usage: " . $cpu['Power_Usage'] . "W </p>";
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