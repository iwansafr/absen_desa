<a href="#" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#jabatan_form"><i class="fa fa-plus"></i> Tambah Jabatan</a>
<a href="<?php echo base_url('admin/karyawan/edit') ?>" class="btn btn-sm btn-success"><i class="fa fa-refresh"></i> Refresh</a>
<div id="jabatan_form" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Jabatan</h4>
      </div>
      <div class="modal-body">
        <?php $this->load->view('admin/karyawan/jabatan_edit') ?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<?php

$form = new Zea();
$form->init('edit');
$form->setId(@intval($_GET['id']));
$form->setTable('karyawan');
$form->addInput('nama', 'text');
$form->addInput('jabatan_id', 'dropdown');
$form->setLabel('jabatan_id','jabatan');
$form->tableOptions('jabatan_id', 'jabatan','id','title');
// $form->addInput('kelas', 'text');
// $form->setLabel('kelas', 'Kelas (kosongi jika bukan siswa)');
$form->addInput('jk', 'dropdown');
$form->setOptions('jk', ['L' => 'Laki-laki', 'P' => 'Perempuan']);
$form->setLabel('jk', 'Jenis Kelamin');
$form->addInput('hp', 'text');
$form->addInput('alamat', 'textarea');
$form->addInput('photo', 'file');
$form->setAccept('photo', '.jpg,.jpeg,.png');
$card_code_exist = $this->db->field_exists('card_code','karyawan');
if($card_code_exist){
	$form->addINput('card_code','text');
	$form->setType('card_code','number');
	$form->setLabel('card_code','Card Code');
	$form->setAttribute('card_code',['placeholder'=>'Tap Kartu pada Card reader']);
	$form->setHelp('card_code','Tap Kartu pada Card reader');
	$form->setUnique(['card_code']);
}

$form->form();
