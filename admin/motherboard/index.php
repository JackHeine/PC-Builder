<?php
    include '../admin_verify.php'; // blocks unaothirzed access

    // Include the header
    include '../../header.php';
?>

    <div class="container">
        <!-- Content here -->
        <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../">Admin</a></li>
            <li class="breadcrumb-item active" aria-current="page">Motherboards</li>
        </ol>
        </nav>
        <h1 class="float-left">Motherboards</h1>
        <a class="float-right  btn btn-primary" href="./new.php">Add Motherboard</a>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                <th scope="col">Make</th>
                <th scope="col">Model</th>
                <th scope="col">Form Factor</th>
                <th scope="col">Price</th>
                <th scope="col">Stock</th>
                <th></th>
                </tr>
            </thead>
            <tbody>
                <?php
                    // Include the database connection
                    require_once("../../dbConnect.php");
                    // Check connection
                    if (!$conn) {
                        die("Connection failed: " . mysqli_connect_error());
                    }
                    $sql = "SELECT * FROM motherboard_info";
                    $results =$conn->query($sql);

                    foreach($results as $r){
                        echo "<tr>";
                        echo "<td>" . $r['Manufacturer'] . "</td>";
                        echo "<td>" . $r['Model'] . "</td>";
                        echo "<td>" . $r['Form_Name'] . "</td>";
                        echo "<td>$" . $r['Cost'] . "</td>";
                        echo "<td>" . $r['Stock'] . "</td>";
                        echo "<td><a href='./edit.php?id=" . $r['Motherboard_ID'] . "'>Edit</a></td>";
                        echo "</tr>";
                    }


                ?>
            </tbody>
        </table>
    </div>

<?php
    // Include the footer
    include '../../footer.php';
?>