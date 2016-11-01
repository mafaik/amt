<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	function __construct()
	{
		parent::__construct();

		$this->parser->set_partial('header','partials/header');
		$this->parser->set_partial('footer','partials/footer');
		

	}

	public function index()
	{
		$data['title'] = 'Dashboard';

		$this->parser->set_partial('content','dashboard',$data);
		$this->parser->parse('default',$data);
	}
}
