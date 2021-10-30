<?php defined('BASEPATH') or exit('No direct script access allowed');

class Absensi_mode extends CI_Model{

  public function status()
  {
    return ['Libur','berangkat','telat', 'pulang cepat', 'pulang','izin', 'absen'	];
  }
}