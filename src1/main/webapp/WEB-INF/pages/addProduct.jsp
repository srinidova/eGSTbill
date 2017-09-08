<!-- Includes Start-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>eGSTbill</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<link href="css/eGSTbill/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="css/eGSTbill/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="css/eGSTbill/datetimepicker.css" rel="stylesheet"
	type="text/css">
<link href="css/eGSTbill/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/product.js"></script>

</head>
<!-- Includes End-->
<body>
	<div class="clearfix"></div>
	<div id="body_content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form id="productForm">
						<fieldset>
							<legend>New Product</legend>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Product Name</label> <input class="form-control"
										type="text" id="productName" name="productName" placeholder=""
										maxlength="30"> <input type="hidden"
										class="form-control" id="productId" name="productId">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Product Type</label> <select id="productType"
										class="form-control">
										<option value="0">Nos</option>
										<option value="1">Mts</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">HSN</label> <input class="form-control"
										type="text" id="hsnCode" name="hsnCode" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">CGST</label> <input class="form-control"
										type="text" id="cgst" name="cgst" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">SGST</label> <input class="form-control"
										type="text" id="sgst" name="sgst" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">IGST</label> <input class="form-control"
										type="text" id="igst" name="igst" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Purchase Price</label> <input
										class="form-control" type="text" id="purchaserPrice"
										name="purchaserPrice" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">MRP</label> <input class="form-control"
										type="text" id="mrp" name="mrp" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Discount</label> <input class="form-control"
										type="text" id="discount" name="discount" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Quantity</label> <input class="form-control"
										type="text" id="quantity" name="quantity" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Sale Price</label> <input class="form-control"
										type="text" id="salePrice" name="salePrice" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">UOM</label> <input class="form-control"
										type="text" id="uom" name="uom" placeholder="">
								</div>
							</div>
							<div class="col-md-10">
								<div id="prodFrmMsg"
									style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
									Sucessfully</div>
							</div>
							<div class="col-md-3 pull-right">
								<div class="buttons">
									<ul>
										<li>
											<button type="button" id="btnProdSave" class="btn btn-primary " name="add"
												value="add" onClick="prodFormValidate();">Add</button>
										</li>
										<li>
											<button type="button" class="btn btn-primary" name="clear"
												value="clear" onClick="productClear();">Clear</button>
										</li>
									</ul>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="clearfix"></div>
				<div class="new_bill">
					<div class="col-md-12">
						<fieldset>
							<legend>List Products</legend>
							<div class="col-md-12">
								<div class="table-responsive">
									<table class=" table table-responsive table-bordered ">
										<thead>
											<tr>
												<th class="text-center">Product</th>
												<th class="text-center">HSN</th>
												<th class="text-center">Price</th>
												<th class="text-center">CGST</th>
												<th class="text-center">IGST</th>
												<th class="text-center">MRP</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody id="clientListData">
										</tbody>
									</table>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="clearfix"></div>
	<script type="text/javascript">
	var lstOrders ='${LISTPRODUCTS}';
	//console.log(lstOrders);
	$(document).ready(function() {
		showProductData(JSON.parse(lstOrders));
	}); 
	
	function prodFormValidate() {
		if ($("#productForm").valid()) {
			var productId = $("#productId").val();
			if (productId != "") {
				updateProduct();
				$('#btnProdSave').text("Add");
			} else {
				saveProduct();
			}
		}
	}
	
	$("#productForm")
	.validate(
			{
				rules : {

					productName : {
						required : true,
						minlength : 2,
						alpha : true
					},
					hsnCode : {
						required : true,

						number : true
					},
					uom : {
						required : true,

						number : true
					},
					quantity : {
						required : true,

						number : true
					},
					purchaserPrice : {
						required : true,

						number : true
					},
					mrp : {
						required : true,

						number : true
					},
					salePrice : {
						required : true,

						number : true
					},
					discount : {
						required : true,

						number : true
					},
					cgst : {
						required : true,

						number : true
					},
					sgst : {
						required : true,

						number : true
					},
					igst : {
						required : true,

						number : true
					},
				},
				messages : {

					productName : {
						required : "Please enter  ProductName",
						minlength : "Your Name must consist of at least 2 characters",
						alpha : "only characters"
					},
					hsnCode : {
						required : "Please enter hsnCode number",
						number : "Please enter numbers Only"
					},
					uom : {
						required : "Please enter Uom",
						number : "Please enter numbers Only"
					},
					quantity : {
						required : "Please enter quantity",
						number : "Please enter numbers Only"
					},
					purchaserPrice : {
						required : "Please enter Purchaser Price",
						number : "Please enter numbers Only"
					},
					mrp : {
						required : "Please enter Mrp",
						number : "Please enter numbers Only"
					},
					salePrice : {
						required : "Please enter SalePrice",
						number : "Please enter numbers Only"
					},
					discount : {
						required : "Please enter Discount",
						number : "Please enter numbers Only"
					},
					cgst : {
						required : "Please enter CGST",
						number : "Please enter numbers Only"
					},
					sgst : {
						required : "Please enter SGST",
						number : "Please enter numbers Only"
					},
					igst : {
						required : "Please enter IGST",
						number : "Please enter numbers Only"
					},
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					error.addClass("help-block");

					if (element.prop("type") === "checkbox") {
						error.insertAfter(element.parent("label"));
					} else {
						error.insertAfter(element);
					}
				},
				highlight : function(element, errorClass, validClass) {
					$(element).parents(".col-sm-5").addClass("has-error")
							.removeClass("has-success");
				},
				unhighlight : function(element, errorClass, validClass) {
					$(element).parents(".col-sm-5").addClass("has-success")
							.removeClass("has-error");
				}
			});
$.validator.addMethod("alpha", function(value, element) {
return this.optional(element) || value == value.match(/^[a-zA-Z\s]+$/);
});
	</script>
</body>
</html>
