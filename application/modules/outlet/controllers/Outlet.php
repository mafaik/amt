<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Outlet extends CI_Controller {

	private $opt_city = array(
		'Malang' 	=> 'Malang',
		'Surabaya' 	=> 'Surabaya',
		'Jakarta Pusat' => 'Jakarta Pusat',
		'Jakarta Utara' => 'Jakarta Utara',
		'Banda Aceh' => 'Banda Aceh'
	);

	private $opt_state = array(
		'DKI Jakarta'	=> 'DKI Jakarta',
		'Jawa Timur'	=> 'Jawa Timur',
		'Aceh'			=> 'Aceh'
	);

	function __construct()
	{
		parent::__construct();

		$this->load->library('MY_Requests');
	}

	public function index()
	{
		$this->lists();
	}

	public function lists()
	{
		$data['title'] = 'Outlet Data';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		$datac = array(
			'title'	=> 'Outlet Data',
			'table_url'	=> base_url('outlet/lists_ajax')
		);

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->set_partial('content','lists',$datac);

		$this->parser->parse('default',$data);
	}

	public function lists_ajax($type = 'lists')
	{
		$order = '';
		$sort = array();

		$start = ( !empty($this->input->post('start')) ) ? $this->input->post('start') : 0;
		$length = ( !empty($this->input->post('length')) ) ? $this->input->post('length') : 10;	
		$page = $start/$length;

		$TotalRecords = 10;

		$filter_staff_name = '';
		$filter_outlet_name = '';

		if ($this->input->post('staff_name') != '' ) {
			$filter_staff_name = $this->input->post('staff_name');
		}

		if ($this->input->post('outlet_name') != '' ) {
			$filter_outlet_name = $this->input->post('outlet_name');
		}


		$headers = array('AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0');
		$request = Requests::get(api_url("outlet/list?outlet=$filter_outlet_name&staff=$filter_staff_name&page=$page&per_page=$length"), $headers);

		$results = json_decode($request->body);
		
		if( $request->status_code != 200 || !$results->status ) {
			return false;
		}
		
		$TotalRecords = $results->pagination->total_record;

		$TotalRecordsFiltered = $TotalRecords;
  		
	    $sEcho = intval($this->input->post('draw'));

	    $records = array();
	    $records['data'] = array();
	    
	    if(!empty($results->data))
	    {
			$no = $start;

			foreach($results->data as $d)
			{
				
				$no++;

				$action = '<a href="'.base_url('outlet/update/'.$d->outlet_id).'" class="btn btn-xs default"><i class="fa fa-search"></i> Edit</a>
        					<a href="javascript:;" data-url="'.base_url('outlet/delete/'.$d->outlet_id).'" data-message="Are you sure you want to delete outlet '.$d->outlet_name.' ?" class="btn btn-xs default delete"><i class="fa fa-remove"></i> Delete</a>';

        		if( $type == 'modal' )
        		{
        			$detail = json_encode($d);
        			$action = "<a href='javascript:;'' data-detail='$detail' class='btn btn-xs default pilih'><i class='fa fa-search'></i> Select</a>";
        		}
        		
				$records['data'][] = array(
					$no,
					$d->outlet_name,
					$d->staff_name,
					$action
				);
				
			}
		}

		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $TotalRecords;
		$records["recordsFiltered"] = $TotalRecordsFiltered;

		echo json_encode($records);

	}

	public function add()
	{
		$data['title'] = 'Form Tambah Outlet';

		$datac = array(
			'title' 	=> 'Form Tambah Outlet',
			'action'	=> 'add',
			'city'		=> $this->opt_city,
			'state'		=> $this->opt_state,
			'api_url'	=> api_url('outlet/insert')
		);

		$this->parser->set_partial('header','partials/form-header');
		$this->parser->set_partial('footer','partials/form-footer');
		$this->parser->set_partial('content','form',$datac);

		$this->parser->parse('default',$data);
	}

	public function update($id)
	{
		
		$data['title'] = 'Form Update Outlet';

		$headers = array('AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0');
		$request = Requests::get(api_url("outlet/detail?outlet_id=$id"), $headers);

		$results = json_decode($request->body);
		
		if( $request->status_code != 200 || !$results->status )
		{
			redirect(base_url('outlet'));
		}

		$datac = array(
			'title' 			=> 'Form Update Outlet',
			'action'			=> 'edit',
			'city'				=> $this->opt_city,
			'state'				=> $this->opt_state,
			'api_url'			=> api_url('outlet/update'),
			'api_url_password'	=> api_url('outlet/update-password'),
			'detail'			=> $results->data
		);

		$this->parser->set_partial('header','partials/form-header');
		$this->parser->set_partial('footer','partials/form-footer');
		$this->parser->set_partial('content','form',$datac);

		$this->parser->parse('default',$data);
	}

	public function delete($id)
	{
		$message = '';
		$headers = array('AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0');
		$request = Requests::get(api_url("outlet/delete?outlet_id=$id"), $headers);

		$results = json_decode($request->body);
		
		if( $request->status_code != 200 || !$results->status )
		{
			$message = '<div class="alert alert-danger fade in">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
							Connection Error
						</div>';
		}

		$this->session->set_flashdata('message', $message);

		redirect(base_url('outlet'));
	}

	public function table_modal()
	{

		$data = array(
			'title'	=> 'Outlet Data',
			'table_url'	=> base_url('outlet/lists_ajax/modal')
		);

		$this->parser->parse('table_modal',$data);

	}
}
