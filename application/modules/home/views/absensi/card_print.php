<link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE'); ?>/assets/bootstrap/css/bootstrap.min.css">
<img src="<?php echo base_url('images/kop.jpeg');?>" class="img img-responsive" alt="">
<!-- <h1>Data Perangkat Desa yang sudah absen</h1> -->
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
<script>
    window.print();
</script>