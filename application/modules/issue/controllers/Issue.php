<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Issue extends CI_Controller {


	function __construct()
	{
		parent::__construct();

		$this->load->library('MY_Requests');
	}

	public function index()
	{
		$this->all();
	}

	public function lists_ajax($type = 'all')
	{
		$order = '';
		$sort = array();

		$start = ( !empty($this->input->post('start')) ) ? $this->input->post('start') : '';
		$length = ( !empty($this->input->post('length')) ) ? $this->input->post('length') : 10;	

		$TotalRecords = 10;

		$filter_issue_id = '';
		$filter_outlet_name = '';
		$filter_subject = '';
		$filter_issue = '';
		$filter_staff_name = '';

		if ($this->input->post('issue_id') != '' ) {
			$filter_issue_id = $this->input->post('issue_id');
		}

		if ($this->input->post('outlet_name') != '' ) {
			$filter_outlet_name = $this->input->post('outlet_name');
		}

		if ($this->input->post('subject') != '' ) {
			$filter_subject = $this->input->post('subject');
		}

		if ($this->input->post('issue') != '' ) {
			$filter_issue = $this->input->post('issue');
		}

		if ($this->input->post('staff_name') != '' ) {
			$filter_staff_name = $this->input->post('staff_name');
		}

		$headers = array('AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0');

		switch ($type) {
			case 'all':
				$request = Requests::get(api_url("issue/administrator/all?issue_id=$filter_issue_id&outlet_name=$filter_outlet_name&subject=$filter_subject&issue=$filter_issue&staff_name=$filter_staff_name&page=$start&per_page=$length"), $headers);
				break;
			case 'open':
				$request = Requests::get(api_url("issue/administrator/open?issue_id=$filter_issue_id&outlet_name=$filter_outlet_name&subject=$filter_subject&issue=$filter_issue&staff_name=$filter_staff_name&page=$start&per_page=$length"), $headers);
				break;
			case 'pending':
				$request = Requests::get(api_url("issue/administrator/pending?issue_id=$filter_issue_id&outlet_name=$filter_outlet_name&subject=$filter_subject&issue=$filter_issue&staff_name=$filter_staff_name&page=$start&per_page=$length"), $headers);
				break;
			case 'progress':
				$request = Requests::get(api_url("issue/administrator/progress?issue_id=$filter_issue_id&outlet_name=$filter_outlet_name&subject=$filter_subject&issue=$filter_issue&staff_name=$filter_staff_name&page=$start&per_page=$length"), $headers);
				break;
			case 'history':
				$request = Requests::get(api_url("issue/administrator/process?issue_id=$filter_issue_id&outlet_name=$filter_outlet_name&subject=$filter_subject&issue=$filter_issue&staff_name=$filter_staff_name&page=$start&per_page=$length"), $headers);
				break;
			default:
				$request = Requests::get(api_url("issue/administrator/all?issue_id=$filter_issue_id&outlet_name=$filter_outlet_name&subject=$filter_subject&issue=$filter_issue&staff_name=$filter_staff_name&page=$start&per_page=$length"), $headers);
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

				$attachment = '';
				if (!empty($d->attachment)) {
					$attachment_array = explode(";", $d->attachment);
					for ($i=0; $i < count($attachment_array); $i++) { 
						$img_url = api_url('uploads/issue/'.$attachment_array[$i]);
						$attachment .= '<a data-toggle="modal" href="#show_image" data-id="'.$img_url.'"  class="open-ImageDialog"><img src="'.$img_url.'" height="50"/></a><br/><br/>';
					}
				}

				$attachment_checkout = '';
				if (!empty($d->attachment_checkout)) {
					$attachment_checkout_array = explode(";", $d->attachment_checkout);
					for ($i=0; $i < count($attachment_checkout_array); $i++) { 
						$img_url = api_url('uploads/issue/'.$attachment_checkout_array[$i]);
						$attachment_checkout .= '<a data-toggle="modal" href="#show_image" data-id="'.$img_url.'"  class="open-ImageDialog"><img src="'.$img_url.'" height="50"/></a><br/><br/>';
					}
				}

				$update_ticket = "<a href='".base_url('issue/update/'.$d->issue_id)."' class='btn btn-sm default'><i class='fa fa-edit'></i> Update Ticket</a>";

				switch ($type) {
					case 'all':
						$records['data'][] = array(
							$no,
							$d->issue_id,
							$d->outlet_name,
							$d->date_request,
							$d->subject,
							$d->issue,
							$attachment,
							$d->name,
							strtoupper($d->status)
						);
						break;
					case 'open':
						$records['data'][] = array(
							$no,
							$d->issue_id,
							$d->outlet_name,
							$d->date_request,
							$d->subject,
							$d->issue,
							$attachment,
							$d->name,
							''
						);
						break;
					case 'pending':
						$records['data'][] = array(
							$no,
							$d->issue_id,
							$d->outlet_name,
							$d->date_request,
							$d->subject,
							$d->issue,
							$attachment,
							$update_ticket
						);
						break;
					case 'progress':
						$records['data'][] = array(
							$no,
							$d->issue_id,
							$d->outlet_name,
							$d->date_request,
							$d->subject,
							$d->issue,
							$attachment,
							$d->name,
							$d->date_checkin
						);
						break;
					case 'history':
						$records['data'][] = array(
							$no,
							$d->issue_id,
							$d->outlet_name,
							$d->date_request,
							$d->subject,
							$d->issue,
							$attachment,
							$d->name,
							$d->date_checkin,
							$d->date_checkout,
							$d->note,
							$attachment_checkout
						);
						break;
					default:
						$records['data'][] = array(
							$no,
							$d->issue_id,
							$d->outlet_name,
							$d->date_request,
							$d->subject,
							$d->issue,
							$attachment,
							$d->name,
							strtoupper($d->status)
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

	public function all()
	{
		$data['title'] = 'All Tickets';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		$datac = array(
			'title'	=> 'All Tickets',
			'table_url'	=> base_url('issue/lists_ajax/all')
		);

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->set_partial('content','lists-all',$datac);

		$this->parser->parse('default',$data);
	}

	public function open()
	{
		$data['title'] = 'Open Tickets';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		$datac = array(
			'title'	=> 'Open Tickets',
			'table_url'	=> base_url('issue/lists_ajax/open')
		);

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->set_partial('content','lists-open',$datac);

		$this->parser->parse('default',$data);
	}

	public function pending()
	{
		$data['title'] = 'Pending Tickets';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		$datac = array(
			'title'	=> 'Pending Tickets',
			'table_url'	=> base_url('issue/lists_ajax/pending')
		);

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->set_partial('content','lists-pending',$datac);

		$this->parser->parse('default',$data);
	}

	public function progress()
	{
		$data['title'] = 'In Progress Tickets';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		$datac = array(
			'title'	=> 'In Progress Tickets',
			'table_url'	=> base_url('issue/lists_ajax/progress')
		);

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->set_partial('content','lists-progress',$datac);

		$this->parser->parse('default',$data);
	}

	public function solved()
	{
		$data['title'] = 'Solved Tickets';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		$datac = array(
			'title'	=> 'Solved Tickets',
			'table_url'	=> base_url('issue/lists_ajax/history')
		);

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->set_partial('content','lists-history',$datac);

		$this->parser->parse('default',$data);
	}

	public function add($type = 'standard', $period = 'weekly')
	{
		if ($type == 'repeated') {
			$data['title'] = 'New Repeated Ticket';

			if ($period == 'weekly') {
				$api_url = api_url('issue/administrator/recurrence/weekly');
			} else {
				$api_url = api_url('issue/administrator/recurrence/monthly');
			}
		} else {
			$data['title'] = 'New Ticket';
			$api_url = api_url('issue/outlet/insert');
		}

		$datac = array(
			'title' 	=> $data['title'],
			'action'	=> 'add',
			'api_url'	=> $api_url
		);

		$this->parser->set_partial('header','partials/form-header');
		$this->parser->set_partial('footer','partials/form-footer');
		
		if ($type == 'repeated') {
			$this->parser->set_partial('content','form-recurrence-'.$period,$datac);
		} else {
			$this->parser->set_partial('content','form',$datac);
		}

		$this->parser->parse('default',$data);
	}

	public function update($what = 'detail' , $id)
	{
		
		$data['title'] = 'Form Update Ticket';

		$headers = array('AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0');
		$request = Requests::get(api_url("issue/outlet/detail?issue_id=$id"), $headers);

		$results = json_decode($request->body);

		if( $request->status_code != 200 || !$results->status || $results->data->status != 'pending')
		{
			redirect(base_url('issue'));
		}

		$api_url = ( $what == 'detail' ) ? 'issue/outlet/update' : 'issue/administrator/select-staff';

		$attachment = array();

		if( !empty($results->data->attachment) )
		{
			$attachment = explode(';', $results->data->attachment);
		}

		$datac = array(
			'title' 			=> 'Form Update Ticket',
			'action'			=> 'edit',
			'api_url'			=> api_url($api_url),
			'detail'			=> $results->data,
			'attachment'		=> $attachment
		);

		$this->parser->set_partial('header','partials/form-header');
		$this->parser->set_partial('footer','partials/form-footer');

		$content = ( $what == 'detail' ) ? 'form' : 'form-update-staff';
		$this->parser->set_partial('content',$content,$datac);

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






}
