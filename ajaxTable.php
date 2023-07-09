<?php
    include "koneksi.php";
    header('Content-Type: application/json; charset=utf-8');
    $sql = "SELECT * FROM `identity` ORDER BY `identity`.`id` DESC";
    $query = mysqli_query($koneksi, $sql);
    $result = mysqli_fetch_object($query);
    $identitiy_id = $result->id;
    $sql = "SELECT flowrate, volume, timestamp FROM `log` WHERE identity_id = ".$identitiy_id." ORDER BY `id` ASC";
    if(isset($_GET['limit'])) $sql = "SELECT flowrate, volume, timestamp FROM `log` WHERE identity_id = ".$identitiy_id." ORDER BY `id` DESC LIMIT ".$_GET['limit'];
    if(isset($_GET['newer'])) $sql = "SELECT flowrate, volume, timestamp FROM `log` WHERE identity_id = ".$identitiy_id." ORDER BY `id` DESC LIMIT 1";
    $query = mysqli_query($koneksi, $sql);
    $datas;
    $index = 0;
    while($data = mysqli_fetch_object($query)){
        $dataas = null;
        $dataas[] = (String)($index+1);
        foreach($data as $key => $dataa){
            $dataas[] = $dataa;
        }
        $datas['data'][$index++] =  $dataas;
    }
    echo json_encode($datas);