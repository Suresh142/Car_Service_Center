<?php
require_once('../config.php');
Class Master extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;
		parent::__construct();
	}
	public function __destruct(){
		parent::__destruct();
	}
	function capture_err(){
		if(!$this->conn->error)
			return false;
		else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
			return json_encode($resp);
			exit;
		}
	}
	function save_category(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id','description'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if(isset($_POST['description'])){
			if(!empty($data)) $data .=",";
				$data .= " `description`='".addslashes(htmlentities($description))."' ";
		}
		$check = $this->conn->query("SELECT * FROM `categories` where `category` = '{$category}' ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Category already exist.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$sql = "INSERT INTO `categories` set {$data} ";
			$save = $this->conn->query($sql);
		}else{
			$sql = "UPDATE `categories` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Category successfully saved.");
			else
				$this->settings->set_flashdata('success',"Category successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_category(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `categories` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Category successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_service(){
		extract($_POST);
		$data = "";
		$_POST['description'] = addslashes(htmlentities($description));
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `service_list` where `service` = '{$service}' ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Service already exist.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$sql = "INSERT INTO `service_list` set {$data} ";
			$save = $this->conn->query($sql);
		}else{
			$sql = "UPDATE `service_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Service successfully saved.");
			else
				$this->settings->set_flashdata('success',"Service successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_service(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `service_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Service successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_mechanic(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `mechanics_list` where `name` = '{$name}' ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Mechanic already exist.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$sql = "INSERT INTO `mechanics_list` set {$data} ";
			$save = $this->conn->query($sql);
		}else{
			$sql = "UPDATE `mechanics_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Mechanic successfully saved.");
			else
				$this->settings->set_flashdata('success',"Mechanic successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_mechanic(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `mechanics_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Mechanic successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_request(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k=> $v){
			if(in_array($k,array('owner_name','category_id','service_type','mechanic_id','status'))){
				if(!empty($data)){ $data .= ", "; }

				$data .= " `{$k}` = '{$v}'";

			}
		}
		if(empty($id)){
			$sql = "INSERT INTO `service_requests` set {$data} ";
		}else{
			$sql = "UPDATE `service_requests` set {$data} where id ='{$id}' ";
		}
		$save = $this->conn->query($sql);
		if($save){
			$rid = empty($id) ? $this->conn->insert_id : $id ;
			$data = "";
			foreach($_POST as $k=> $v){
				if(!in_array($k,array('id','owner_name','category_id','service_type','mechanic_id','status'))){
					if(!empty($data)){ $data .= ", "; }
					if(is_array($_POST[$k]))
					$v = implode(",",$_POST[$k]);
					$v = $this->conn->real_escape_string($v);
					$data .= "('{$rid}','{$k}','{$v}')";
				}
			}
			$sql = "INSERT INTO `request_meta` (`request_id`,`meta_field`,`meta_value`) VALUES {$data} ";
			$this->conn->query("DELETE FROM `request_meta` where `request_id` = '{$rid}' ");
			$save = $this->conn->query($sql);
			if($save){
				$resp['status'] = 'success';
				$resp['id'] = $rid;
			}else{
				$resp['status'] = 'failed';
				$resp['msg'] = $this->conn->error;
				$resp['sql'] = $sql;
			}

		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = $this->conn->error;
			$resp['sql'] = $sql;
		}

		return json_encode($resp);
	}
	function delete_request(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `service_requests` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Request successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
}

$Master = new Master();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$sysset = new SystemSettings();
switch ($action) {
	case 'save_category':
		echo $Master->save_category();
	break;
	case 'delete_category':
		echo $Master->delete_category();
	break;
	case 'save_service':
		echo $Master->save_service();
	break;
	case 'delete_service':
		echo $Master->delete_service();
	break;
	case 'save_mechanic':
		echo $Master->save_mechanic();
	break;
	case 'delete_mechanic':
		echo $Master->delete_mechanic();
	break;
	case 'save_request':
		echo $Master->save_request();
	break;
	case 'delete_request':
		echo $Master->delete_request();
	break;
	default:
		// echo $sysset->index();
		break;
}