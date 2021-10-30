<?php defined('BASEPATH') or exit('No direct script access allowed');

class Absensi_model extends CI_Model{

  public function status()
  {
    return ['Libur','Berangkat Pagi','Terlambat', 'pulang cepat', 'Pulang','izin', 'absen'	];
  }
}