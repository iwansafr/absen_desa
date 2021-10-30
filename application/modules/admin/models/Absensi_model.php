<?php defined('BASEPATH') or exit('No direct script access allowed');

class Absensi_model extends CI_Model{

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
}