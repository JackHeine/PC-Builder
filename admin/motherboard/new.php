<?php
    // Include the header
    include '../../header.php';

    if(isset($_POST['model'])){
        require_once("../../dbConnect.php");
        $stmt = $conn->prepare("INSERT INTO motherboard (Model, Make_ID, Socket_ID, Form_ID, Cost, Stock) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("siiidi", $_POST['model'], $_POST['make'], $_POST['socket'], $_POST['form-factor'], $_POST['cost'], $_POST['stock']);
        $stmt->execute();
        header("Location: index.php");
    }
?>

    <div class="container">
        <!-- Content here -->
        <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../">Admin</a></li>
            <li class="breadcrumb-item"><a href="index.php">Motherboards</a></li>
            <li class="breadcrumb-item active" aria-current="page">New Motherboard</li>
        </ol>
        </nav>
        <h1>New Motherboard</h1>
        <form method="POST">
            <div class="form-group">
                <label for="model">Model Name</label>
                <input type="text" class="form-control" id="model" name="model" required>
            </div>
            <div class="form-group">
                <label for="make">Manufacturer</label>
                <select class="form-select" name="make" for="make" required>
                    <?php
                    require_once("../../dbConnect.php");
                    $sql = "SELECT * FROM manufacturer";
                    $results =$conn->query($sql);
                    foreach($results as $r){
                        echo "<option value='" . $r['Make_ID'] . "'>" . $r['Manufacturer'] . "</option>";
                    }
                    ?>
                </select>    
            </div>
            <div class="form-group">
                <label for="socket">Socket</label>
                <select class="form-select" name="socket" for="socket" required>
                    <?php
                    require_once("../../dbConnect.php");
                    $sql = "SELECT * FROM socket";
                    $results =$conn->query($sql);
                    foreach($results as $r){
                        echo "<option value='" . $r['Socket_ID'] . "'>" . $r['Name'] . "</option>";
                    }
                    ?>
                </select>    
            </div>
            <div class="form-group">
                <label for="form-factor">Form Factor</label>
                <select class="form-select" name="form-factor" for="form-factor" required>
                    <?php
                    require_once("../../dbConnect.php");
                    $sql = "SELECT * FROM form_factor";
                    $results =$conn->query($sql);
                    foreach($results as $r){
                        echo "<option value='" . $r['Form_ID'] . "'>" . $r['Form_Name'] . "</option>";
                    }
                    ?>
                </select>    
            </div>

            <div class="form-group">
                <label for="Cost">Cost</label>
                <input type="number" class="form-control" step="0.01" id="cost" name="cost" required>
            </div>
            <div class="form-group">
                <label for="stock">Stock</label>
                <input type="number" class="form-control" id="stock" name="stock" required>
            </div>
            <button type="submit" class="btn btn-primary mb-2">Create</button>
        </form>
        <a href="index.php" class="btn btn-secondary mb-2">Cancel</a>
    </div>

<?php
    // Include the footer
    include '../../footer.php';
?>