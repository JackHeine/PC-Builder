<?php
    // Include the header
    include '../../header.php';
    require_once("../../dbConnect.php");

    if(isset($_POST['delete'])) {
        $stmt = $conn->prepare("DELETE FROM graphics_card WHERE GPU_ID = ?");
        $stmt->bind_param("i", $_GET['id']);
        $stmt->execute();
        header("Location: index.php");
    }

    if(isset($_POST['model'])){
        
        $stmt = $conn->prepare("UPDATE graphics_card SET Model = ?, Make_ID = ?, Memory = ?, Power_Usage = ?, Cost = ?, Stock = ? WHERE GPU_ID = " . $_GET['id']);
        $stmt->bind_param("siiidi", $_POST['model'], $_POST['make'], $_POST['memory'], $_POST['power'], $_POST['cost'], $_POST['stock']);
        $stmt->execute();
        header("Location: index.php");
    }
    if(isset($_GET['id'])){
        $stmt = $conn->prepare("SELECT * FROM graphics_card WHERE GPU_ID =  ?");
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
            <li class="breadcrumb-item"><a href="index.php">RAM</a></li>
            <li class="breadcrumb-item active" aria-current="page"><?= $res["Model"] ?></li>
        </ol>
        </nav>
        <h1>Update GPU</h1>
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
                    $sql = "SELECT * FROM manufacturer";
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
                <label for="memory">Memory</label>
                <input type="number" class="form-control" id="memory" name="memory" value="<?= $res["Memory"] ?>" required>
            </div>
            <div class="form-group">
                <label for="power">Power Usage</label>
                <input type="number" class="form-control" id="power" name="power" value="<?= $res["Power_Usage"] ?>" required>
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