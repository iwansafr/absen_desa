<?php

$config = new Zea();
$config->init('param');
$config->setParamName('jam_kerja');
$config->setTable('config');
$config->addInput('jam_berangkat_awal','text');
$config->setType('jam_berangkat_awal','time');

$config->addInput('jam_berangkat_akhir', 'text');
$config->setType('jam_berangkat_akhir', 'time');

$config->addInput('jam_pulang_awal', 'text');
$config->setType('jam_pulang_awal', 'time');

$config->addInput('jam_pulang_akhir', 'text');
$config->setType('jam_pulang_akhir', 'time');

$config->setEnableDeleteParam(false);
$config->form();