<?php
  include "koneksi.php";
  if(isset($_POST['submit'])){
    $sql = "INSERT INTO `identity` (`id`, `nama`, `tanggal`, `titik_berangkat`, `titik_tujuan`, `volume_bbm`) VALUES (NULL, '".$_POST['nama']."', '".$_POST['tanggal']."', '".$_POST['titik_berangkat']."', '".$_POST['titik_tujuan']."', '".$_POST['volume_bbm']."');";
    $result = mysqli_query($koneksi, $sql);
    
    $sql2 = "SELECT * FROM `identity` ORDER BY `identity`.`id` DESC";
    $query2 = mysqli_query($koneksi, $sql2);
    $result2 = mysqli_fetch_object($query2);
    $sql3 = "INSERT INTO `log` (`id`, `identity_id`, `flowrate`, `volume`) VALUES (NULL, '".$result2->id."', '0', '0');";
    $query3 = mysqli_query($koneksi, $sql3);
    
    header("location: dashboard.php");
  }

?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Realtime Fuel Monitoring</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="/css/sidebar.css" rel="stylesheet">
    <link href="/css/boxicons.min.css" rel="stylesheet">
  </head>
  <body>
    <div id="wrapper" class="toggled">
      <?php include 'sidebar.php';?>
      
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-12">
              <h1>Input Data</h1>
              <div class="card p-4" style="background-color:#dadada;">
                <form method="POST" action="">
                  <div class="row mb-3">
                    <div class="col-2">
                      <label for="nama" class="form-label"><b>Nama Kapal</b></label>
                    </div>
                    <div class="col">
                      <input type="text" class="form-control" id="nama" name="nama" required>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-2">
                      <label for="tanggal" class="form-label"><b>Tanggal</b></label>
                    </div>
                    <div class="col">
                      <input type="date" class="form-control" id="tanggal" name="tanggal" required>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-2">
                      <label for="titik_berangkat" class="form-label"><b>Titik Keberangkatan</b></label>
                    </div>
                    <div class="col">
                      <input type="text" class="form-control" id="titik_berangkat" name="titik_berangkat" required>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-2">
                      <label for="titik_tujuan" class="form-label"><b>Titik Tujuan</b></label>
                    </div>
                    <div class="col">
                      <input type="text" class="form-control" id="titik_tujuan" name="titik_tujuan" required>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-2">
                      <label for="volume_bbm" class="form-label"><b>Volume BBM (Liter)</b></label>
                    </div>
                    <div class="col">
                      <input type="number" class="form-control" id="volume_bbm" name="volume_bbm" required>
                    </div>
                  </div>
                  <div class="row">
                    <div class="d-flex justify-content-end">
                      <button type="submit" class="btn btn-primary ps-5 pe-5" style="font-size:25px;" name="submit">Simpan</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>

      
      </div>
    </div>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/jquery-3.7.0.min.js"></script>
    <script src="/js/jquery.dataTables.min.js"></script>
    <script src="/js/sidebar.js"></script>
  </body>
</html>