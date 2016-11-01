<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Administrator extends CI_Controller 
{
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
		$data['title'] = 'Administrator Data';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		$datac = array(
			'title'	=> 'Administrator Data',
			'table_url'	=> base_url('staff/administrator/lists_ajax')
		);

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->set_partial('content','lists_administrator',$datac);

		$this->parser->parse('default',$data);
	}

	public function lists_ajax()
	{

		$order = '';
		$sort = array();

		$start = ( !empty($this->input->post('start')) ) ? $this->input->post('start') : 0;
		$length = ( !empty($this->input->post('length')) ) ? $this->input->post('length') : 10;	
		$page = $start/$length;

		$TotalRecords = 10;

		$filter_staff_name = '';

		if ($this->input->post('staff_name') != '' ) {
			$filter_staff_name = $this->input->post('staff_name');
		}
		
		$headers = array('AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0');
		$request = Requests::get(api_url("staff/list?group=administrator&name=$filter_staff_name&page=$page&per_page=$length"), $headers);

		$results = json_decode($request->body);
		
		if( $request->status_code != 200 || !$results->status ) {
			return false;
		}

		$TotalRecords = $results->pagination->total_record;

		$TotalRecordsFiltered = $TotalRecords;	
		
	    $sEcho = intval($this->input->post('draw'));

	    $records = array();
	    $records['data'] = array();
	    
	    if(!empty($results->data)) {
			$no = $start;

			foreach($results->data as $d) {
				$no++;

				$action = '<a href="'.base_url('staff/administrator/update/'.$d->staff_id).'" class="btn btn-xs default"><i class="fa fa-search"></i> Edit</a>
        					<a href="javascript:;" data-url="'.base_url('staff/administrator/delete/'.$d->staff_id).'" data-message="Are you sure you want to delete administrator '.$d->name.' ?" class="btn btn-xs default delete"><i class="fa fa-remove"></i> Delete</a>';

				$records['data'][] = array(
					$no,
					$d->username,
					$d->name,
					$d->address,
					$d->date_registered,
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
		$data['title'] = 'Add Administrator';

		$datac = array(
			'type'		=> 'administrator',
			'title' 	=> 'Add Administrator',
			'action'	=> 'add',
			'api_url'	=> api_url('staff/register')
		);

		$this->parser->set_partial('header','partials/form-header');
		$this->parser->set_partial('footer','partials/form-footer');
		$this->parser->set_partial('content','form',$datac);

		$this->parser->parse('default',$data);
	}

	public function update($id)
	{
		
		$data['title'] = 'Update Administrator';

		$headers = array('AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0');
		$request = Requests::get(api_url("staff/detail?staff_id=$id"), $headers);

		$results = json_decode($request->body);
		
		if( $request->status_code != 200 || !$results->status )
		{
			redirect(base_url('staff'));
		}

		$datac = array(
			'type'				=> 'administrator',
			'title' 			=> 'Update Administrator',
			'action'			=> 'edit',
			'api_url'			=> api_url('staff/update'),
			'api_url_password'	=> api_url('staff/update-password'),
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
		$request = Requests::get(api_url("staff/delete?staff_id=$id"), $headers);

		$results = json_decode($request->body);
		
		if( $request->status_code != 200 || !$results->status )
		{
			$message = '<div class="alert alert-danger fade in">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
							Connection Error
						</div>';
		}

		$this->session->set_flashdata('message', $message);

		redirect(base_url('staff'));


	}




}
