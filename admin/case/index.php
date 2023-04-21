<?php
    // Include the header
    include '../../header.php';
?>

    <div class="container">
        <!-- Content here -->
        <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../">Admin</a></li>
            <li class="breadcrumb-item active" aria-current="page">Case</li>
        </ol>
        </nav>
        <h1 class="float-left">Cases</h1>
        <a class="float-right  btn btn-primary" href="./new.php">Add Case</a>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                <th scope="col">Make</th>
                <th scope="col">Model</th>
                <th scope="col">Form</th>
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
                    $sql = "SELECT * FROM chasis_info";
                    $results =$conn->query($sql);

                    foreach($results as $r){
                        echo "<tr>";
                        echo "<td>" . $r['Manufacturer'] . "</td>";
                        echo "<td>" . $r['Model'] . "</td>";
                        echo "<td>" . $r['Form_ID'] . "</td>";
                        echo "<td>$" . $r['Cost'] . "</td>";
                        echo "<td>" . $r['Stock'] . "</td>";
                        echo "<td><a href='./edit.php?id=" . $r['Chassis_ID'] . "'>Edit</a></td>";
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