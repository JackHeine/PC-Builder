<?php
    // Include the header
    include 'header.php';
    session_start();
?>

    <div class="container">
        
        <!-- Content here -->
        <h1 class="cover-heading">Welcome to PC Builder!</h1>

        <?php if (!$_SESSION['user_id']) { ?>

        <p class="lead">Login to start building your own custom PC!</p>

        <!-- include if not signed in -->

        <p class="lead">
          <a href="login.php" class="btn btn-lg btn-secondary">Login</a>
        </p>

        <p class="lead">
          <a href="signup.php" class="btn btn-lg btn-secondary">Register</a>
        </p>

        <?php } else { ?>

        <!-- include if signed in -->


        <p class="lead">
          <a href="dashboard.php" class="btn btn-lg btn-secondary">Start Building</a>
        </p>
        <a class="btn btn-danger" href="./process/logout.php">Logout</a>

        <?php } ?>

    </div>

<?php
    // Include the footer
    include 'footer.php';
?>

    

   