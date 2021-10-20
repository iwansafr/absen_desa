<?php
$form = new Zea();
$form->init('roll');
$form->setTable('jabatan');
$form->addInput('id','plaintext');
$form->addInput('title','plaintext');
$form->setDelete(true);
$form->setEdit(true);
$form->setFormName('jabatan_form_list');
$form->setDataTable(true);
$form->form();
