<?php 
  include "koneksi.php";
  $sql = "SELECT * FROM `identity` ORDER BY `identity`.`id` DESC";
  $query = mysqli_query($koneksi, $sql);
  $result = mysqli_fetch_object($query);
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
    <link href="/css/progressbar.css" rel="stylesheet">
    

    <script type="text/javascript">
      
      // $.getJSON("/ajaxTable.php", function(data) {  
      //     alert(data['data'].length == null || data['data'].length <= 1);
      // });
      var valFlowRate = 0, valVolume = 0, valSpeedMotor = 0;
      window.onload = function() {
        // $.getJSON("/ajaxTable.php", function(data) {  
        //   alert(strlen(data));
        //   if(data['data'].length == null || data['data'].length <= 1){
        //     alert("null");
        //     sleep(3);
        //     alert("null");
        //     header("Location: /dashboard.php");
        //   }
        // });
        var maxVolume = <?= $result->volume_bbm ?>;
        var dataPoints = [];
        var dataPoints2 = [];
        var chart,chart2;
        $.getJSON("/ajaxTable.php", function(data) {  
          $.each(data['data'], function(key, value){
            dataPoints.push({x: new Date(value[3]), y: parseFloat(value[1])});
            dataPoints2.push({x: new Date(value[3]), y: parseFloat(value[2])});
            bar.animate(parseFloat((value[1])/1600)/1000);
            bar2.animate(parseFloat((value[2])/maxVolume)/1000);
            $('#valFlowrate').html(value[1]+' L');
            $('#valVolume').html(value[2]+' mL');
            $('#valRemaining').html((maxVolume-(value[2]/1000))+" L");
          });
          chart = new CanvasJS.Chart("chartContainer",{
            title:{
              text:"Flowrate"
            },
            axisY: {
              title: "Flowrate (L/m)",
              suffix: " L/m"
            },
            data: [{
              type: "line",
              dataPoints : dataPoints,
            }]
          });
          chart2 = new CanvasJS.Chart("chartContainer2",{
            title:{
              text:"Volume"
            },
            axisY: {
              title: "Volume (mL)",
              suffix: " mL"
            },
            data: [{
              type: "line",
              dataPoints : dataPoints2,
            }]
          });
          chart.render();
          chart2.render();
          updateChart();
        });
        function updateChart() {
        $.getJSON("/ajaxTable.php?newer", function(data) {
          $.each(data['data'], function(key, value) {
            dataPoints.push({
            x: new Date(value[3]),
            y: parseFloat(value[1])
            });
            dataPoints2.push({
            x: new Date(value[3]),
            y: parseFloat(value[2])
            });
            bar.animate(parseFloat((value[1])/1600)/1000);
            bar2.animate(parseFloat((value[2])/maxVolume)/1000);
            
            valFlowRate = parseFloat(value[1]);
            valVolume = parseFloat(value[2]);

            $('#valFlowrate').html(value[1]+' L/m');
            $('#valVolume').html(value[2]+' mL');
            $('#valRemaining').html((maxVolume-(value[2]/1000))+" L");
          });
          chart.render();
          chart2.render();
          setTimeout(function(){updateChart()}, 1000);
        });
        }
      }
    </script>
    <style>
      .card{
        height:auto;
      }
      @media only screen and (max-width: 1200px) {
        .card{
          height:800px;
        }
      }
    </style>
  </head>
  <body>
    <div id="wrapper" class="toggled">
      <?php include 'sidebar.php';?>
      
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-12">
              <h1>Dashboard</h1>
              <div class="card p-4 mb-4">
                <div class="row">

                  <div class="col-xl-2 d-flex justify-content-center mb-4">
                    <div class="row">
                      <div class="col-12 d-flex justify-content-center">
                        <div class="alert alert-primary p-0 ps-4 pe-4 m-0" role="alert" style="height:25px;border-radius:15px;">
                          Flowrate
                        </div>
                      </div>
                      <div class="col d-flex justify-content-center" id="valFlowrate" style="font-size:30px;">
                        0,00 L/m
                      </div>
                    </div>
                  </div>

                  <div class="col-xl-3 mb-4">
                      <div class="row d-flex justify-content-center">
                          Flowrate
                      </div>
                      <div id="myBar"></div>
                      <div class="row me-2">
                        <div class="col d-flex justify-content-end me-4">
                          0
                        </div>
                        <div class="col-auto d-flex justify-content-center">
                          L/m
                        </div>
                        <div class="col d-flex justify-content-start ms-4">
                          1600L
                        </div>
                      </div>
                  </div>

                  <div class="col-xl-7 d-flex justify-content-center pe-5 mb-4">
                    <div id="chartContainer" style="height: 100%; width: 80%;"></div>
                  </div>
                </div>
              </div>
              
              <div class="card p-4 mb-4">
                <div class="row">

                  <div class="col-xl-2 d-flex justify-content-center">
                    <div class="row">
                      <div class="col-12 d-flex justify-content-center">
                        <div class="alert alert-primary p-0 ps-4 pe-4 m-0" role="alert" style="height:25px;border-radius:15px;">
                          Volume
                        </div>
                      </div>
                      <div class="col d-flex justify-content-center" id="valVolume" style="font-size:30px;">
                        0,00 mL
                      </div>
                    </div>
                  </div>

                  <div class="col-xl-3">
                      <div class="row d-flex justify-content-center">
                          Volume
                      </div>
                      <div id="myBar2"></div>
                      <div class="row me-2">
                        <div class="col d-flex justify-content-end me-4">
                          0
                        </div>
                        <div class="col-auto d-flex justify-content-center">
                          mL
                        </div>
                        <div class="col d-flex justify-content-start ms-4">
                          <?= $result->volume_bbm ?>L
                        </div>
                      </div>
                  </div>

                  <div class="col-xl-7 d-flex justify-content-center pe-5">
                    <div id="chartContainer2" style="height: 100%; width: 80%;"></div>
                  </div>
                </div>
              </div>

              <div class="card p-4 mb-4">
                <div class="row">

                  <div class="col-xl-2 d-flex justify-content-center">
                    <div class="row">
                      <div class="col-12 d-flex justify-content-center">
                        <div class="alert alert-primary p-0 m-0 w-100 d-flex justify-content-center" id="valVolume" role="alert" style="height:25px;border-radius:15px;">
                          Fuel Remaining
                        </div>
                      </div>
                      <div class="col d-flex justify-content-center" id="valRemaining" style="font-size:30px;">
                        0,00 L
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="card p-4 mb-4">
                <div class="row">
                  <table id="myTable" class="display">
                      <thead>
                          <tr>
                              <th>No</th>
                              <th>Flowrate</th>
                              <th>Debit</th>
                              <th>Time</th>
                          </tr>
                      </thead>
                      <tbody>
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
    <script src="/js/progressbar.js"></script>
    <script src="/js/jquery.canvasjs.min"></script>

    <script type="text/javascript">
      $(document).ready( function () {
        var table = $('#myTable').DataTable({
          ajax: '/ajaxTable.php',
        });
        
        setInterval(function() {
          table.ajax.url('/ajaxTable.php').load();
        }, 1000);  
      } );

      // function progressbar(var string){

      // }

      let bar = new ProgressBar.SemiCircle("#myBar", {
        strokeWidth: 12,
        color: "black",
        trailColor: "rgba(150,150,150, 0.4)",
        trailWidth: 12,
        easing: "easeInOut",
        duration: 1400,
        svgStyle: null,
        text: {
          value: "",
          alignToBottom: false,
          className: "progressbar__label"
        },

        // Set default step function for all animate calls
        step: (state, bar) => {
          bar.path.setAttribute("stroke", state.color);
          var value = Math.round(bar.value() * 100);
          bar.setText(valFlowRate);

          bar.text.style.color = state.color;
        }
      });
      
      let bar2 = new ProgressBar.SemiCircle("#myBar2", {
        strokeWidth: 12,
        color: "black",
        trailColor: "rgba(150,150,150, 0.4)",
        trailWidth: 12,
        easing: "easeInOut",
        duration: 1400,
        svgStyle: null,
        text: {
          value: "",
          alignToBottom: false,
          className: "progressbar__label"
        },

        // Set default step function for all animate calls
        step: (state, bar) => {
          bar.path.setAttribute("stroke", state.color);
          var value = Math.round(bar.value() * 100);
          bar.setText(valVolume);

          bar.text.style.color = state.color;
        }
      });
      let bar3 = new ProgressBar.SemiCircle("#myBar3", {
        strokeWidth: 12,
        color: "black",
        trailColor: "rgba(150,150,150, 0.4)",
        trailWidth: 12,
        easing: "easeInOut",
        duration: 1400,
        svgStyle: null,
        text: {
          value: "",
          alignToBottom: false,
          className: "progressbar__label"
        },

        // Set default step function for all animate calls
        step: (state, bar) => {
          bar.path.setAttribute("stroke", state.color);
          var value = Math.round(bar.value() * 100);
          bar.setText(valSpeedMotor);

          bar.text.style.color = state.color;
        }
      });
      
      // let bar2 = 
    </script>
  </body>
</html>