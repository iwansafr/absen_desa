<?php
$form = new Zea();
$form->init('edit');
$form->setTable('jabatan');
$form->addInput('title','text');
$form->setFormName('jabatan_form');
$form->form();
$this->load->view('admin/karyawan/jabatan_list');