<?php
    include "koneksi.php";
    $flowrate = null;$volume = null; $kecepatan = null;
    if(isset($_GET['flowrate'])) $flowrate = $_GET['flowrate'];
    if(isset($_GET['volume'])) $volume = $_GET['volume'];

    if(isset($_POST['flowrate'])) $flowrate = $_POST['flowrate'];
    if(isset($_POST['volume'])) $volume = $_POST['volume'];

    if(isset($flowrate) && isset($volume)){
        $sql = "SELECT * FROM `identity` ORDER BY `identity`.`id` DESC";
        $query = mysqli_query($koneksi, $sql);
        $result = mysqli_fetch_object($query);
        $sql2 = "INSERT INTO `log` (`id`, `identity_id`, `flowrate`, `volume`) VALUES (NULL, '".$result->id."', '".$flowrate."', '".$volume."');";
        $query2 = mysqli_query($koneksi, $sql2);
        var_dump($query2);die;
    }
