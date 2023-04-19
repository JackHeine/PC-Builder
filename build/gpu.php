<?php
    // Include the header
    include './../header.php';
    // THIS IS A PLACE HOLDER THE USER ID IS STORED IN THE SESSION
    // THIS SHOULD BE REPLACED BY THE LOGIN MECHANISM
    session_start();

    require_once('./../dbConnect.php');

    if($_POST['gpu_id']) {
        $stmt = $conn->prepare("UPDATE pc_build SET GPU_ID = ? WHERE PC_ID = ? AND User_ID = ?");
        $stmt->bind_param("iii", $_POST['gpu_id'], $_GET['id'], $_SESSION['user_id']);
        $stmt->execute();
        
        header("Location: ./index.php?id=" . $_GET['id']);
    }


    $stmt = $conn->prepare("SELECT * FROM pc_build WHERE PC_ID = ? AND User_ID = ?");
    $stmt->bind_param("ii", $_GET['id'], $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $build = $result->fetch_assoc();


    $sql = "SELECT * FROM gpu_info";
    $results =$conn->query($sql);
?>

<div class="container">
<nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../dashboard.php">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="./index.php?id=<?php echo($build['PC_ID']); ?>"><?= $build['Nickname'] ?></a></li>
            <li class="breadcrumb-item active" aria-current="page">Choose GPU</li>
        </ol>
    </nav>
<?php include 'header.php' ?>
    
    <h3>Choose a GPU</h3>
    <form method="POST">
    <?php
        foreach($results as $gpu){
            
            echo "<div class='card'>";
            echo "<div class='card-body'>";
            if($gpu['GPU_ID'] == $build['GPU_ID']) {
                echo "<div class='form-check'><input class='form-check-input' type='radio' name='gpu_id' id='gpu-". $gpu['GPU_ID']."' value='". $gpu['GPU_ID']."' checked><label class='form-check-label' for='gpu-". $gpu['GPU_ID']."'><h5 class='card-title'>" . $gpu['Manufacturer'] . ": " . $gpu['Model'] . "</label></div></h5>";
            
            } else {
                echo "<div class='form-check'><input class='form-check-input' type='radio' name='gpu_id' id='gpu-". $gpu['GPU_ID']."' value='". $gpu['GPU_ID']."'><label class='form-check-label' for='gpu-". $gpu['GPU_ID']."'><h5 class='card-title'>" . $gpu['Manufacturer'] . ": " . $gpu['Model'] . "</label></div></h5>";
            }
            echo "<p class='card-text'></p>";
            echo "<p class='card-text'>Price: $" . $gpu['Cost'] . ", Memory: " . $gpu['Memory'] . "GB, Power Usage: " . $gpu['Power_Usage'] . "W </p>";
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