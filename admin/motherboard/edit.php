<?php
    include '../admin_verify.php'; // blocks unaothirzed access

    // Include the header
    include '../../header.php';
    require_once("../../dbConnect.php");

    if(isset($_POST['delete'])){
        $stmt = $conn->prepare("DELETE FROM Motherboard WHERE Motherboard_ID = ?");
        $stmt->bind_param("i", $_GET['id']);
        $stmt->execute();
        header("Location: index.php");
    }

    if(isset($_POST['model'])){
        $stmt = $conn->prepare("UPDATE Motherboard SET Model = ?, Make_ID = ?, Socket_ID = ?, Form_ID = ?, Cost = ?, Stock = ? WHERE Motherboard_ID = ?");
        $stmt->bind_param("siiidii", $_POST['model'], $_POST['make'], $_POST['socket'], $_POST['form-factor'], $_POST['cost'], $_POST['stock'], $_GET['id']);
        $stmt->execute();
        header("Location: index.php");
    }
    
    if(isset($_GET['id'])){
        $stmt = $conn->prepare("SELECT * FROM Motherboard WHERE Motherboard_ID = ?");
        $stmt->bind_param("i", $_GET['id']);
        $stmt->execute();
        $results = $stmt->get_result();
        $res = $results->fetch_assoc();
    
?>

    <div class="container">
        <!-- Content here -->
        <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../">Admin</a></li>
            <li class="breadcrumb-item"><a href="index.php">Motherboards</a></li>
            <li class="breadcrumb-item active" aria-current="page"><?= $res["Model"] ?></li>
        </ol>
        </nav>
        <h1>Update Motherboard</h1>
        <form method="POST">
            <div class="form-group">
                <label for="model">Model Name</label>
                <input type="text" class="form-control" id="model" name="model" value="<?= $res["Model"] ?>" required>
            </div>
            <div class="form-group">
                <label for="make">Manufacturer</label>
                <select class="form-select" name="make" for="make" required>
                    <?php
                    require_once("../../dbConnect.php");
                    $sql = "SELECT * FROM Manufacturer";
                    $results =$conn->query($sql);
                    foreach($results as $r){
                        echo "<option value='" . $r['Make_ID'] . "'";
                        if($r['Make_ID'] == $res['Make_ID']){
                            echo " selected";
                        }
                        echo ">" . $r['Manufacturer'] . "</option>";
                    }
                    ?>
                </select>    
            </div>
            <div class="form-group">
                <label for="socket">Socket</label>
                <select class="form-select" name="socket" for="socket" required>
                    <?php
                    require_once("../../dbConnect.php");
                    $sql = "SELECT * FROM Socket";
                    $results =$conn->query($sql);
                    foreach($results as $r){
                        echo "<option value='" . $r['Socket_ID']. "'";
                        if($r['Socket_ID'] == $res['Socket_ID']){
                            echo " selected";
                        }
                        echo ">" . $r['Name'] . "</option>";
                    }
                    ?>
                </select>    
            </div>
            <div class="form-group">
                <label for="form-factor">Form Factor</label>
                <select class="form-select" name="form-factor" for="form-factor" required>
                    <?php
                    require_once("../../dbConnect.php");
                    $sql = "SELECT * FROM Form_Factor";
                    $results =$conn->query($sql);
                    foreach($results as $r){
                        echo "<option value='" . $r['Form_ID'] . "'";
                        if($r['Form_ID'] == $res['Form_ID']){
                            echo " selected";
                        }
                        echo ">" . $r['Form_Name'] . "</option>";
                    }
                    ?>
                </select>    
            </div>
            <div class="form-group">
                <label for="Cost">Cost</label>
                <input type="number" class="form-control" step="0.01" id="cost" name="cost" value="<?= $res["Cost"] ?>" required>
            </div>
            <div class="form-group">
                <label for="stock">Stock</label>
                <input type="number" class="form-control" id="stock" name="stock" value="<?= $res["Stock"] ?>" required>
            </div>
            <button type="submit" class="btn btn-primary mb-2">Update</button>
            <button type="delete" class="btn btn-danger mb-2" name="delete">Delete</button>
        </form>
        <a href="index.php" class="btn btn-secondary mb-2">Cancel</a>
    </div>

<?php
    }
    // Include the footer
    include '../../footer.php';
?>