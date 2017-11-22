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
					<form id="vendorForm">
						<fieldset>
							<legend>New Vendors</legend>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Client</label> <select id="clientId" class="form-control" onchange="populatePurchaserSelect();">
									</select>
									 <!-- input type="hidden" class="form-control" id="companyName" name="companyName"-->
								</div>
							</div>							
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Company Name<sup>*</sup></label> <input
										class="form-control" type="text" id="companyName"
										name="companyName" placeholder="" maxlength="30"> <input
										type="hidden" class="form-control" id="vendorId"
										name="vendorId">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">GSTN<sup>*</sup></label> <input
										class="form-control" type="text" id="gstn" name="gstn"
										maxlength="15" placeholder="" >
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Address<sup>*</sup></label>
									<input class="form-control" type="text" id="address" name="address" placeholder=""> 
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">State<sup>*</sup></label> 
									<select class="form-control" id="state" name="state" >
										
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Pincode</label> <input class="form-control"
										type="text" maxlength="6" id="pincode"
										name="pincode" placeholder=""></input>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Contact Person<sup>*</sup></label> <input
										class="form-control" type="text" id="contactPerson"
										name="contactPerson" placeholder="" maxlength="30">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Mobile Number<sup>*</sup></label> <input
										class="form-control" type="text" id="mobile"
										name="mobileNo" maxlength="10" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Email ID</label> <input class="form-control"
										type="email" id="email" name="email"
										placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">PAN<sup>*</sup></label> <input
										class="form-control" type="text" id="pan" name="pan"
										maxlength="15" placeholder="" >
								</div>
							</div>							
							<div class="col-md-10">
								<div id="vendorFrmMsg"
									style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
									Sucessfully</div>
							</div>



							<div class="col-md-3 pull-right">
								<div class="buttons">
									<ul>
										<li>
											<button type="button" id="btnVendorSave"
												class="btn btn-primary " name="saveVendor"
												value="saveVendor" onClick="vendorFormValidate();">Add</button>
										</li>
										<li>
											<button type="button" class="btn btn-primary" name="clear"
												value="clear" onClick="vendorClear();">Clear</button>
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
							<legend>List Vendors</legend>
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
										<tbody id="vendorListData">
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
		var lstStates = '${ALLSTATES}';
		var lstClients ='${LISTCLIENTS}';
		var lstPurchasers = '${LISTPURCHASERS}';
		var sClientId = '${CLIENTID}';
		
		var lstVendor = '${LISTVENDORS}';
		
		console.log(lstVendor);
		
		
		//console.log(lstStates)
		//console.log(lstClients);
		/* console.log(sClientId);
		console.log(lstPurchasers); */
		
		
		$(document).ready(function() {
			//alert("in to vendor page");
			if(lstStates != undefined && lstStates.length >0){
				showStatesData(JSON.parse(lstStates)); 
			}
			if(lstClients != undefined && lstClients.length >0){
				showClientData(JSON.parse(lstClients));
				//alert("sClientId=="+sClientId);
				$('#clientId').val(sClientId);
				//populatePurchaserSelect() ;
			}

			if(lstVendor != undefined && lstVendor.length >0){
				showVendorData(JSON.parse(lstVendor));
			}
			
			$('#state').click(function(e) {
		    	sortDropDownListByText("#state");
		    });
			
			
			
		});

		function vendorFormValidate() {
			//alert("in to vendor")
			if ($("#vendorForm").valid()) {
				var vendorId = $("#vendorId").val();
				if (vendorId != "") {
					////alert("hello update=========" + purchaseId);
					updateVendor(vendorId);
					$('#btnVendorSave').text("Add");
				} else {
					//////alert("--------inside else---------");
					addVendor();
				}
			}
		}
	
		$("#vendorForm")
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
								},
								 gstn : {
									minlength : 15,
									maxlength : 15,
									required : true
								}, 
								address : {
									required : true,
									minlength : 10
								},
								state : {
									required : {
										depends : function(element) {
											if ('none' == $('#state').val()) {
												$('#state').val('');
											}
											return true;
										}
									},
								},
								pincode : {
									required : true,
									number : true,
									minlength : 6,
									maxlength : 6
								},
								contactPerson : {
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

							},
							messages : {

								companyName : {
									required : "Please enter Name",
									minlength : "Your Name must consist of at least 2 characters",
									alpha : "only characters"
								},
								pan : {
									required : "Please enter the PAN number"
								},
								 gstn : {
									//required : "Please enter GSTN Number",
									required : "Please enter GSTN Number",
								}, 
								address : {
									required : "Please enter Address",
									minlength : "Please enter atleast 10 characters"
								},
								state : {
									required : "Please select an state",

								},
								pincode : {
									required : "Please enter pincode",
									number : "Please enter numbers Only",
									minlength : "Please enter 6 digit number only",
									maxlength : "Please enter 6 digit number only"
								},
								contactPerson : {
									required : "Please enter Name",
									minlength : "Your Name must consist of at least 2 characters",
									alpha : "only characters"
								},
								mobile : {
									required : "Please enter mobile number",
									minlength : "Please enter valid mobile number",
									maxlength : "Please enter valid mobile number",
									number : "Please enter numbers only"
								},
								email : {
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
			
		 function showStatesData(response) {
			// alert("in to show states data");
				arrStates = {};
				//<option value="Andra Pradesh">Andra Pradesh</option>
				var html = "<option value=''>-- Select --</option>";
				if (response != undefined && response.length > 0) {
					$.each(response, function(i, datObj) {
						arrStates[datObj.gstnCode] = datObj;
						html = html + '<option value="' + datObj.gstnCode + '">'+ datObj.gstnCode +'--'+ datObj.stateCode +'--'+ datObj.stateName + '</option>';
					});
				}
				$('#state').empty().append(html);
				//console.log("=========="+serviceUnitArray);
			}
		 
			function sortDropDownListByText(selItem) {
				$(selItem).each(function() {
					var selectedValue = $(this).val();
					$(this).html($("option", $(this)).sort(function(a, b) {
						return a.text.toUpperCase() == b.text.toUpperCase() ? 0 : a.text.toUpperCase() < b.text.toUpperCase() ? -1 : 1
					}));
					$(this).val(selectedValue);
				});
			}  
			
			function populatePurchaserSelect() {
				//var clientId = $('#clientId').val();
				getPurchasersByClientId(clientId);
			}	
			
			function getPurchasersByClientId(sClientId) {
				$.ajax({
					type : "POST",
					url : "getPurchasersByClientId.json",
					data : "sClientId=" + sClientId,
					success : function(response) {
						if (response != null) {
							//showPurchaseData(response);
						}
					},
					error : function(e) {
					}
				})

			}
			
			
			function addVendor(){
				
				data = {};
				data["vendorId"] = $("#vendorId").val();
				data["clientId"] = $("#clientId").val();
				data["companyName"] = $("#companyName").val();
				data["pan"] = $("#pan").val();
				data["gstn"] = $("#gstn").val();
				data["address"] = $("#address").val();
				data["state"] = $("#state").val();
				data["pincode"] = $("#pincode").val();
				data["contactPerson"] = $("#contactPerson").val();
				data["mobile"] = $("#mobile").val();
				data["email"] = $("#email").val();
				//alert("in to add vendor client"+clientId);
				var gstn = $("#gstn").val();
				
				var state = $("#state").val();
				
				var gstnState = gstn.substring(0,2);
				
				var gstnVendorState = state.substring(0,2);
				
				var pan = $("#pan").val();
				
				var gstnpanNumber = gstn.substring(2,12);
				
				var gstnpan = pan.substring();
				
				if((gstnVendorState == gstnState)){
					var gstn = $("#gstn").val();
				}else{
					$("#vendorFrmMsg").text('State Code Not Matched In Gstn');
					$("#vendorFrmMsg").show();
					$("#vendorFrmMsg").fadeOut(15000);
					return false;
				}if((gstnpanNumber == gstnpan)){
					var gstn = $("#gstn").val();
				}else{
					$("#vendorFrmMsg").text('Pan Number Not Matched In Gstn');
					$("#vendorFrmMsg").show();
					$("#vendorFrmMsg").fadeOut(15000);
					return false;
				}
				data["gstn"] = gstn; 
				
				$.ajax({
					type : "post",
					url : "addVendor.htm",
					data : data,
					success : function(response){
						resJSON = JSON.parse(response);
						if (response != null) {
							if (resJSON.status == "ERROR") {
								$("#vendorFrmMsg").text(resJSON.message);
								$("#vendorFrmMsg").show();
								$("#vendorFrmMsg").fadeOut(15000);
								$("#vendorFrmMsg").val("");
							} else {
								$("#vendorFrmMsg").text('Vendor saved Sucessfully');
								$("#vendorFrmMsg").show();
								$("#vendorFrmMsg").fadeOut(15000);
								vendorClear();
								updateVendors();
								//showVendorData();
							}

						}
					},
					error : function(e) {
						$("#btn-save").prop("disabled", false);
					}
				})
			}
			
			function updateVendors(){
				$.ajax({
					type : "post",
					url : "vendorList.htm",
					data : data,
					success : function(response){
						resJSON = JSON.parse(response);
						showVendorData(resJSON);
						
					},
					error : function(e) {
						$("#btn-save").prop("disabled", false);
					}
				})
			}
			
			
			
			function showVendorData(response) {
				//alert("inside showVendorData ========"+response);
				serviceUnitArrayVendor = {};
				var html = '';
				if (response != undefined && response.length > 0) {
					$.each(
									response,
									function(i, datObj) {
										serviceUnitArrayVendor[datObj.vendorId] = datObj;
										html = html
												+ '<tr>'
												+ '<td class="text-center">'
												+ datObj.companyName
												+ '</td>'
												+ '<td class="text-center">'
												+ datObj.gstn
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
												+ datObj.address
												+ '</td>'
												+ '<td class="text-center">'
												+ '<a id="'
												+ datObj.vendorId
												+ '" class="btn btn-info btn-xs" onclick="editVendor(this.id)">'
												+ '<span class="glyphicon glyphicon-edit"></span>'
												+ '</a>'
												+ '<a id="'
												+ datObj.vendorId
												+ '" class="btn btn-danger btn-xs" onclick="deleteVendor(this.id)">'
												+ '<span class="glyphicon glyphicon-remove"></span>'
												+ '</a>' + '</td>' + '</tr>'
									});
				}
				$('#vendorListData').empty().append(html);
			}
			function editVendor(vendorId){
				$('#btnVendorSave').text("Update");
				$('#vendorId').val(vendorId);
				$('#companyName').val(serviceUnitArrayVendor[vendorId].companyName);
				$('#pan').val(serviceUnitArrayVendor[vendorId].pan);
				$('#gstn').val(serviceUnitArrayVendor[vendorId].gstn);
				$('#address').val(serviceUnitArrayVendor[vendorId].address);
				$('#state').val(serviceUnitArrayVendor[vendorId].state);
				$('#pincode').val(serviceUnitArrayVendor[vendorId].pincode);
				$('#contactPerson').val(serviceUnitArrayVendor[vendorId].contactPerson);
				$('#mobile').val(serviceUnitArrayVendor[vendorId].mobile);
				$('#email').val(serviceUnitArrayVendor[vendorId].email);
			}
			
			function deleteVendor(vendorId) {
				$.ajax({
					type : "POST",
					url : "deleteVendor.json",
					data : "vendorId=" + vendorId,
					success : function(response) {
						if (response != null) {
							$("#vendorFrmMsg").text("Vendor deleted sucessfully");
							$("#vendorFrmMsg").show();
							$("#vendorFrmMsg").fadeOut(15000);
							showVendorData(response);
						}
					},
					error : function(e) {
					}
				})

			}
			
			function updateVendor(vendorId){
				//alert("in to update vendor ");
				data = {};
				data["clientId"] = $("#clientId").val();
				data["companyName"] = $("#companyName").val();
				data["pan"] = $("#pan").val();
				data["gstn"] = $("#gstn").val();
				data["address"] = $("#address").val();
				data["state"] = $("#state").val();
				data["pincode"] = $("#pincode").val();
				data["contactPerson"] = $("#contactPerson").val();
				data["mobile"] = $("#mobile").val();
				data["email"] = $("#email").val();
				data["vendorId"] = $("#vendorId").val();
				var vendorId = $("#vendorId").val();
				
				
				var gstn = $("#gstn").val();
				
				var state = $("#state").val();
				
				var gstnState = gstn.substring(0,2);
				
				var gstnVendorState = state.substring(0,2);
				
				var pan = $("#pan").val();
				
				var gstnpanNumber = gstn.substring(2,12);
				
				var gstnpan = pan.substring();
				
				if((gstnVendorState == gstnState)){
					var gstn = $("#gstn").val();
				}else{
					$("#vendorFrmMsg").text('State Code Not Matched In Gstn');
					$("#vendorFrmMsg").show();
					$("#vendorFrmMsg").fadeOut(15000);
					return false;
				}if((gstnpanNumber == gstnpan)){
					var gstn = $("#gstn").val();
				}else{
					$("#vendorFrmMsg").text('Pan Number Not Matched In Gstn');
					$("#vendorFrmMsg").show();
					$("#vendorFrmMsg").fadeOut(15000);
					return false;
				}
				data["gstn"] = gstn; 
				
				$.ajax({
					type : "POST",
					url : "updateVendor.htm",
					data : data,
					time : 1000,
					success : function(response) {
						$("#vendorId").val("");
						data = {};
						resJSON = JSON.parse(response);
						if (response != null) {
							if (resJSON.status == "ERROR") {
								$("#vendorFrmMsg").text(resJSON.message);
								$("#vendorFrmMsg").show();
								$("#vendorFrmMsg").fadeOut(15000);
							} else {
								$("#vendorFrmMsg").text('Updated Sucessfully');
								$("#vendorFrmMsg").show();
								$("#vendorFrmMsg").fadeOut(15000);
								vendorClear();
								showVendorData(resJSON);
							}
						}

					},
					error : function(e) {
						$("#btn-save").prop("disabled", false);
					}

				});
			}
			function vendorClear() {
				$("#vendorForm")[0].reset();
				$("#vendorForm").data('validator').resetForm();
			}
	</script>
</body>
</html>
