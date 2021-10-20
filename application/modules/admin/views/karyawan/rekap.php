<?php
$form = new Zea();
$form->init('roll');
$form->setTable('absensi');
$form->setNumbering(true);
$form->addInput('id','hidden');
$form->setWhere('karyawan_id = '.@intval($id));
$form->addInput('karyawan_id','dropdown');
$form->setAttribute('karyawan_id','disabled');
$form->tableOptions('karyawan_id','karyawan','id','nama');
$form->setLabel('karyawan_id','nama');
$form->addInput('visit_time','plaintext');
$form->setLabel('visit_time','waktu');
$form->setDelete(true);

$form->form();