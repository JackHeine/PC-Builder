<?php
    // Include the header
    include './../header.php';
    // THIS IS A PLACE HOLDER THE USER ID IS STORED IN THE SESSION
    // THIS SHOULD BE REPLACED BY THE LOGIN MECHANISM
    session_start();

    require_once('./../dbConnect.php');

    if($_POST['motherboard_id']) {
        $stmt = $conn->prepare("UPDATE PC_Build SET Motherboard_ID = ? WHERE PC_ID = ? AND User_ID = ?");
        $stmt->bind_param("iii", $_POST['motherboard_id'], $_GET['id'], $_SESSION['user_id']);
        $stmt->execute();
        
        header("Location: ./index.php?id=" . $_GET['id']);
    }


    $stmt = $conn->prepare("SELECT * FROM PC_Build WHERE PC_ID = ? AND User_ID = ?");
    $stmt->bind_param("ii", $_GET['id'], $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $build = $result->fetch_assoc();


    $sql = "SELECT * FROM motherboard_info WHERE Socket_ID = (SELECT Socket_ID FROM cpu_info WHERE CPU_ID = (SELECT CPU_ID FROM pc_build WHERE PC_ID = " . $_GET['id'] . " AND User_ID = " . $_SESSION['user_id'] . "))";
    $results =$conn->query($sql);
?>

<div class="container">
<nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../dashboard.php">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="./index.php?id=<?php echo($build['PC_ID']); ?>"><?= $build['Nickname'] ?></a></li>
            <li class="breadcrumb-item active" aria-current="page">Choose Motherboard</li>
        </ol>
    </nav>
<?php include 'header.php' ?>
    
    <h3>Choose a Motherboard</h3>
    <form method="POST">
    <?php
        foreach($results as $r){
            
            echo "<div class='card'>";
            echo "<div class='card-body'>";
            if($r['Motherboard_ID'] == $build['Motherboard_ID']) {
                echo "<div class='form-check'><input class='form-check-input' type='radio' name='motherboard_id' id='md-". $r['Motherboard_ID']."' value='". $r['Motherboard_ID']."' checked><label class='form-check-label' for='md-". $r['Motherboard_ID']."'><h5 class='card-title'>" . $r['Manufacturer'] . ": " . $r['Model'] . "</label></div></h5>";
            
            } else {
                echo "<div class='form-check'><input class='form-check-input' type='radio' name='motherboard_id' id='md-". $r['Motherboard_ID']."' value='". $r['Motherboard_ID']."'><label class='form-check-label' for='md-". $r['Motherboard_ID']."'><h5 class='card-title'>" . $r['Manufacturer'] . ": " . $r['Model'] . "</label></div></h5>";
            }
            echo "<p class='card-text'></p>";
            echo "<p class='card-text'>Price: $" . $r['Cost'] . ", Form Factor: " . $r['Form_Name'] ."</p>";
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