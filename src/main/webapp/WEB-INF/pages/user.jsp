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
				<div class="col-md-12">
					<form id="userForm">
						<fieldset>
							<legend>User</legend>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Client</label> <select id="clientId" class="form-control" onchange="populateClientData();">
									</select>
									 <input type="hidden" class="form-control" id="companyName" name="companyName">
									 <input type="hidden" class="form-control" id="userId" name="userId">
									 <!-- <input  type="hidden" id="billCartId" name="billCartId"> -->
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Role</label> <select id="role" name="role"
										class="form-control">
										<option value="Admin">Admin</option>
										<option value="Manager">Manager</option>
										<option value="Employee">Employee</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Name</label> <input class="form-control"
										type="text" id="userName" name="userName" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Mobile</label> <input class="form-control"
										type="text" id="mobile" name="mobile" placeholder="" maxlength="10">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Email</label> <input class="form-control"
										type="text" id="email" name="email" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Address</label>
									<!-- <input class="form-control" type="text" id="address" name="address" placeholder="">  -->
									<textarea class="form-control" rows="5" id="address"
						name="address" maxlength="250"></textarea>
								</div>
							</div>
							<div class="col-md-10">
								<div id="userFrmMsg"
									style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
									Sucessfully</div>
							</div>
							<div class="col-md-3 pull-right">
								<div class="buttons">
									<ul>
										<li>
											<button type="button" id="btnUserSave" class="btn btn-primary " name="add"
												value="add" onClick="userFormValidate();">Add</button>
										</li>
										<li>
											<button type="button" class="btn btn-primary" name="clear"
												value="clear" onClick="userClear();">Clear</button>
										</li>
									</ul>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<!-- ADD SECTION END -->
				<div class="clearfix"></div>
				<!-- LIST SECTION START -->
				<div class="new_bill">
					<div class="col-md-12">
						<fieldset>
							<legend>List Users</legend>
							<div class="col-md-12">
								<div class="table-responsive">
									<table class=" table table-responsive table-bordered ">
										<thead>
											<tr>
												<!-- <th class="text-center">Company Name</th> -->
												<th class="text-center">Name</th>
												<th class="text-center">Role</th>
												<th class="text-center">Mobile</th>
												<th class="text-center">Email</th>
												<th class="text-center">Address</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody id="userListData">
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

	
	var lstOrders ='${LISTCLIENTS}';
	var lstUsers ='${LISTUSERS}';
	var lstClients ='${LISTCLIENTS}';
	var sClientId = '${CLIENTID}';
	
	$(document).ready(function() {
		showClientData(JSON.parse(lstOrders));
		//alert("===ready====");
		//showBilldata(JSON.parse(lstBillCart))
		showUserData(JSON.parse(lstUsers));

	});
	
	function showClientData(response) {
		serviceUnitArray = {};
		var html = "<option value=''>-- Select --</option>";
		if (response != undefined && response.length > 0) {
			$.each(response, function(i, datObj) {
				serviceUnitArray[datObj.clientId] = datObj;
				html = html + '<option value="' + datObj.clientId + '">'
						+ datObj.companyName + '</option>';
			});
		}
		$('#clientId').empty().append(html);
		//console.log("=========="+serviceUnitArray);
	}
	
	function populateClientData(clientId) {
		//console.log("=====pop====="+serviceUnitArray);
		//alert("in to populateProdData=========="+serviceUnitArray);
		var clientId = $('#clientId').val();
		$('#companyName').val(serviceUnitArray[productId].companyName);
		
	}
	function addUser(){
		//alert("in to add User");
		data = {};
		data["companyName"] = $("#companyName").val();
		data["userId"] = $("#userId").val();
		data["clientId"] = $("#clientId").val();
		data["role"] = $("#role").val();
		data["userName"] = $("#userName").val();
		data["mobile"] = $("#mobile").val();
		data["email"] = $("#email").val();
		data["address"] = $("#address").val();
		
		$.ajax({
			type : "POST",
			url : "addUser.htm",
			data : data,
			success : function(response) {
				resJSON = JSON.parse(response);
				if (response != null) {
					if (resJSON.status == "ERROR") {
						$("#userFrmMsg").text(resJSON.message);
						$("#userFrmMsg").show();
						$("#userFrmMsg").fadeOut(15000);
						$("#userFrmMsg").val("");
					} else {
						$("#userFrmMsg").text('User saved Sucessfully');
						$("#userFrmMsg").show();
						$("#userFrmMsg").fadeOut(15000);
						userClear();
						showUserData(response);
					}

				}
			},
			error : function(e) {
				$("#btn-save").prop("disabled", false);
			}
		});
	}
	function showUserData(response) {
		serviceUnitArrayUser = {};
		var html = '';
		if (response != undefined && response.length > 0) {
			$
					.each(
							response,
							function(i, datObj) {
								serviceUnitArrayUser[datObj.userId] = datObj;
								html = html
										+ '<tr>'
										/* + '<td class="text-center">'
										+ datObj.companyName
										+ '</td>' */
										+ '<td class="text-center">'
										+ datObj.userName
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.role
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.mobile
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.email
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.address
										+ '</td>'
										+ '<td class="text-center">'
										+ '<a id="'
										+ datObj.userId
										+ '" class="btn btn-info btn-xs" onclick="editUser(this.id)">'
										+ '<span class="glyphicon glyphicon-edit"></span>'
										+ '</a>'
										+ '<a id="'
										+ datObj.userId
										+ '" class="btn btn-danger btn-xs" onclick="deleteUser(this.id)">'
										+ '<span class="glyphicon glyphicon-remove"></span>'
										+ '</a>' + '</td>' + '</tr>'
							});
		}
		$('#userListData').empty().append(html);
	}
	
	function editUser(userId) {
		//alert("in to edit user "+userId);
		$('#btnUserSave').text("Update");
		$('#userId').val(userId);
		$('#companyName').val(serviceUnitArrayUser[userId].companyName);
		$('#role').val(serviceUnitArrayUser[userId].role);
		$('#userName').val(serviceUnitArrayUser[userId].userName);
		$('#mobile').val(serviceUnitArrayUser[userId].mobile);
		$('#email').val(serviceUnitArrayUser[userId].email);
		$('#address').val(serviceUnitArrayUser[userId].address);
	}
	
	function deleteUser(id) {
		//alert("in to delete==="+id);
		var count = 0;
		$.ajax({
			type : "POST",
			url : "deleteUser.json",
			data : "userId=" + id,
			success : function(response) {
				if (response != null) {
					$("#userFrmMsg").text("User deleted sucessfully");
					$("#userFrmMsg").show();
					$("#userFrmMsg").fadeOut(15000);
					showUserData(response);
				}
			},
			error : function(e) {
			}
		});
	}
	function updateUser(userId){
		//alert("in to update user===");
		data = {};
		data["companyName"] = $("#companyName").val();
		data["userId"] = $("#userId").val();
		data["role"] = $("#role").val();
		data["userName"] = $("#userName").val();
		data["mobile"] = $("#mobile").val();
		data["email"] = $("#email").val();
		data["address"] = $("#address").val();
		var userId = $("#userId").val();
		$.ajax({
			type : "POST",
			url : "updateUser.htm",
			data : data,
			time : 1000,
			success : function(response) {
				$("#userId").val("");
				data = {};
				resJSON = JSON.parse(response);
				if (response != null) {
					if (resJSON.status == "ERROR") {
						$("#userFrmMsg").text(resJSON.message);
						$("#userFrmMsg").show();
						$("#userFrmMsg").fadeOut(15000);
					} else {
						$("#userFrmMsg").text('Updated Sucessfully');
						$("#userFrmMsg").show();
						$("#userFrmMsg").fadeOut(15000);
						productClear();
						showUserData(resJSON);
					}
				}

			},
			error : function(e) {
				$("#btn-save").prop("disabled", false);
			}

		});
	}
	function userFormValidate() {
		//alert("in to userFormValidation");
		if ($("#userForm").valid()) {
			//alert("in to client validate");
			var userId = $("#userId").val();
			if (userId != "") {
				updateUser();
			} else {
				addUser();
			}
	}
	}
	function userClear() {
		$("#userForm")[0].reset();
		$("#userForm").data('validator').resetForm();
	}
	$("#userForm")
	.validate(
			{
				rules : {

					 companyName : {
						required : true,
						minlength : 2,
						alpha : true
					}, 
					role : {
						required : true

						
					},
					userName : {
						required : true,
						minlength : 2,
						alpha : true
					},
					mobile : {
						required : true,
						minlength : 10,
						maxlength : 10,
						number : true
					},
					email : {
						required : true,

						email : true
					},
					address : {
						required : true

						
					},
				},
				messages : {

					companyName : {
						required : "Please enter  ProductName",
						minlength : "Your Name must consist of at least 2 characters",
						alpha : "only characters"
					}, 
					role : {
						required : "Please enter Role "
						
					},
					userName : {
						required : "Please enter  UserName",
						minlength : "Your Name must consist of at least 2 characters",
						alpha : "only characters"
					},
					mobile : {
						
						required: "Please provide Mobile number",
						number:"Please enter numbers Only",
						minlength: "Your mobile must be at least 10 characters long"
						
					},
					email: {
						
						required: "Please provide Email",
						email: "Please enter a valid email address"
					},
					address: {
						
						required: "Please provide Address"
						
					},
					purState : {
						required : {
							depends : function(element) {
								if ('none' == $('#purState').val()) {
									$('#purState').val('');
								}
								return true;
							}
						},
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
