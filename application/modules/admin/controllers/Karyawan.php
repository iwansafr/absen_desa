<?php defined('BASEPATH') or exit('No direct script access allowed');

class Karyawan extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->db->cache_off();
    $this->load->model('esg_model');
    $this->load->model('admin_model');
    $this->load->library('esg');
    $this->load->library('ZEA/zea');
    $this->esg_model->init();
  }
  public function index()
  {
    $this->load->view('index');
  }
  public function list()
  {
    $this->load->view('index');
  }
  public function clear_list()
  {
    $this->load->view('admin/karyawan/list');
  }
  public function edit()
  {
    $this->load->view('index');
  }
  public function rekap($id = 0)
  {
    $this->load->view('index',['id'=>$id]);
  }
  public function jabatan_edit()
  {
    $this->load->view('index');
  }
  public function jabatan_list()
  {
    $this->load->view('index');
  }
  public function jabatan_clear_list()
  {
    $this->load->view('admin/karyawan/jabatan_list');
  }
}
