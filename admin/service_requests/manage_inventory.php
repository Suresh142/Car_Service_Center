<?php
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `inventory` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<div class="card card-outline card-info">
	<div class="card-header">
		<h3 class="card-title"><?php echo isset($id) ? "Update ": "Create New " ?> Inventory</h3>
	</div>
	<div class="card-body">
		<form action="" id="inventory-form">
			<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
			<div class="form-group">
				<label for="product_id" class="control-label">Product</label>
                <select name="product_id" id="product_id" class="custom-select select2" required>
                    <option value=""></option>
                    <?php
                        $qry = $conn->query("SELECT * FROM `products` order by title asc");
                        while($row= $qry->fetch_assoc()):
                            foreach($row as $k=> $v){
								$row[$k] = trim(stripslashes($v));
							}
                    ?>
                    <option value="<?php echo $row['id'] ?>" <?php echo isset($product_id) && $product_id == $row['id'] ? 'selected' : '' ?>><?php echo $row['title'] ?></option>
                    <?php endwhile; ?>
                </select>
			</div>
            <div class="form-group">
				<label for="quantity" class="control-label">Beginning Quanatity</label>
                <input type="number" class="form-control form" required name="quantity" value="<?php echo isset($quantity) ? $quantity : '' ?>">
            </div>
            <div class="form-group">
				<label for="price" class="control-label">Price</label>
                <input type="number" step="any" class="form-control form" required name="price" value="<?php echo isset($price) ? $price : '' ?>">
            </div>
		</form>
	</div>
	<div class="card-footer">
		<button class="btn btn-flat btn-primary" form="inventory-form">Save</button>
		<a class="btn btn-flat btn-default" href="?page=inventory">Cancel</a>
	</div>
</div>
<script>
    function displayImg(input,_this) {
        console.log(input.files)
        var fnames = []
        Object.keys(input.files).map(k=>{
            fnames.push(input.files[k].name)
        })
        _this.siblings('.custom-file-label').html(JSON.stringify(fnames))
	    
	}
	$(document).ready(function(){
        $('.select2').select2({placeholder:"Please Select here",width:"relative"})
		$('#inventory-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_inventory",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.href = "./?page=inventory";
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            $("html, body").animate({ scrollTop: _this.closest('.card').offset().top }, "fast");
                            end_loader()
                    }else{
						alert_toast("An error occured",'error');
						end_loader();
                        console.log(resp)
					}
				}
			})
		})

        $('.summernote').summernote({
		        height: 200,
		        toolbar: [
		            [ 'style', [ 'style' ] ],
		            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
		            [ 'fontname', [ 'fontname' ] ],
		            [ 'fontsize', [ 'fontsize' ] ],
		            [ 'color', [ 'color' ] ],
		            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
		            [ 'table', [ 'table' ] ],
		            [ 'view', [ 'undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]
		        ]
		    })
	})
</script>