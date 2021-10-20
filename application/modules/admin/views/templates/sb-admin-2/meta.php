<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title><?php echo $meta['title'] ?></title>
<meta name="description" content="<?php echo $meta['description'] ?>">
<meta name="keywords" content="<?php echo $meta['keyword'] ?>">
<meta name="developer" content="esoftgreat.com">
<meta name="author" content="esoftgreat">
<meta name="ROBOTS" content="all, index, follow">
<link rel="shortcut icon" type="image/x-icon" href="<?php echo @$meta['icon']; ?>">

<!-- Custom fonts for this template-->
<link href="<?php echo base_url('templates/').$templates['admin_template'] ?>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->

<!-- Custom styles for this template-->
<link href="<?php echo base_url('templates/').$templates['admin_template'] ?>/css/sb-admin-2.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="<?php echo base_url('templates/'.$templates['admin_template']); ?>/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"> -->
<link rel="stylesheet" href="<?php echo base_url('templates/'.$templates['admin_template']); ?>/vendor/datatables/dataTables.bootstrap4.min.css">

<link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE'); ?>/assets/summernote/summernote.css">
<?php
echo $this->esg->extra_css();
?>
<script type="text/javascript">
  var _ID = <?php echo @intval($_GET['id'])?>;
</script>
<script type="text/javascript">
  var _URL = '<?php echo base_url() ?>';
</script>

<meta name="url" content="<?php echo base_url($this->esg->get_esg('navigation')['string']) ?>">
<meta name="og:title" content="<?php echo $meta['title'] ?>"/>
<meta name="og:type" content="site"/>
<meta name="og:url" content="<?php echo base_url($this->esg->get_esg('navigation')['string']) ?>"/>
<meta name="og:image" content="<?php echo @$meta['icon'] ?>"/>
<meta name="og:site_name" content="<?php echo $meta['title'] ?>"/>
<meta name="og:description" content="<?php echo $meta['description'] ?>"/>

<meta content="<?php echo @$meta['icon'] ?>" property="og:image"/>
<meta content="<?php echo $meta['title'] ?>" property="og:title"/>
<meta content="<?php echo $meta['description'] ?>" property="og:description"/>
<meta content="<?php echo @$meta['icon'] ?>" itemprop='url'/>

<link itemprop="thumbnailUrl" href="<?php echo @$meta['icon'] ?>">
<span itemprop="thumbnail" itemscope itemtype="http://schema.org/ImageObject"> <link itemprop="url" href="<?php echo @$meta['icon'] ?>"> </span>

