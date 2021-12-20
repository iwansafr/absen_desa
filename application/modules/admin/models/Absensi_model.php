<?php defined('BASEPATH') or exit('No direct script access allowed');

class Absensi_model extends CI_Model{


	public function days()
	{
		return [1=>'Senin',2=>'Selasa',3=>'Rabu',4=>'Kamis',5=>'Jumat',6=>'Sabtu',7=>'Minggu'];
	}
  public function status()
  {
    return ['Off','Berangkat Pagi','Terlambat', 'pulang cepat', 'Pulang','izin', 'absen'	];
  }
  public function rekap($k_id = 0, $year = '', $month = '')
	{
		if (empty($year)) {
			$year = date('Y');
		}
		if (empty($month)) {
			$month = date('m');
		}
		if (empty($k_id)) {
			$data = $this->db->get_where('absensi', ['YEAR(visit_time)' => $year, 'MONTH(visit_time)' => $month])->result_array();
		} else {
			$data = $this->db->get_where('absensi', ['karyawan_id' => $k_id])->result_array();
		}
		$tgl = $this->tgl($year . '-' . $month . '-01');
		$merge_data = [];
		if(!empty($data))
		{
			$merge_data = $this->merge_data_tgl($k_id,$data,$tgl);
		}else{
			$data = $this->get_karyawan(0);
			$merge_data = $this->merge_data_tgl(0,$data,$tgl);
		}
		return $merge_data;
	}

  private function merge_data_tgl($k_id = 0 ,$data = array(), $tgl = array())
	{
		$merge_data = [];
		if (!empty($data)) {
			foreach ($data as $dkey => $dvalue) {
				foreach ($tgl as $key => $value) {
					$merge_data[$value['date']]['hari'] = $value['name'];
					if (!empty($dvalue['visit_time'])) {
						if (substr($dvalue['visit_time'], 0, 10) == $value['date']) {
							if (empty($k_id)) {
								$merge_data[$value['date']][$dvalue['status']][$dvalue['karyawan_id']] = $dvalue;
							} else {
								$merge_data[$value['date']][$dvalue['status']] = $dvalue;
							}
							$merge_data[$value['date']]['status'] = 'on';
						}else{
							if (empty($merge_data[$value['date']]['status'])) {
								$merge_data[$value['date']]['status'] = 'off';
							}
						}
					}else {
						$merge_data[$value['date']][0][$dvalue['id']] = 'off';
					}
				}
			}
		}
		return $merge_data;
	}
	public function tgl($date)
	{
		if (!empty($date)) {
			$date_set = substr($date, 0, 8);
			$end = $date_set . date('t', strtotime($date)); //get end date of month
			$tgl = [];
			$hari = ['Saturday' => 'Sabtu', 'Sunday' => 'Ahad', 'Monday' => 'Senin', 'Tuesday' => 'Selasa', 'Wednesday' => 'Rabu', 'Thursday' => 'Kamis', 'Friday' => 'Jumat'];
			while (strtotime($date) <= strtotime($end)) {
				$current_date = $date;
				$day_num = date('d', strtotime($date));
				$day_name = date('l', strtotime($date));
				$day_name = $hari[$day_name];
				$date = date("Y-m-d", strtotime("+1 day", strtotime($date)));
				$tgl[] = ['num' => $day_num, 'name' => $day_name, 'date' => $current_date];
			}
			return $tgl;
		}
	}
	public function get_karyawan($k_id = 0)
	{
    if (!empty($k_id)) {
      $this->db->where(['id' => $k_id]);
      $data = $this->db->get('karyawan')->row_array();
    } else {
      $data = $this->db->get('karyawan')->result_array();
    }
	}
	public function flash_absen($id = 0)
	{
		$karyawan = $this->db->query('SELECT karyawan.*,jabatan.title AS jabatan FROM karyawan INNER JOIN jabatan ON(jabatan.id=karyawan.jabatan_id) WHERE karyawan.id = ?', $id)->row_array();
		if(!empty($karyawan))
		{
			$day = date('N');
			$jam = $this->esg->get_config('jam_kerja_'.$day);
			if(empty($jam)){
				$jam = $this->esg->get_config('jam_kerja');
			}
			$cur_time = date('H:i');
			$pesan = '';
			// [0] => Libur
			// [1] => berangkat
			// [2] => telat
			// [3] => pulang cepat
			// [4] => pulang
			// [5] => izin
			// [6] => absen

			if($cur_time >= $jam['jam_berangkat_awal'] && $cur_time <= $jam['jam_berangkat_akhir']){
				$status = 1;
				$jam_jadwal = $jam['jam_berangkat_awal'];
			}else if($cur_time > $jam['jam_berangkat_akhir'] && $cur_time < $jam['jam_pulang_awal']){
				$status = 2;
				$jam_jadwal = $jam['jam_berangkat_awal'];
			}else if($cur_time >= $jam['jam_pulang_awal'] && $cur_time <= $jam['jam_pulang_akhir']){
				$status = 4;
				$jam_jadwal = $jam['jam_pulang_awal'];
			} else {
				$status = 0;
				$jam_jadwal = '00:00:00';
			}
			$waktu      = strtotime($cur_time);
			$strtime_jadwal = strtotime($jam_jadwal);

			$selisih = $waktu - $strtime_jadwal;
			$selisih = $selisih / 60;
			// pr($selisih);
			if($status == 2){
				$karyawan_visit = $this->db->query('SELECT * FROM absensi WHERE karyawan_id = ? AND date(visit_time) = CURDATE() AND status = 1 OR status = ?', [$id, $status])->row_array();
			}else{
				$karyawan_visit = $this->db->query('SELECT * FROM absensi WHERE karyawan_id = ? AND date(visit_time) = CURDATE() AND status = ?', [$id, $status])->row_array();
			}
			$allowed = false;
			if(empty($karyawan_visit)){
				// $this->db->insert('absensi',['karyawan_id'=>$id, 'status'=>$status,'jam_jadwal'=>$jam_jadwal,'selisih_waktu'=>$selisih,'visit_time'=>date('Y-m-d- H:i:s')]);
				if($status>0){
					$this->db->insert('absensi',['karyawan_id'=>$id, 'status'=>$status,'jam_jadwal'=>$jam_jadwal,'selisih_waktu'=>$selisih]);
					$allowed = true;
					$pesan = ['msg' => '<b>'.$karyawan['nama'].'</b> Berhasil Melakukan Absen '.$this->absensi_model->status()[$status],'pesan'=>$karyawan['nama'].' berhasil melakukan absen '.$this->absensi_model->status()[$status], 'status'=>'success'];
				}else{
					$pesan = ['msg' => '<b>'.$karyawan['nama'].'</b> tidak bisa absen karena sistem sedang off','pesan'=>'maaf absen sedang off', 'status'=>'warning'];
				}
			}else{
				$allowed = true;
				$pesan = ['msg' => '<b>'.$karyawan['nama'].'</b> Sudah Melakukan Absen '.$this->absensi_model->status()[$status], 'status'=>'success', 'pesan'=>$karyawan['nama'].' sudah melakukan absen '.$this->absensi_model->status()[$status]];
			}
			return $pesan;
		}
	}
}