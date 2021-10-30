<?php

$form = new Zea();
$form->init('param');
$form->setTable('config');
$form->setParamName('instansi');
$form->addInput('nama','text');
$form->setLabel('nama','Nama Instansi');
$form->setEnableDeleteParam(false);
$form->form();