<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notification extends CI_Controller {


	function __construct()
	{
		parent::__construct();

		$this->load->library('MY_Requests');
	}

	public function index()
	{

		$this->lists();
	}

	public function lists_ajax($type = 'all')
	{
		$order = '';
		$sort = array();

		$start = ( !empty($this->input->post('start')) ) ? $this->input->post('start') : '';
		$length = ( !empty($this->input->post('length')) ) ? $this->input->post('length') : 10;	

		$TotalRecords = 10;

		$filter_issue_id = '';
		$filter_subject = '';

		if ($this->input->post('issue_id') != '' ) {
			$filter_issue_id = $this->input->post('issue_id');
		}

		if ($this->input->post('subject') != '' ) {
			$filter_subject = $this->input->post('subject');
		}

		$headers = array(
			'AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0',
			'AMT-JWT' => $this->session->userdata('token')
		);

		switch ($type) {
			case 'all':
				$request = Requests::get(api_url("notification/administrator/all?issue_id=$filter_issue_id&subject=$filter_subject&page=$start&per_page=$length&pagination=true"), $headers);
				break;
			default:
				$request = Requests::get(api_url("notification/administrator/all?issue_id=$filter_issue_id&subject=$filter_subject&page=$start&per_page=$length&pagination=true"), $headers);
				break;
		}
		

		$results = json_decode($request->body);
		
		if ( $request->status_code != 200 || !$results->status ) {
			return false;
		}

		$TotalRecords = $results->pagination->total_record;

		$TotalRecordsFiltered = $TotalRecords;
  		
	    $sEcho = intval($this->input->post('draw'));

	    $records = array();
	    $records['data'] = array();
	    
	    if (!empty($results->data)) {
			$no = $start;

			foreach($results->data as $d) {
				$no++;


				switch ($type) {
					case 'all':
						$records['data'][] = array(
							$no,
							$d->id,
							$d->subject,
							$d->type,
							$d->staff_name
						);
						break;
					default:
						$records['data'][] = array(
							$no,
							$d->id,
							$d->subject,
							$d->type,
							$d->staff_name
						);
						break;
				}
				
			}
		}

		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $TotalRecords;
		$records["recordsFiltered"] = $TotalRecordsFiltered;

		echo json_encode($records);
	}

	public function lists()
	{
		$data['title'] = 'List Notifications';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		$datac = array(
			'title'	=> 'All Notifications',
			'table_url'	=> base_url('notification/lists_ajax/all')
		);

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->set_partial('content','lists',$datac);

		$this->parser->parse('default',$data);
	}

	public function read()
	{
		$result = array(
			'status' => false
		);

		$headers = array(
			'AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0',
			'AMT-JWT' => $this->session->userdata('token')
		);

		$params = array();

		$request = Requests::post(api_url("notification/read/administrator"), $headers, $params);

		$response = json_decode($request->body);

		if ( $request->status_code == 200 || $response->status ) {
			$result['status'] = true;
		}

		echo json_encode($result);
	}
}
