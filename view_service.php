<?php 
require_once('config.php');
$qry = $conn->query("SELECT * FROM `service_list` where id = '{$_GET['id']}'");
foreach($qry->fetch_array() as $k => $v){
    $$k = $v;
}
?>
<style>
    #uni_modal .modal-footer{
        display:none
    }
</style>
<div class="container-fluid">
    <dl>
        <dt><?php echo $service ?></dt>
        <dd><?php echo html_entity_decode(stripslashes($description)) ?></dd>
    </dl>
    <div class="w-100 d-flex justify-content-end mx-2">
        <div class="col-auto">
            <button class="btn btn-dark btn-sm rounded-0" type="button" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>