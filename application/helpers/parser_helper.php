<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * CI Smarty
 *
 * Smarty templating for Codeigniter
 *
 * @package   CI Smarty
 * @author    Dwayne Charrington
 * @copyright 2015 Dwayne Charrington and Github contributors
 * @link      http://ilikekillnerds.com
 * @license   MIT
 * @version   3.0
 */

/**
 * Theme URL
 *
 * A helper function for getting the current theme URL
 * in a web friendly format.
 *
 * @param string $location
 * @return mixed
 */
function theme_url($location = '')
{
    $CI =& get_instance();

    return $CI->parser->theme_url($location);
}

/**
 * CSS
 *
 * A helper function for getting the current theme CSS embed code
 * in a web friendly format
 *
 * @param $file
 * @param $attributes
 */
if ( ! function_exists('css') )
{
    function css($file, $attributes = array())
    {
        $CI =& get_instance();

        echo $CI->parser->css($file, $attributes);
    }
}

/**
 * JS
 *
 * A helper function for getting the current theme JS embed code
 * in a web friendly format
 *
 * @param $file
 * @param $attributes
 */
if ( ! function_exists('js') )
{
    function js($file, $attributes = array())
    {
        $CI =& get_instance();

        echo $CI->parser->js($file, $attributes);
    }
}

/**
 * IMG
 *
 * A helper function for getting the current theme IMG embed code
 * in a web friendly format
 *
 * @param $file
 * @param $attributes
 */
if ( ! function_exists('image') )
{
    function image($file, $attributes = array())
    {
        $CI =& get_instance();

        echo $CI->parser->img($file, $attributes);
    }
}

/**
 * Session
 *
 * A helper function for getting a session variable alias of $this->session->userdata($name)
 *
 * @param $name
 */
if ( ! function_exists('userdata') )
{
    function userdata($name)
    {
        $CI =& get_instance();

        return $CI->session->userdata($name);
    }
}

/**
 * Uri segment
 *
 * A helper function for getting a uri segment alias of $this->uri->segment(n)
 *
 * @param $segnum
 */
if ( ! function_exists('uriseg') )
{
    function uriseg($segnum)
    {
        $CI =& get_instance();

        return $CI->uri->segment($segnum);
    }
}

/**
 * Flashdata
 *
 * A helper function for getting a flash message alias of $this->session->flashdata($name)
 *
 * @param $name
 */
if ( ! function_exists('flashdata') )
{
    function flashdata($name)
    {
        $CI =& get_instance();

        return $CI->session->flashdata($name);
    }
}

/**
 * partial
 *
 * A helper function for getting partial
 *
 * @param string $location
 * @return mixed
 */

if ( ! function_exists('partial') )
{
    function partial($part)
    {
        $CI =& get_instance();

        return $CI->parser->get_partial($part);
    }
}

/**
 * api_url
 *
 * A helper function to get api url
 *
 * @param string $location
 * @return mixed
 */

if ( ! function_exists('api_url') )
{
    function api_url( $content = '' )
    {
        $CI =& get_instance();

        return $CI->config->item('api_url').$content;
        
    }
}


if ( ! function_exists('get_notification') )
{
    function get_notification( $type = 'all' )
    {
        $notifications = array(
            'data' => array(),
            'total' => 0
        );

        $CI =& get_instance();

        $CI->load->library('MY_Requests');

        $headers = array(
            'AMT-API-KEY' => 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0',
            'AMT-JWT' => $CI->session->userdata('token')
        );

        switch ($type) {
            case 'all':
                $request = Requests::get(api_url("notification/administrator/all?outlet_id=".$CI->session->userdata('outlet_id')), $headers);
                break;
            case 'pending':
                $request = Requests::get(api_url("notification/administrator/pending?outlet_id=".$CI->session->userdata('outlet_id')), $headers);
                break;
            case 'checkin':
                $request = Requests::get(api_url("notification/administrator/checkin?outlet_id=".$CI->session->userdata('outlet_id')), $headers);
                break;
            case 'checkout':
                $request = Requests::get(api_url("notification/administrator/checkout?outlet_id=".$CI->session->userdata('outlet_id')), $headers);
                break;
            default:
                $request = Requests::get(api_url("notification/administrator/all?outlet_id=".$CI->session->userdata('outlet_id')), $headers);
                break;
        }

        $results = json_decode($request->body);

        if ( $request->status_code == 200 || $results->status ) {

            $notifications = array(
                'data'  => $results->data,
                'total' => count($results->data)
            );

        }

        return $notifications;
        
    }
}

if ( ! function_exists('time_ago') )
{
    function time_ago($datetime, $full = false)
    {
        $now = new DateTime;
        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);

        $diff->w = floor($diff->d / 7);
        $diff->d -= $diff->w * 7;

        $string = array(
            'y' => 'year',
            'm' => 'month',
            'w' => 'week',
            'd' => 'day',
            'h' => 'hour',
            'i' => 'min',
            's' => 'sec',
        );
        foreach ($string as $k => &$v) {
            if ($diff->$k) {
                $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
            } else {
                unset($string[$k]);
            }
        }

        if (!$full) $string = array_slice($string, 0, 1);
        return $string ? implode(', ', $string) : 'just now';
    }
}


