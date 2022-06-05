<?php
 
class Cart extends CI_Controller{
     
    function __construct(){
        parent::__construct();
        $this->load->model('cart_model');
    }
 
    function index(){
        $data['data']=$this->cart_model->get_all_produk();
        $this->load->view('v_cart',$data);
    }
 
    function add_to_cart(){ //fungsi Add To Cart
        $data = array(
            'id' => $this->input->post('produk_id'), 
            'name' => $this->input->post('produk_nama'), 
            'price' => $this->input->post('produk_harga'), 
            'qty' => $this->input->post('quantity'), 
        );
        $this->cart->insert($data);
        echo $this->show_cart(); //tampilkan cart setelah added
    }
 
    function show_cart(){ //Fungsi untuk menampilkan Cart
        $output = '';
        $no = 0;
        foreach ($this->cart->contents() as $items) {
            $no++;
            $output .='
                <tr>
                    <td>'.$items['name'].'</td>
                    <td>'.number_format($items['price']).'</td>
                    <td>'.$items['qty'].'</td>
                    <td>'.number_format($items['subtotal']).'</td>
                    <td><button type="button" id="'.$items['rowid'].'" class="hapus_cart btn btn-danger btn-xs">Batal</button></td>
                </tr>
            ';
        }
        $output .= '
            <tr>
                <th colspan="3">Total</th>
                <th colspan="2">'.'Rp '.number_format($this->cart->total()).'</th>
            </tr>
        ';
        return $output;
    }
 
    function load_cart(){ //load data cart
        echo $this->show_cart();
    }

    function submit(){
        $data1['idpembelian']=time();
        $data1['pembeli']="neni";
        $this->cart_model->submitpembelian($data1);

        foreach ($this->cart->contents() as $items) {
            $data2['idpembelian']=$data1['idpembelian'];
            $data2['produk_id']=$items['id'];
            $data2['produk_harga']=$items['price'];
            $data2['qty']=$items['qty'];
            $this->cart_model->submitdetailpembelian($data2);

            $data3 = array(
                'rowid' => $items['rowid'],
                'qty' => 0,
            );
            $this->cart->update($data3);
        }
        $this->load->view('v_submit');
    }
 
    function hapus_cart(){ //fungsi untuk menghapus item cart
        $data = array(
            'rowid' => $this->input->post('row_id'), 
            'qty' => 0, 
        );
        $this->cart->update($data);
        echo $this->show_cart();
    }
}