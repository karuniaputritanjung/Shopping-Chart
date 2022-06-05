<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('welcome_message');
	}
    //localhost/php/CIview/index.php/mahasiswa/hello

    public function hello()
    {
        echo "Hello World . . .</br>";
    }
//localhost/php/CIview/index.php/mahasiswa/cetakID/M311xx/Paijo
    public function CetakID($nim,$nama)

    {
        $tahun=2021;
        echo "nim mahasiswa :$nim</br>";
        echo "nama mahasiswa :$nama</br>";
        echo "tajun ajrn mahasiswa :$tahun</br>";
    }

 /*   public function _remap($method, $params = array())
{
        $method = 'process_'.$method;
        if (method_exists($this, $method))
        {
                return call_user_func_array(array($this, $method), $params);
        }
        show_404();
} */
public function process_hello() //digunkn dgn fngsi _remap
    {
        echo "Hello World baby. . .</br>";
    }
    public function _output($output)
{
        //echo $output;
        echo "D3TI SV uns </br>";
}


}
