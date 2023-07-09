<?php

include 'koneksi.php';
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
function distance($coordinates1, $coordinates2){
  $latitudeFrom = explode(", ", $coordinates1)[0];
  $longitudeFrom = explode(", ", $coordinates1)[1];
  $latitudeTo = explode(", ", $coordinates2)[0];
  $longitudeTo = explode(", ", $coordinates2)[1];
  $earthRadius = 6371000;
  // convert from degrees to radians
  $latFrom = deg2rad($latitudeFrom);
  $lonFrom = deg2rad($longitudeFrom);
  $latTo = deg2rad($latitudeTo);
  $lonTo = deg2rad($longitudeTo);

  $latDelta = $latTo - $latFrom;
  $lonDelta = $lonTo - $lonFrom;

  $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) + cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
  return number_format((float)($angle * $earthRadius / 1000), 2, '.', '');
}

if(isset($_GET['id'])){
  $sql = "SELECT * FROM identity WHERE id = ".$_GET['id'];
  $result = mysqli_query($koneksi, $sql);
  $data = mysqli_fetch_object($result);
  $filename = $data->nama."_".date('d M Y',strtotime($data->tanggal)).".xlsx";
  $spreadsheet = new Spreadsheet();
  $activeWorksheet = $spreadsheet->getActiveSheet();
  
  $activeWorksheet->setCellValue('A1', 'Nama Kapal');
  $activeWorksheet->setCellValue('A2', 'Tanggal');
  $activeWorksheet->setCellValue('A3', 'Titik Berangkat');
  $activeWorksheet->setCellValue('A4', 'Titik Tujuan');
  $activeWorksheet->setCellValue('A5', 'Jarak (Km)');
  $activeWorksheet->setCellValue('A6', 'Volume BBM (L)');

  $activeWorksheet->setCellValue('B1', $data->nama);
  $activeWorksheet->setCellValue('B2', date('d M Y',strtotime($data->tanggal)));
  $activeWorksheet->setCellValue('B3', $data->titik_berangkat);
  $activeWorksheet->setCellValue('B4', $data->titik_tujuan);
  $activeWorksheet->setCellValue('B5', distance($data->titik_berangkat, $data->titik_tujuan));
  $activeWorksheet->setCellValue('B6', $data->volume_bbm);

  $activeWorksheet->setCellValue('D1', 'Timestamp');
  $activeWorksheet->setCellValue('E1', 'Flowrate (L/m)');
  $activeWorksheet->setCellValue('F1', 'Volume (mL)');

  for ($i = 'A'; $i <  $spreadsheet->getActiveSheet()->getHighestColumn(); $i++) {
    $spreadsheet->getActiveSheet()->getColumnDimension($i)->setAutoSize(TRUE);
  }
  
  $sql = "SELECT * FROM log WHERE identity_id = ".$_GET['id'];
  $result = mysqli_query($koneksi, $sql);
  $index = 1;
  while($data = mysqli_fetch_object($result)){
    $activeWorksheet->setCellValue('D'.(1+$index), date('h:i:s d M Y',strtotime($data->timestamp)));
    $activeWorksheet->setCellValue('E'.(1+$index), $data->flowrate);
    $activeWorksheet->setCellValue('F'.(1+$index), $data->volume);
    $index++;
  }
  $writer = new Xlsx($spreadsheet);
  $writer->save($filename);
  header($_SERVER["SERVER_PROTOCOL"] . " 200 OK");
  header("Cache-Control: public"); // needed for internet explorer
  header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
  header("Content-Transfer-Encoding: Binary");
  header("Content-Length:".filesize($filename));
  header("Content-Disposition: attachment; filename=".$filename);
  readfile($filename);
  if (file_exists($filename)) {
      unlink($filename);
  }
  echo "<script>window.location = 'history.php'</script>";
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
              <h1>History</h1>
              
              <div class="card p-4 mb-4">
                <div class="row">
                  <table id="myTable" class="display">
                      <thead>
                          <tr>
                              <th>No</th>
                              <th>Nama Kapal</th>
                              <th>Tanggal</th>
                              <th>Titik Berangkat</th>
                              <th>Titik Tujuan</th>
                              <th>Jarak (Km)</th>
                              <th>Volume BBM (L)</th>
                              <th>Jumlah History</th>
                              <th>Aksi</th>
                          </tr>
                      </thead>
                      <tbody>
                        <?php
                        $sql = "SELECT * from identity";
                        $result = mysqli_query($koneksi, $sql);
                        $index = 1;
                        while($data = mysqli_fetch_object($result)){
                          $sql2 = "SELECT COUNT(id) as count from log WHERE identity_id = ".$data->id;
                          $result2 = mysqli_query($koneksi, $sql2);
                          $count = mysqli_fetch_object($result2)->count;
                        ?>
                        <tr>
                          <td><?=$index++?></td>
                          <td><?=$data->nama?></td>
                          <td><?=date('d M Y',strtotime($data->tanggal))?></td>
                          <td><?=$data->titik_berangkat?></td>
                          <td><?=$data->titik_tujuan?></td>
                          <td><?=distance($data->titik_berangkat, $data->titik_tujuan)?></td>
                          <td><?=$data->volume_bbm?></td>
                          <td><?=$count?></td>
                          <td>
                            <a class="btn btn-primary" href="/history.php?id=<?=$data->id?>">
                              Export Excel
                            </a>
                          </td>
                        </tr>
                        <?php
                        }
                        ?>
                      </tbody>
                  </table>
                </div>
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
    
    <script type="text/javascript">
      $(document).ready( function () {
        var table = $('#myTable').DataTable({
          scrollX: true,
          // ajax: '/ajaxTable.php',
        });
      });
    </script>
  </body>
</html>