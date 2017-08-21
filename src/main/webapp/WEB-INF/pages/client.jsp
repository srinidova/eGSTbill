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
				<form id="clientForm">
				<fieldset>
							<legend>Client</legend>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">CompanyName</label> 
									<input class="form-control" id="companyName" name="companyName" type="text" placeholder="">
									<input type="hidden"
										class="form-control" id="clientId" name="clientId">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">PAN </label> 
									<input class="form-control" id="pan" name="pan" type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">GSTN </label> <input class="form-control" id="gstn" name="gstn"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Contact Person </label> <input class="form-control" id="contactPerson" name="contactPerson"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Mobile </label> <input class="form-control" id="mobile" name="mobile"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Email</label> <input class="form-control" id="email" name="email"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Address</label> 
									<!-- <input class="form-control" id="cgst" type="textArea" placeholder=""> -->
									<textarea class="form-control" rows="5" id="address" name="address" maxlength="250"></textarea>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">State</label> <!-- <input class="form-control" id="state"
										type="text" placeholder=""> -->
										<select class="form-control"
							id="state" name="state">
							<!-- <option selected="selected" >--select--</option> -->
							<option value="Andra Pradesh">Andra Pradesh</option>
							<option value="Arunachal Pradesh">Arunachal Pradesh</option>
							<option value="Assam">Assam</option>
							<option value="Bihar">Bihar</option>
							<option value="Chattisgarh">Chattisgarh</option>
							<option value="Goa">Goa</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachal Pradesh">Himachal Pradesh</option>
							<option value="Jammu Kashmir">Jammu Kashmir</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Madya Pradesh">Madya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Meghalaya">Meghalaya</option>
							<option value="Migoram">Migoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Odish">Odish</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamilnadu">Tamilnadu</option>
							<option value="Telangana">Telangana</option>
							<option value="Tripura">Tripura</option>
							<option value="Uttarpradesh">Uttarpradesh</option>
							<option value="Uttarakhand">Uttarakhand</option>
							<option value="Westbengal">Westbengal</option>
						</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Pin</label> <input class="form-control" id="pin" name="pin"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Account Number</label> <input class="form-control" id="accountNumber" name="accountNumber"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Bank</label> <input class="form-control" id="bank" name="bank"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Branch</label> <input class="form-control" id="branch" name="branch"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">IFSC Code</label> <input class="form-control" id="ifsc" name="ifsc"
										type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Terms</label> 
									<textarea class="form-control" rows="5" id="terms" name="terms" maxlength="250"></textarea>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Logo</label> 
									<input id="logPath" name="file" class="file form-control" type="file" >
								</div>
							</div>
							<div class="col-md-10">
								<div id="clientFrmMsg"
									style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
									Sucessfully</div>
							</div>
							<div class="col-md-3 pull-right">
								<div class="buttons">
									<ul>
										<li>
											<button class="btn btn-primary" id="btnClientSave" onClick="clientFormValidate();">Add</button>
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
						<div class="clearfix"></div>
				<div class="new_bill">
					<div class="col-md-12">
						<fieldset>
							<legend>Client List </legend>
							<div class="col-md-12">
								<div class="table-responsive">
									<table class=" table table-responsive table-bordered ">
										<thead>
											<tr>
												<th class="text-center">CompanyName</th>
												<th class="text-center">PAN</th>
												<th class="text-center">GSTN</th>
												<th class="text-center">Address</th>
												<th class="text-center">State</th>
												<th class="text-center">Pin</th>
												<th class="text-center">Contact Person</th>
												<th class="text-center">Mobile</th>
												<th class="text-center">Email</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody id="clientListData">
										</tbody>
									</table>
								</div>
							</div>
							</fieldset>
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
	console.log(lstOrders);
	$(document).ready(function() {
		showClientData(JSON.parse(lstOrders));

	}); 
	
	function addClient(){
		alert("in to add client");
		
		data = {};
		data["clientId"] = $("#clientId").val();
		data["companyName"] = $("#companyName").val();
		data["pan"] = $("#pan").val();
		data["gstn"] = $("#gstn").val();
		data["address"] = $("#address").val();
		data["state"] = $("#state").val();
		data["pin"] = $("#pin").val();
		data["contactPerson"] = $("#contactPerson").val();
		data["mobile"] = $("#mobile").val();
		data["email"] = $("#email").val();
		data["accountNumber"] = $("#accountNumber").val();
		data["bank"] = $("#bank").val();
		data["branch"] = $("#branch").val();
		data["ifsc"] = $("#ifsc").val();
		data["terms"] = $("terms").val();
		data["logPath"] = $("#logPath").val();
		alert("in to add client"+terms);
		alert("in to client "+accountNumber);
		alert("in to client "+bank);
		alert("in to client "+branch);
		alert("in to client "+ifsc);
		console.log(data);
		$.ajax({
			type : "POST",
			url : "addClient.htm",
			data : data,
			success : function(response) {
				resJSON = JSON.parse(response);
				if (response != null) {
					if (resJSON.status == "ERROR") {
						$("#clientFrmMsg").text(resJSON.message);
						$("#clientFrmMsg").show();
						$("#clientFrmMsg").fadeOut(15000);
						$("#clientFrmMsg").val("");
					} else {
						$("#clientFrmMsg").text('Client saved Sucessfully');
						$("#clientFrmMsg").show();
						$("#clientFrmMsg").fadeOut(15000);
						clientClear();
						showClientData(response);
					}

				}
			},
			error : function(e) {
				$("#btn-save").prop("disabled", false);
			}
		});
	}
	
	function showClientData(response) {
		alert("in to show client data");
		serviceUnitArray = {};
		var html = '';
		if (response != undefined && response.length > 0) {
			$
					.each(
							response,
							function(i, datObj) {
								serviceUnitArray[datObj.clientId] = datObj;
								html = html
										+ '<tr>'
										+ '<td class="text-center">'
										+ datObj.companyName
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.pan
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.gstn
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.address
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.state
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.pin
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.contactPerson
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.mobile
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.email
										+ '</td>'
										+ '<td class="text-center">'
										+ '<a id="'
										+ datObj.clientId
										+ '" class="btn btn-info btn-xs" onclick="editClient(this.id)">'
										+ '<span class="glyphicon glyphicon-edit"></span>'
										+ '</a>'
										+ '<a id="'
										+ datObj.clientId
										+ '" class="btn btn-danger btn-xs" onclick="deleteClient(this.id)">'
										+ '<span class="glyphicon glyphicon-remove"></span>'
										+ '</a>' + '</td>' + '</tr>'
							});
		}
		$('#clientListData').empty().append(html);
	}
	
	function deleteClient(id) {
		alert("in to client delete");
		var count = 0;
		$.ajax({
			type : "POST",
			url : "deleteClient.json",
			data : "clientId=" + id,
			success : function(response) {
				if (response != null) {
					$("#clientFrmMsg").text("Client deleted sucessfully");
					$("#clientFrmMsg").show();
					$("#clientFrmMsg").fadeOut(15000);
					showClientData(response);
				}
			},
			error : function(e) {
			}
		});
	}
	
	function editClient(clientId){
		alert("in to editClient==="+clientId);
		$('#btnClientSave').text("Update");
		$('#clientId').val(clientId);
		$('#companyName').val(serviceUnitArray[clientId].companyName);
		$('#pan').val(serviceUnitArray[clientId].pan);
		$('#gstn').val(serviceUnitArray[clientId].gstn);
		$('#address').val(serviceUnitArray[clientId].address);
		$('#state').val(serviceUnitArray[clientId].state);
		$('#pin').val(serviceUnitArray[clientId].pin);
		$('#contactPerson').val(serviceUnitArray[clientId].contactPerson);
		$('#mobile').val(serviceUnitArray[clientId].mobile);
		$('#email').val(serviceUnitArray[clientId].email);
		$('#accountNumber').val(serviceUnitArray[clientId].accountNumber);
		$('#bank').val(serviceUnitArray[clientId].bank);
		$('#branch').val(serviceUnitArray[clientId].branch);
		$('#ifsc').val(serviceUnitArray[clientId].ifsc);
	}
	
	function updateClient(){
		alert("in to update client");
		
		data = {};
		data["clientId"] = $("#clientId").val();
		data["companyName"] = $("#companyName").val();
		data["pan"] = $("#pan").val();
		data["gstn"] = $("#gstn").val();
		data["address"] = $("#address").val();
		data["state"] = $("#state").val();
		data["pin"] = $("#pin").val();
		data["contactPerson"] = $("#contactPerson").val();
		data["mobile"] = $("#mobile").val();
		data["email"] = $("#email").val();
		data["accountNumber"] = $("#accountNumber").val();
		data["bank"] = $("#bank").val();
		data["branch"] = $("#branch").val();
		data["ifsc"] = $("#ifsc").val();
		data["terms"] = $("terms").val();
		data["logPath"] = $("#logPath").val();
		var clientId = $("#clientId").val();
		$.ajax({
			type : "POST",
			url : "updateClient.htm",
			data : data,
			time : 1000,
			success : function(response) {
				$("#clientId").val("");
				data = {};
				resJSON = JSON.parse(response);
				if (response != null) {
					if (resJSON.status == "ERROR") {
						$("#clientFrmMsg").text(resJSON.message);
						$("#clientFrmMsg").show();
						$("#clientFrmMsg").fadeOut(15000);
					} else {
						$("#clientFrmMsg").text('Updated Sucessfully');
						$("#clientFrmMsg").show();
						$("#clientFrmMsg").fadeOut(15000);
						showClientData(resJSON);
					}
				}

			},
			error : function(e) {
				$("#btn-save").prop("disabled", false);
			}

		});
	}
	
	function clientFormValidate() {
		alert("in to clientFormValidation");
		if ($("#clientForm").valid()) {
			alert("in to client validate");
			var clientId = $("#clientId").val();
			if (clientId != "") {
				updateClient();
			} else {
				addClient();
			}
		}
	}
	function clientClear() {
		$("#clientForm")[0].reset();
		$('#btnClientSave').text("Add");
	}
	$("#clientForm")
	.validate(
			{
				rules : {

					companyName : {
						required : true,
						minlength : 2,
						alpha : true
					},
					pan : {
						required : true,

						number : true
					},
					gstn : {
						required : true,

						number : true
					},
					contactPerson : {
						required : true,
						minlength : 2,
						alpha : true
					},
					mobile : {
						required : true,

						number : true
					},
					email : {
						required: true,
						email: true
					},
					address : {
						required : true

					},
					
					pin : {
						required : true,

						number : true
					},
					terms : {
						
					},
					accountNumber : {
						required : true,

						number : true
					},
					bank : {
						required : true
					},
					branch : {
						required : true
					},
					ifsc : {
						required : true
					},
					
					
				},
				messages : {

					companyName : {
						required : "Please enter  CompanyName",
						minlength : "Your Name must consist of at least 2 characters",
						alpha : "only characters"
					},
					pan : {
						required : "Please enter Pan number",
						number : "Please enter numbers Only"
					},
					gstn : {
						required : "Please enter GSTN",
						number : "Please enter numbers Only"
					},
					contactPerson : {
						required : "Please enter  ContactPerson",
						minlength : "Your Name must consist of at least 2 characters",
						alpha : "only characters"
					},
					mobile : {
						required : "Please enter Mobile",
						number : "Please enter numbers Only"
					},
					mrp : {
						required : "Please enter Mrp",
						number : "Please enter numbers Only"
					},
					address : {
						required : "Please enter Address"
					},
					email: {
						
						required: "Please provide Email",
						email: "Please enter a valid email address"
					},
					pin : {
						required : "Please enter PIN",
						number : "Please enter numbers Only"
					},
					terms :{
						
					},
					accountNumber : {
						required : "Please enter Account Number",
						number : "Please enter numbers Only"
					},
					bank :{
						required : "please enter Bank Name"
					},
					branch :{
						required : "please enter Branch Name"
					},
					ifsc :{
						required : "please enter Ifsc Code"
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
