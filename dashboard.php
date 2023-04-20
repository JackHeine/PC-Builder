<?php
    // Include the header
    include 'header.php';
    // THIS IS A PLACE HOLDER THE USER ID IS STORED IN THE SESSION
    // THIS SHOULD BE REPLACED BY THE LOGIN MECHANISM
    session_start();
    $_SESSION['user_id'] = 1;
    require_once('./dbConnect.php');
?>

    <div class="container">
        <!-- Content here -->
        <h1 class="float-left">Dashboard</h1>
        <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#exampleModal">
        Create a New Build
        </button>
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
                <th scope="col">Cost</th>
                <th scope="col">Ordered</th>
                <th scope="col">Shipped</th>
                <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <?php

                    $sql = "SELECT * FROM PC_Build WHERE User_ID = " . $_SESSION['user_id'] . ";";
                    $results =$conn->query($sql);

                    foreach($results as $r){
                        echo "<tr>";
                        echo "<td>" . $r['Nickname'] . "</td>";
                        echo "<td>" . $r['Cost'] . "</td>";
                        echo "<td>" . $r['Order_Placed'] . "</td>";
                        echo "<td>" . $r['Shipped'] . "</td>";
                        echo "<td><a href='./build/index.php?id=" . $r['PC_ID'] . "'>View</a></td>";
                        echo "</tr>";
                    }


                ?>
            </tbody>
        </table>
    </div>

    

<?php
    // Include the footer
    include 'footer.php';
?>