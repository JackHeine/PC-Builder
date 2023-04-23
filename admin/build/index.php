<?php
    // Include the header
    include '../../header.php';

    session_start();
    require_once('../../dbConnect.php');
?>

    <div class="container">
        <!-- Content here -->
        <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../">Admin</a></li>
            <li class="breadcrumb-item active" aria-current="page">Build Manager</li>
        </ol>
        </nav>
        <h1 class="float-left">Build Manager</h1>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create a New PC Build</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="./build/new.php" method="post" >
                <div class="modal-body">
                    
                        <div class="form-group">
                            <label for="nickname">Nickname</label>
                            <input type="text" class="form-control" id="nickname" name="nickname" required>
                        </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <input type="submit" class="btn btn-primary"></button>
                </div>
                </form>  
                </div>
            </div>
        </div>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                <th scope="col">Name</th>
                <th scope="col">User</th>
                <th scope="col">Cost</th>
                <th scope="col">Status</th>
                <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <?php

                    $sql = "SELECT * FROM PC_Build NATURAL JOIN User;";
                    $results =$conn->query($sql);

                    foreach($results as $r){
                        echo "<tr>";
                        echo "<td>" . $r['Nickname'] . "</td>";
                        echo "<td>" . $r['First_Name'] ." " .$r['Last_Name'] . " (". $r['Email']. ")</td>";
                        if($r['Price'] == Null) {
                            $stmt = $conn->prepare("SELECT Current_Build_Price(?) AS Price");
                            $stmt->bind_param("i", $r['PC_ID']);
                            $stmt->execute();
                            $result = $stmt->get_result();
                            $price = $result->fetch_assoc();
                            echo "<td>Est. $" . $price['Price'] . "</td>";
                        } else {
                            echo "<td>$" . $r['Price'] . "</td>";
                        }
                        
                        if($r['Order_Placed'] == 0) {
                            echo "<td>Build In Progress</td>";
                            echo "<td><a href='./ship.php?id=" . $r['PC_ID'] . "'>View</a></td>";
                        } else {
                            if($r['Shipped'] == 1) {
                                echo "<td>Order Shipped</td>";
                            } else {
                                echo "<td>Order Placed</td>";
                            }
                            echo "<td><a href='./ship.php?id=" . $r['PC_ID'] . "'>View</a></td>";
                        }
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