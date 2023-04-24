<?php
    include 'admin_verify.php'; // blocks unaothirzed access

    // Include the header
    include '../header.php';
?>

    <div class="container">
        <!-- Content here -->
        <h1>Admin</h1>
        <h2>Component Manager</h2>
        <ul>
            <li><a href="./cpu/index.php">CPUs</a></li>
            <li><a href="./gpu/index.php">GPUs</a></li>
            <li><a href="./motherboard/index.php">Motherboards</a></li>
            <li><a href="./ram/index.php">RAM</a></li>
            <li><a href="./psu/index.php">Power Supply (PSU)</a></li>
            <li><a href="./storage/index.php">Storage</a></li>
            <li><a href="./case/index.php">Case</a></li>
        </ul>
        <h2>Build Manager</h2>
        <ul>
            <li><a href="./build/index.php">All Builds</a></li>
        </ul>
        
    </div>

<?php
    // Include the footer
    include '../footer.php';
?>