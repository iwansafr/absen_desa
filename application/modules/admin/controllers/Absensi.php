<?php defined('BASEPATH') or exit('No direct script access allowed');

class Absensi extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->db->cache_off();
    $this->load->model('esg_model');
    $this->load->model('admin_model');
    $this->load->model('absensi_model');
    $this->load->library('esg');
    $this->load->library('ZEA/zea');
  }
  public function index()
  {
    $jam = $this->esg->get_config('jam_kerja');

    $cur_time = date('H:i');
    // pr($cur_time,$jam);
    // pr($jam['jam_berangkat_akhir']<$cur_time);
    // pr($this->absensi_model->status());

    // [0] => Libur
    // [1] => berangkat
    // [2] => telat
    // [3] => pulang cepat
    // [4] => pulang
    // [5] => izin
    // [6] => absen

    if($cur_time >= $jam['jam_berangkat_awal'] && $cur_time <= $jam['jam_berangkat_akhir']){
      $status = 1;
    }else if($cur_time > $jam['jam_berangkat_akhir'] && $cur_time < $jam['jam_pulang_awal']){
      $status = 2;
    }else if($cur_time >= $jam['jam_pulang_awal'] && $cur_time <= $jam['jam_pulang_akhir']){
      $status = 4;
    }else{
      $status = 0;
    }
    // pr($status);
    // die();
    $data['status'] = $status;
    $this->load->view('admin/absensi/index', $data);
  }
  public function get_karyawan()
  {
    $data = $this->db->get_where('karyawan')->result_array();
    echo json_encode($data);
  }
  public function save($id = 0)
  {
    $karyawan = $this->db->query('SELECT karyawan.*,jabatan.title AS jabatan FROM karyawan INNER JOIN jabatan ON(jabatan.id=karyawan.jabatan_id) WHERE karyawan.id = ?', $id)->row_array();
    if(!empty($karyawan))
    {
      $jam = $this->esg->get_config('jam_kerja');
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
      $karyawan_visit = $this->db->query('SELECT * FROM absensi WHERE karyawan_id = ? AND date(visit_time) = CURDATE() AND status = ?', [$id, $status])->row_array();
      $allowed = false;
      if(empty($karyawan_visit)){
        $this->db->insert('absensi',['karyawan_id'=>$id, 'status'=>$status,'jam_jadwal'=>$jam_jadwal,'selisih_waktu'=>$selisih,'visit_time'=>date('Y-m-d- H:i:s')]);
        $allowed = true;
        $pesan = 'Terima Kasih';
      }else{
        $allowed = true;
        $pesan = 'Sudah Melakukan Absen '.$this->absensi_model->status()[$status];
      }
      $this->load->view('admin/absensi/save', ['data' => $karyawan, 'pesan'=>$pesan]);
    }else{
      ?>
      <script>
        alert('maaf karyawan tidak diketahui');
        window.location.href="<?php echo base_url('admin/absensi');?>";
      </script>
      <?php
    }
  }

  public function report($k_id = 0)
  {
    if(!empty($k_id))
		{
      $this->esg_model->init();
			$year  = !empty($_GET['year']) ? $_GET['year'] : date('Y');
			$month = !empty($_GET['month']) ? $_GET['month'] : date('m');

			if(!empty($_GET['my']))
			{
				$get_month = !empty($_GET['my']) ? $_GET['my'] : date('m');
				$get_month = explode('-',$get_month);
				if(!empty($get_month[0]))
				{
					$year = $get_month[0];
				}
				if(!empty($get_month[1]))
				{
					$month = $get_month[1];
				}
			}

			// pr($data);die();
			$karyawan = $this->db->query('SELECT * FROM karyawan WHERE id = ?', $k_id)->row_array();
			$data = $this->absensi_model->rekap($k_id,$year,$month);
      $instansi = $this->esg->get_config('instansi');
			if(empty($_GET['excel'])){
				$this->load->view('index',['data'=>$data,'karyawan'=>$karyawan,'month'=>$month,'year'=>$year,'instansi'=>$instansi]);
			}else{
				$this->load->view('admin/absensi/report',['data'=>$data,'karyawan'=>$karyawan,'month'=>$month,'year'=>$year,'instansi'=>$instansi]);
			}
		}
  }
  public function cam()
  {
    $this->load->view('admin/absensi/cam');
  }
  public function jam_kerja()
  {
    $this->esg_model->init();
    $this->load->view('index');
  }
  public function jam_kerja_custom()
  {
    $this->esg_model->init();
    $days = $this->absensi_model->days();
    $this->load->view('index',['days'=>$days]);
  }
}
