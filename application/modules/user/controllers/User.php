<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {


	function __construct()
	{
		parent::__construct();

		$this->load->library('MY_Requests');

	}

	public function index()
	{
		$this->login();
	}

	public function login()
	{
		if( $this->session->userdata('token') && $this->session->userdata('role') == 'ADMINISTRATOR' )
		{
			redirect('dashboard');
		}

		$data['title'] = 'Login Admin';

		if( !empty($this->session->flashdata('message')) )
		{
			$data['alert'] = $this->session->flashdata('message');
		}

		
		$ip = !empty( $_SERVER['HTTP_X_FORWARDED_FOR'] ) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];

		$datac = array(
			'title' 	=> 'Login Admin',
			'api_url'	=> api_url('staff/login'),
			'callback'	=> base_url('dashboard'),
			'session'	=> base_url('user/set_session'),
			'ip'		=> $ip
		);

		$this->parser->set_partial('content','login',$datac);

		$this->parser->parse('layout-login',$data);
	}

	public function set_session()
	{
		$response = array(
			'status' 	=> false,
			'message'	=> 'login error' 
		);


		if( !empty($this->input->post('data')) )
		{
			$data = json_decode($this->input->post('data'));

			$role = !empty($data->role) ? $data->role : '';

			if( $role == 'ADMINISTRATOR' )
			{

				$data = array(
					'staff_id'		=> $data->staff_id,
					'name'			=> $data->name,
					'token'			=> $data->token,
					'role'			=> $data->role
				);
				
				$this->session->set_userdata($data);

				$response['status'] = true;
				$response['message'] = 'ok';
			}

			
		}
		
		$response = json_encode($response);

		echo $response;

	}


	public function logout()
	{
		session_destroy();

		redirect(base_url('user/login'));
	}



}
