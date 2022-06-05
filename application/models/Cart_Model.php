<?php
class Cart_model extends CI_Model{
 
    function get_all_produk(){
        $hasil=$this->db->get('tbl_produk');
        return $hasil->result();
    }
    function submitpembelian($data){
        $this->db->insert('pembelian', $data);
        } 
    function submitdetailpembelian($data){
        $this->db->insert('detail_pembelian', $data);
        } 
}