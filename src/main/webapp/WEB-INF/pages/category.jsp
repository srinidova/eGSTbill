<!-- Includes Start-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>eGSTbill</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link href="css/eGSTbill/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/eGSTbill/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/eGSTbill/datetimepicker.css" rel="stylesheet" type="text/css">
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
				<!-- ADD SECTION START -->
				<form id="categoryForm">
				<fieldset>
							<legend>Category</legend>
							
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Category </label> 
									<input class="form-control" id="categoryName" name="categoryName" type="text" placeholder="">
									<input type="hidden"
										class="form-control" id="categoryId" name="categoryId">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Description</label> 
									<!-- <input class="form-control" type="text" id="description" name="description" placeholder="">  -->
									<textarea class="form-control" rows="5" id="description"
						name="description" maxlength="250"></textarea>
								</div>
							</div>
							
							
							<div class="col-md-10">
								<div id="categoryFrmMsg"
									style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
									Sucessfully</div>
							</div>
							<div class="col-md-3 pull-right">
								<div class="buttons">
									<ul>
										<li>
											<button class="btn btn-primary" id="btnClientSave" onClick="categoryFormValidation();">Add</button>
										</li>
										<li>
											<button class="btn btn-primary" name="clear" value="clear" onClick="clientClear();">clear</button>
										</li>
									</ul>
								</div>
							</div>
						</fieldset>
						</form>
				<!-- ADD SECTION END -->
				<div class="clearfix"></div>
				<!-- LIST SECTION START -->
				<div class="new_bill">
					<div class="col-md-12">
						<fieldset>
							<legend>List Products</legend>
							<div class="col-md-12">
								<div class="table-responsive">
									<table class=" table table-responsive table-bordered ">
										<thead>
											<tr>
												<th class="text-center">Category</th>
												<th class="text-center">Description</th>
												
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody id="categoryListData">
										</tbody>
									</table>
								</div>
							</div>
					</div>
				</div>
				<!-- LIST SECTION END -->
			</div>
		</div>
	</div>
	</div>
	<div class="clearfix"></div>
	<script type="text/javascript">
	
	var lstCategory ='${LISTCATEGORY}';
	console.log(lstCategory);
	$(document).ready(function() {
		if(lstCategory != undefined && lstCategory.length >0){
			showCategoryData(JSON.parse(lstCategory)); 
		}
		
		if(lstClients != undefined && lstClients.length >0){
			showClientData(JSON.parse(lstClients));
		}
		
		$('#state').click(function(e) {
	    	sortDropDownListByText("#state");
	    });

	}); 
	function categoryFormValidation(){
		alert("in to categoryFormValidation");
		if ($("#categoryForm").valid()) {
			//alert("in to shipping validate");
			var categoryId = $("#categoryId").val();
			if (categoryId != "") {
				updateCategory();
			} else {
				saveCategory();
			}
	}
	}
	
	$("#categoryForm")
	.validate(
			{
				rules : {

					categoryName : {
						required : true,
						minlength : 2,
						alpha : true,
					},
					description : {
						required : true,
					},
					
					
				},
				messages : {

					category : {
						required : "Please enter category",
						minlength : "Your Name must consist of at least 2 characters",
						alpha : "only characters"
					},
					description : {
						required : "Please enter the Description"
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
				highlight : function(element, errorClass,
						validClass) {
					$(element).parents(".col-sm-5").addClass(
							"has-error").removeClass("has-success");
				},
				unhighlight : function(element, errorClass,
						validClass) {
					$(element).parents(".col-sm-5").addClass(
							"has-success").removeClass("has-error");
				}

			});

$.validator.addMethod("alpha", function(value, element) {
return this.optional(element)
		|| value == value.match(/^[a-zA-Z\s]+$/);
});

function saveCategory(){
	alert("in to saveCategory");
	data = {};
	data["categoryId"] = $("#categoryId").val(); 
	data["description"] = $("#description").val();
	data["categoryName"] = $("#categoryName").val();
	alert("in to saveCategory");
	$.ajax({
		type : "POST",
		url : "saveCategory.htm",
		data : data,
		success : function(response) {
			resJSON = JSON.parse(response);
			if (response != null) {
				if (resJSON.status == "ERROR") {
					$("#categoryFrmMsg").text(resJSON.message);
					$("#categoryFrmMsg").show();
					$("#categoryFrmMsg").fadeOut(15000);
					$("#categoryFrmMsg").val("");
				} else {
					$("#categoryFrmMsg").text('Category saved Sucessfully');
					$("#categoryFrmMsg").show();
					$("#categoryFrmMsg").fadeOut(15000);
					showCategoryData(response);
				}

			}
		},
		error : function(e) {
			$("#btn-save").prop("disabled", false);
		}
	});
	
}

function showCategoryData(response){
	serviceUnitArrayCategory = {};
	var html = '';
	if(response != null && response.length > 0) {
		$
		.each(
				response,
				function(i, datObj) {
					serviceUnitArrayCategory[datObj.categoryId] = datObj;
					html = html
							+ '<tr>'
							+ '<td class="text-center">'
							+ datObj.categoryName
							+ '</td>'
							+ '<td class="text-center">'
							+ datObj.description
							+ '</td>'
							+ '<td class="text-center">'
							+ '<a id="'
							+ datObj.categoryId
							+ '" class="btn btn-info btn-xs" onclick="editCategory(this.id)">'
							+ '<span class="glyphicon glyphicon-edit"></span>'
							+ '</a>'
							+ '<a id="'
							+ datObj.categoryId
							+ '" class="btn btn-danger btn-xs" onclick="deleteCategory(this.id)">'
							+ '<span class="glyphicon glyphicon-remove"></span>'
							+ '</a>' + '</td>' + '</tr>'
		
	});
		$('#categoryListData').empty().append(html);
		//document.getElementById("categoryListData").innerHTML = html;
}
}
function editCategory(categoryId){
	$('#categoryId').val(categoryId);
	$('#categoryName').val(serviceUnitArrayCategory[categoryId].categoryName);
	$('#description').val(serviceUnitArrayCategory[categoryId].description);
}

function updateCategory(){
	
	data = {};
	data["categoryId"] = $("#categoryId").val(); 
	data["description"] = $("#description").val();
	data["categoryName"] = $("#categoryName").val();
	
	var categoryId = $("#categoryId").val();
	
	$.ajax({
		type : "POST",
		url : "updateCategory.htm",
		data : data,
		time : 1000,
		success : function(response) {
			$("#categoryId").val("");
			data = {};
			resJSON = JSON.parse(response);
			if (response != null) {
				if (resJSON.status == "ERROR") {
					$("#categoryFrmMsg").text(resJSON.message);
					$("#categoryFrmMsg").show();
					$("#categoryFrmMsg").fadeOut(15000);
				} else {
					$("#categoryFrmMsg").text('Updated Sucessfully');
					$("#categoryFrmMsg").show();
					$("#categoryFrmMsg").fadeOut(15000);
					showCategoryData(resJSON);
				}
			}

		},
		error : function(e) {
			$("#btn-save").prop("disabled", false);
		}

	});
	
}
function deleteCategory(id){
	var count = 0;
	$.ajax({
		type : "POST",
		url : "deleteCategory.json",
		data : "categoryId=" + id,
		success : function(response) {
			if (response != null) {
				$("#categoryFrmMsg").text("category deleted sucessfully");
				$("#categoryFrmMsg").show();
				$("#categoryFrmMsg").fadeOut(15000);
				showCategoryData(response);
			}
		},
		error : function(e) {
		}
	});
	
}
	</script>
</body>
</html>
