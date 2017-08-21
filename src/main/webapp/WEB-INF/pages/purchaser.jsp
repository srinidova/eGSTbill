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
<!-- <script type="text/javascript" src="js/purchaser.js"></script> -->

</head>
<!-- Includes End-->
<body>
	<div class="clearfix"></div>
	<div id="body_content">
		<div class="container">
			<div class="row">
				<!-- ADD SECTION START -->
				<div class="col-md-12">
					<form id="purchaserForm">
						<fieldset>
							<legend>New Purchaser</legend>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Company Name<sup>*</sup></label> <input
										class="form-control" type="text" id="companyName"
										name="companyName" placeholder="" maxlength="30"> <input
										type="hidden" class="form-control" id="purchaserId"
										name="purchaserId">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">PAN<sup>*</sup></label> <input
										class="form-control" type="text" id="panNo" name="panNo"
										maxlength="15" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">GSTN NO<sup>*</sup></label> <input
										class="form-control" type="text" id="gstnNo" name="gstnNo"
										maxlength="15" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Address<sup>*</sup></label>
									<textarea class="form-control" id="purchaserAddress"
										name="purchaserAddress" placeholder=""> </textarea>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">State<sup>*</sup></label> <select
										class="form-control" id="purState" name="purState">
										<option value="">-- Select --</option>
										<option value="37">37 -- AP -- Andhra Pradesh</option>
										<option value="12">12 -- AR -- Arunachal Pradesh</option>
										<option value="18">18 -- AS -- Assam</option>
										<option value="10">10 -- BH -- Bihar</option>
										<option value="22">22 -- CT -- Chattisgarh</option>
										<option value="30">30 -- GA -- Goa</option>
										<option value="24">24 -- GJ -- Gujarat</option>
										<option value="06">06 -- HR -- Haryana</option>
										<option value="02">02 -- HP -- Himachal Pradesh</option>
										<option value="01">01 -- JK -- Jammu Kashmir</option>
										<option value="20">20 -- JH -- Jharkhand</option>
										<option value="29">29 -- KA -- Karnataka</option>
										<option value="32">32 -- KL -- Kerala</option>
										<option value="23">23 -- MP -- Madya Pradesh</option>
										<option value="27">27 -- MH -- Maharashtra</option>
										<option value="14">14 -- MN -- Manipur</option>
										<option value="17">17 -- ME -- Meghalaya</option>
										<option value="15">15 -- MI -- Migoram</option>
										<option value="13">13 -- NL -- Nagaland</option>
										<option value="21">21 -- OR -- Odisha</option>
										<option value="03">03 -- PB -- Punjab</option>
										<option value="08">08 -- RJ -- Rajasthan</option>
										<option value="11">11 -- SK -- Sikkim</option>
										<option value="33">33 -- TN -- Tamilnadu</option>
										<option value="36">36 -- TS -- Telangana</option>
										<option value="16">16 -- TR -- Tripura</option>
										<option value="09">09 -- UT -- Uttar Pradesh</option>
										<option value="05">05 -- UT -- Uttarakhand</option>
										<option value="19">19 -- WB -- Westbengal</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Pincode</label> <input class="form-control"
										type="text" maxlength="6" id="purchaserPincode"
										name="purchaserPincode" placeholder=""></input>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Contact Person<sup>*</sup></label> <input
										class="form-control" type="text" id="contactName"
										name="contactName" placeholder="" maxlength="30">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Mobile Number<sup>*</sup></label> <input
										class="form-control" type="text" id="purchaserMobileNo"
										name="purchaserMobileNo" maxlength="10" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Email ID</label> <input class="form-control"
										type="email" id="purchaserEmail" name="purchaserEmail"
										placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Client</label> <select id="clientId" class="form-control" onchange="populateClientData();">
									</select>
									 <input type="hidden" class="form-control" id="companyName" name="companyName">
									<!--  <input type="hidden" class="form-control" id="userId" name="userId"> -->
									 <!-- <input  type="hidden" id="billCartId" name="billCartId"> -->
								</div>
							</div>
							<div class="col-md-10">
								<div id="purchaseFrmMsg"
									style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
									Sucessfully</div>
							</div>



							<div class="col-md-3 pull-right">
								<div class="buttons">
									<ul>
										<li>
											<button type="button" id="btnPurchaseSave"
												class="btn btn-primary " name="addPurchaser"
												value="addPurchaser" onClick="purchaseFormValidate();">Add</button>
										</li>
										<li>
											<button type="button" class="btn btn-primary" name="clear"
												value="clear" onClick="purchaseClear();">Clear</button>
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
							<legend>List Purchasers</legend>
							<div class="col-md-12">
								<div class="table-responsive">
									<table class=" table table-responsive table-bordered ">
										<thead>
											<tr>
												<th class="text-center">Company Name</th>
												<th class="text-center">GSTN</th>
												<th class="text-center">Contact Person</th>
												<th class="text-center">Mobile</th>
												<th class="text-center">Email</th>
												<th class="text-center">Address</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody id="purchaserListData">
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

	<div class="clearfix"></div>
	<script type="text/javascript">
		var lstPurchasers = '${LISTPURCHASERS}';
		var lstOrders ='${LISTCLIENTS}';
		$(document).ready(function() {
			//LISTPURCHASERS

			showPurchaseData(JSON.parse(lstPurchasers));
			showClientData(JSON.parse(lstOrders));

		});

		function purchaseClear() {
			$("#purchaserForm")[0].reset();
			$("#purchaserForm").data('validator').resetForm();
		}
		function purchaseFormValidate() {
			if ($("#purchaserForm").valid()) {
				alert("gstnNo........"+$("#gstnNo").val().substring(0,2));
				$("#purState").change(function(){ 
			        var element = $(this).find('option:selected').attr("value"); 
			    }); 
				//alert("state code......"+element);
				var purchaseId = $("#purchaserId").val();
				if (purchaseId != "") {
					alert("hello update=========" + purchaseId);
					updatePurchaser(purchaseId);
					$('#btnPurchaseSave').text("Add");
				} else {
					//alert("--------inside else---------");
					savePurchaser();
				}
			}
		}
	
		$("#purchaserForm")
				.validate(
						{
							rules : {

								companyName : {
									required : true,
									minlength : 2,
									alpha : true
								},
								panNo : {
									required : true,
								},
								gstnNo : {
									required : true,
								},
								purchaserAddress : {
									required : true,
									minlength : 10
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
								purchaserPincode : {
									required : true,
									number : true,
									minlength : 6,
									maxlength : 6
								},
								contactName : {
									required : true,
									minlength : 2,
									alpha : true
								},
								purchaserMobileNo : {
									required : true,
									minlength : 10,
									maxlength : 10,
									number : true
								},
								purchaserEmail : {
									required : true,
									email : true
								},

							},
							messages : {

								companyName : {
									required : "Please enter Name",
									minlength : "Your Name must consist of at least 2 characters",
									alpha : "only characters"
								},
								panNo : {
									required : "Please enter the PAN number"
								},
								gstnNo : {
									required : "Please enter GSTN Number",
								},
								purchaserAddress : {
									required : "Please enter Address",
									minlength : "Please enter atleast 10 characters"
								},
								purState : {
									required : "Please select an state",

								},
								purchaserPincode : {
									required : "Please enter pincode",
									number : "Please enter numbers Only",
									minlength : "Please enter 6 digit number only",
									maxlength : "Please enter 6 digit number only"
								},
								contactName : {
									required : "Please enter Name",
									minlength : "Your Name must consist of at least 2 characters",
									alpha : "only characters"
								},
								purchaserMobileNo : {
									required : "Please enter mobile number",
									minlength : "Please enter valid mobile number",
									maxlength : "Please enter valid mobile number",
									number : "Please enter numbers only"
								},
								purchaserEmail : {
									required : "Please enter Email Id",

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
		function savePurchaser() {
			//alert("inside savePurchaser");
			purchaserData = {};
			purchaserData["purchaserId"] = $("#purchaserId").val();
			purchaserData["clientId"] = $("#clientId").val();
			purchaserData["companyName"] = $("#companyName").val();
			purchaserData["panNumber"] = $("#panNo").val();
			purchaserData["gstNumber"] = $("#gstnNo").val();
			purchaserData["address"] = $("#purchaserAddress").val();
			purchaserData["state"] = $("#purState").val();
			purchaserData["pincode"] = $("#purchaserPincode").val();
			purchaserData["contactName"] = $("#contactName").val();
			purchaserData["mobileNo"] = $("#purchaserMobileNo").val();
			purchaserData["emailID"] = $("#purchaserEmail").val();
			//alert("purchase data"+purchaserData)
			alert("in to save purchaser ==="+clientId);
			console.log(clientId);
			$.ajax({
				type : "POST",
				url : "addPurchase.htm",
				data : purchaserData,
				success : function(response) {
					purchaseClear();
					$("#purchaseFrmMsg").text('Purchaser saved Sucessfully');
					$("#purchaseFrmMsg").show();
					$("#purchaseFrmMsg").fadeOut(15000);
					resJSON = JSON.parse(response);
					showPurchaseData(resJSON);

				},
				error : function(e) {
					$("#btn-save").prop("disabled", false);
				}
			});
		}
		function showPurchaseData(response) {
			//alert("inside showpurchase data========"+response);
			serviceUnitArrayPurchaser = {};
			var html = '';
			if (response != undefined && response.length > 0) {
				$
						.each(
								response,
								function(i, datObj) {
									serviceUnitArrayPurchaser[datObj.purchaserId] = datObj;
									html = html
											+ '<tr>'
											+ '<td class="text-center">'
											+ datObj.companyName
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.gstNumber
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.contactName
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.mobileNo
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.emailID
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.address
											+ '</td>'
											+ '<td class="text-center">'
											+ '<a id="'
											+ datObj.purchaserId
											+ '" class="btn btn-info btn-xs" onclick="editPurchaser(this.id)">'
											+ '<span class="glyphicon glyphicon-edit"></span>'
											+ '</a>'
											+ '<a id="'
											+ datObj.purchaserId
											+ '" class="btn btn-danger btn-xs" onclick="deletePurchaser(this.id)">'
											+ '<span class="glyphicon glyphicon-remove"></span>'
											+ '</a>' + '</td>' + '</tr>'
								});
			}
			$('#purchaserListData').empty().append(html);
		}
		function deletePurchaser(purchaserId) {
			alert("inside delete");
			$.ajax({
				type : "POST",
				url : "deletePurchaser.json",
				data : "purchaserId=" + purchaserId,
				success : function(response) {
					if (response != null) {
						$("#purchaseFrmMsg").text(
								"Purchaser deleted sucessfully");
						$("#purchaseFrmMsg").show();
						$("#purchaseFrmMsg").fadeOut(15000);
						showPurchaseData(response);
					}
				},
				error : function(e) {
				}
			})

		}
		function editPurchaser(purchaserId) {
			alert("inside edit");
			$('#purchaserId').val(purchaserId);
			$('#companyName').val(serviceUnitArrayPurchaser[purchaserId].companyName);
			$('#panNo').val(serviceUnitArrayPurchaser[purchaserId].panNumber);
			$('#gstnNo').val(serviceUnitArrayPurchaser[purchaserId].gstNumber);
			$('#purchaserAddress').val(serviceUnitArrayPurchaser[purchaserId].address);
			$('#purState').val(serviceUnitArrayPurchaser[purchaserId].state);
			$('#purchaserPincode').val(serviceUnitArrayPurchaser[purchaserId].pincode);
			$('#contactName').val(serviceUnitArrayPurchaser[purchaserId].contactName);
			$('#purchaserMobileNo').val(serviceUnitArrayPurchaser[purchaserId].mobileNo);
			$('#purchaserEmail').val(serviceUnitArrayPurchaser[purchaserId].emailID);
		}

		 function updatePurchaser(purchaserId) {
			 alert("inside update jsp purchaser==========="+purchaserId);
			 	data = {};
			 	data["purchaserId"] = purchaserId;
				data["companyName"] = $("#companyName").val();
				data["panNumber"] = $("#panNo").val();
				data["gstNumber"] = $("#gstnNo").val();
				data["address"] = $("#purchaserAddress").val();
				data["state"] = $("#purState").val();
				data["pincode"] = $("#purchaserPincode").val();
				data["contactName"] = $("#contactName").val();
				data["mobileNo"] = $("#purchaserMobileNo").val();
				data["emailID"] = $("#purchaserEmail").val();
				//var purchaserId = $("#purchaserId").val();
			alert("panno id in update jsp..............");
			$.ajax({
				type : "POST",
				url : "updatePurchaser.htm",
				data : data,
				time : 1000,
				success : function(response) {
					$("#purchaserId").val("");
					data = {};
					resJSON = JSON.parse(response);
					if (response != null) {
							purchaseClear();
							showPurchaseData(resJSON);
						
					}

				},
				error : function(e) {
					$("#btn-save").prop("disabled", false);
				}

			});
		} 
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
				//$('#companyName').val(serviceUnitArray[clientId].companyName);
				
			}
	</script>
</body>
</html>
