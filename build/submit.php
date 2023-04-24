<?php

if($_POST['pc-id']){
    require_once('./../dbConnect.php');
    session_start();

    $stmt = $conn->prepare("SELECT
          cpu.Stock as 'Cpu-stock'
        , graphics_card.Stock as 'GPU-stock'
        , motherboard.Stock as 'Mobo-stock'
        , power_supply.Stock as 'PSU-stock'
        , ram.Stock as 'Ram-stock'
        , storage.Stock 'Store-stock'
    FROM pc_build
    INNER JOIN cpu
    ON pc_build.CPU_ID=cpu.CPU_ID
    INNER JOIN graphics_card
    ON pc_build.GPU_ID=graphics_card.GPU_ID
    INNER JOIN motherboard
    ON pc_build.Motherboard_ID=motherboard.Motherboard_ID
    INNER JOIN power_supply
    ON pc_build.PSU_ID=power_supply.PSU_ID
    INNER JOIN ram
    ON pc_build.RAM_ID=ram.RAM_ID
    INNER JOIN storage
    ON pc_build.Storage_ID=storage.Storage_ID
    WHERE PC_ID=?");
    $stmt->bind_param("i", $_POST['pc-id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $stocklist = $result->fetch_assoc();
        
    $stmt = $conn->prepare("SELECT motherboard.Form_ID  as 'MB-form', chassis.Form_ID as 'C-form'
                            FROM pc_build
                            INNER JOIN motherboard
                            ON pc_build.Motherboard_ID=motherboard.Motherboard_ID
                            INNER JOIN chassis
                            ON pc_build.Chassis_ID=chassis.Chassis_ID
                            WHERE pc_build.PC_ID=?");
    $stmt->bind_param("i", $_POST['pc-id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $formcheck = $result->fetch_assoc();
    
    $stmt = $conn->prepare("SELECT motherboard.Socket_ID as 'Mobo-scoket', cpu.Socket_ID as 'Cpu-socket'
                            FROM pc_build
                            INNER JOIN motherboard
                            ON pc_build.Motherboard_ID=motherboard.Motherboard_ID
                            INNER JOIN cpu
                            ON pc_build.CPU_ID=cpu.CPU_ID
                            WHERE pc_build.PC_ID=?");
    $stmt->bind_param("i", $_POST['pc-id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $socketcheck = $result->fetch_assoc();

    $error = '';
    if(array_search('0', $stocklist) != '0')
        $error .= 'Error: One or more parts are out of stock \n';
    if($formcheck['MB-form'] != $formcheck['C-form']) 
        $error .= 'Error: Motherboard and Case form do not match \n';
    if($socketcheck['Mobo-scoket'] != $socketcheck['Cpu-socket']) 
        $error .= 'Error: Motherboard and CPU socket do not match';

    if(!empty($error)){
        $redirect = "index.php?id="; 
        $redirect .= $_POST['pc-id'];
        echo '<script type="text/javascript">';
        echo 'alert("' . $error . '");';
        echo 'window.location.href = "' . $redirect . '";';
        echo '</script>';

    } else {
        $stmt = $conn->prepare("SELECT Current_Build_Price(?) AS Price");
        $stmt->bind_param("i", $_POST['pc-id']);
        $stmt->execute();
        $result = $stmt->get_result();
        $price = $result->fetch_assoc();

        $stmt = $conn->prepare("UPDATE PC_Build SET Order_Placed=TRUE, Price=? WHERE User_ID = ? AND PC_ID = ?");
        $stmt->bind_param("dii", $price['Price'], $_SESSION['user_id'], $_POST['pc-id']);
        $stmt->execute();
    
        header("Location: ./order.php?id=" . $_POST['pc-id'] . "");
    }
}
?>
