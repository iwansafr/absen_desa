<?php defined('BASEPATH') or exit('No direct script access allowed');

class Absensi extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->db->cache_off();
    $this->load->model('esg_model');
    $this->load->model('admin_model');
    $this->load->library('esg');
    $this->load->library('ZEA/zea');
  }
  public function index()
  {
    $jam = $this->esg->get_config('jam_kerja');
    pr($jam);die();
    $this->load->view('admin/absensi/index');
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
      $karyawan_visit = $this->db->query('SELECT * FROM absensi WHERE karyawan_id = ? AND date(visit_time) = CURDATE()', $id)->row_array();
      $allowed = false;
      if(empty($karyawan_visit)){
        $this->db->insert('absensi',['karyawan_id'=>$id,'visit_time'=>date('Y-m-d- H:i:s')]);
        $allowed = true;
      }else{
        $hour = date('H');
        if($hour > 6 && $hour < 10){
          $morning_visit = $this->db->query('SELECT * FROM absensi WHERE karyawan_id = ? AND date(visit_time) = CURDATE() AND hour(visit_time) < 10 AND hour(visit_time) > 6', $id)->row_array();
          if(empty($morning_visit)){
            $this->db->insert('absensi',['karyawan_id'=>$id,'visit_time'=>date('Y-m-d- H:i:s')]);
            $allowed = true;
          }
        }else if($hour >= 10 && $hour <= 14){
          $noon_visit = $this->db->query('SELECT * FROM absensi WHERE karyawan_id = ? AND date(visit_time) = CURDATE() AND hour(visit_time) >= 10 AND hour(visit_time) <= 14', $id)->row_array();
          if(empty($noon_visit)){
            $this->db->insert('absensi',['karyawan_id'=>$id,'visit_time'=>date('Y-m-d- H:i:s')]);
            $allowed = true;
          }
        }
      }
      $this->load->view('admin/absensi/save', ['data' => $karyawan]);
    }else{
      ?>
      <script>
        alert('maaf karyawan tidak diketahui');
        window.location.href="<?php echo base_url('admin/absensi');?>";
      </script>
      <?php
    }
  }

  public function report()
  {
    $this->esg_model->init();
    $month = @intval($_GET['month']);
    $data = $this->db->query('SELECT * FROM karyawan WHERE MONTH(visit_time) = ?',$month)->result_array();
    $this->load->view('index', ['data'=>$data]);
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
}
