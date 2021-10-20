<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Absensi</title>
  <script>
    _URL = "<?php echo base_url(); ?>";
  </script>
  <script defer src="<?php echo base_url('assets/js/face-api.min.js'); ?>"></script>
  <script defer src=" <?php echo base_url('assets/js/script.js?v='.time()); ?>"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <style>
    body {
      margin: 0;
      padding: 0;
      width: 100vw;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      /*background: url(<?php echo base_url('assets/background/background.jpg');?>);
      background-repeat: no-repeat;
      background-size: cover;*/
    }

    canvas {
      position: absolute;
    }
  </style>
</head>

<body>
  <video id="videoInput" width="720" height="550" autoplay="false"></video>
  <div id="txt"></div>
  <div id="status"></div>

</body>
</html>