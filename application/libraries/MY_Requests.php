<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');  

require_once APPPATH."/third_party/Requests/Requests.php";

class MY_Requests {
    public function __construct() {
       Requests::register_autoloader();
    }
}