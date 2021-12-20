<?php

$form = new Zea();
$form->init('roll');
$form->setTable('karyawan');
$form->setNumbering(true);
$form->search();
$form->addInput('id', 'plaintext');
$form->setLabel('id','Action');
$form->setPlaintext('id',[
	base_url('admin/absensi/report/{id}/rekap') => 'rekap'
]);
$form->addInput('nama', 'plaintext');
$form->addInput('jabatan_id', 'dropdown');
$form->setLabel('jabatan_id','jabatan');
$form->setAttribute('jabatan_id', 'disabled');
$form->tableOptions('jabatan_id', 'jabatan','id','title');
$form->addInput('kelas', 'plaintext');
$form->setLabel('kelas', 'Kelas (kosongi jika bukan siswa)');
$form->addInput('jk', 'dropdown');
$form->setAttribute('jk', 'disabled');
$form->setOptions('jk', ['L' => 'Laki-laki', 'P' => 'Perempuan']);
$form->setLabel('jk', 'Jenis Kelamin');
$form->addInput('hp', 'plaintext');
$form->addInput('alamat', 'plaintext');
$form->addInput('photo', 'thumbnail');
$form->setDataTable(true);
$form->setEdit(true);
$form->setDelete(true);

$form->form();
