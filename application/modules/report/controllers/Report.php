<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends CI_Controller {

	function __construct()
	{
		parent::__construct();

		$this->load->library('MY_Requests');
	}

	public function index()
	{
		$this->staff();
	}

	public function staff()
	{
		// $data['title'] = 'Laporan Teknisi';
		// $data['title'] = 'Laporan Outlet';
		$data['title'] = 'Laporan Tiket';

		if ($this->input->method(TRUE) == 'POST') {
			$range = $this->input->post('range');
			if ($range == 'else') {
				$date_start = $this->input->post('date_start');
				$date_end = $this->input->post('date_end');
			}
			$status = $this->input->post('status');

			$datac = array(
				// 'title' 	=> 'Laporan Teknisi',
				// 'title' 	=> 'Laporan Outlet',
				'title' 	=> 'Laporan Tiket',
				'url'	=> base_url('report/staffReport'),
			);
			// $this->parser->set_partial('content','staff_lists',$datac);
			// $this->parser->set_partial('content','outlet_lists',$datac);
			$this->parser->set_partial('content','ticket_lists',$datac);
		} else {
			$datac = array(
				// 'title' 	=> 'Laporan Teknisi',
				// 'title' 	=> 'Laporan Outlet',
				'title' 	=> 'Laporan Tiket',
				'url'	=> base_url('report/staff'),
			);
			$this->parser->set_partial('content','form',$datac);
		}

		$this->parser->set_partial('header','partials/lists-header');
		$this->parser->set_partial('footer','partials/lists-footer');
		$this->parser->parse('default',$data);
	}

	public function staffReport()
	{
		$start = 0;
		$length = 10;
		$order = '';
		$sort = array();

		$start = ( !empty($this->input->post('start')) ) ? $this->input->post('start') : 0;

		//get length
		if ( intval($this->input->post('length')) > 0 ) {
			$length = intval($this->input->post('length'));
		}

		$where = array();		

		$TotalRecords = 10;

		$headers = array('AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0');
		// $request = Requests::get(api_url("staff/list?page=$start&per_page=$length"), $headers);
		// $request = Requests::get(api_url("outlet/list?page=$start&per_page=$length"), $headers);
		$request = Requests::get(api_url("issue/administrator/queue?page=$start&per_page=$length"), $headers);

		$results = json_decode($request->body);
		
		if( $request->status_code != 200 || !$results->status )
		{
			return false;
		}

		$TotalRecords = $results->pagination->total_record;
  		
	    $sEcho = intval($this->input->post('draw'));

	    $records = array();
	    $records['data'] = array();
	    
	    if(!empty($results->data))
	    {
			$no = $start;

			foreach($results->data as $d)
			{
				$no++;
				/* TEKNISI
				$records['data'][] = array(
					$no,
					$d->name,
					$d->username,
					$d->address,
					$d->city,
					$d->region,
					$d->date_registered,
				);*/

				/* OUTLET
				$records['data'][] = array(
					$no,
					$d->outlet_name,
					$d->outlet_username,
					$d->outlet_contact,
					$d->outlet_address,
					$d->outlet_city,
					$d->outlet_region,
					$d->outlet_date_registered,
					$d->staff_username,
				);*/
				$action = '<a href="#" class="btn btn-xs default"><i class="fa fa-search"></i> detail</a>';
				$attachment = '<img class="img-responsive" src="http://placehold.it/100x100" />';
				$records['data'][] = array(
					$no,
					$d->outlet_id,
					$d->date_request,
					$d->subject,
					$d->issue,
					$attachment,
					$action,
				);
			}
		}

		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $TotalRecords;
		$records["recordsFiltered"] = $TotalRecords;

		echo json_encode($records);
	}
}