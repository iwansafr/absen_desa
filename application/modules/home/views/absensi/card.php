<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Tap Card</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE');?>/assets/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE');?>/assets/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE');?>/assets/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE');?>/assets/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE');?>/assets/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <script>
    _URL = "<?php echo base_url();?>";
  </script>
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">Tap</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Tap</b> Card</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../../images/icon.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Tap Card</p>
          <!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
        </div>
      </div>
      <ul class="sidebar-menu" data-widget="tree">
        
      </ul>
    </section>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Tap Card
        <small>Absensi</small>
      </h1>
    </section>

    <section class="content">
      <div class="alert alert-info">
        Silahkan Tempel Kartu Identitas Anda untuk melakukan absensi
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          Absensi
        </div>
        <div class="panel-body">
          <?php 
          $msg = $this->session->flashdata('msg');
          ?>
          <?php if(!empty($msg)):?>
            <?php $text = $msg['pesan'];?>
            <div class="alert alert-<?php echo $msg['status'];?>">
              <?php echo $msg['msg'] ?>
            </div>
            <?php $this->session->set_flashdata('msg',[]) ?>
            <button id="start" style="display: none;" class="btn btn-success mt-5 me-3">Start</button>
            <script>
  	let speech = new SpeechSynthesisUtterance();
		speech.lang = "id";
		speech.rate = 1;
		speech.volume = 1;
		speech.pitch = 1;

		let voices = [];
		window.speechSynthesis.onvoiceschanged = () => {
		  voices = window.speechSynthesis.getVoices();
		  speech.voice = voices[8];
		};
		const start = document.querySelector("#start")
		start.addEventListener("click", () => {
		  speech.text = "<?php echo $text;?>";
		  // speech.text = document.querySelector("textarea").value;
		  window.speechSynthesis.speak(speech);
		  console.log(speech)
		  // alert('test');
		});
		start.click();
  </script>
          <?php endif?>
          <form action="<?php echo base_url('home/absensi/card_action') ?>" method="post">
            <center>
                <img src="<?php echo base_url('images/camera-scan.gif');?>" class="img img-responsive" alt="">
            </center>
            <div class="form-group">
              <label for="">Tap Card <small><b><?php echo date('d-m-Y H:i');?></b></small></label>
              <input type="number" name="code" class="form-control" style="border:none;color:white;" autofocus>
            </div>
          </form>
          <h5>Data Perangkat Desa yang sudah absen</h5>
          <table class="table table-hovered">
            <thead>
              <th>NO</th>
              <th>Nama</th>
              <th>Jabatan</th>
              <th>status</th>
              <th>Waktu</th>
            </thead>
            <tbody>
              <?php if(!empty($data)):?>
                <?php $i = 1; ?>
                <?php foreach($data AS $key => $value):?>
                  <tr>
                    <td><?php echo $i++; ?></td>
                    <td><?php echo $value['nama'] ?></td>
                    <td><?php echo $value['jabatan'] ?></td>
                    <td><?php echo $status[$value['status']] ?></td>
                    <td><?php echo $value['visit_time'] ?></td>
                  </tr>
                <?php endforeach?>
              <?php endif?>
            </tbody>
          </table>
        </div>
        <div class="panel-footer">
          <a href="http://localhost/tulakanportal/" class="btn btn-default"><i class="fa fa-arrow-left"></i> Kembali ke Portal</a>
          <a href="<?php echo base_url('home/absensi/card_print');?>" class="btn btn-default" target="_blank"><i class="fa fa-print"></i> Cetak</a>
        </div>
      </div>
    </section>
  </div>
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.1.0
    </div>
    <strong>Copyright &copy; 2016-<?php echo date('Y');?> <a href="https://esoftgreat.com">esoftgreat</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    
  </aside>
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="<?php echo base_url('templates/AdminLTE');?>/assets/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<?php echo base_url('templates/AdminLTE');?>/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="<?php echo base_url('templates/AdminLTE');?>/assets/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?php echo base_url('templates/AdminLTE');?>/assets/dist/js/demo.js"></script>
<script>
  setTimeout(function(){
    document.location.href = _URL+'home/absensi/card';
  }, 5000);
</script>
</body>
</html>
