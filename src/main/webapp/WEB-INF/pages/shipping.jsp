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

</head>
<!-- Includes End-->
<body>
	<div class="clearfix"></div>
	<div id="body_content">
		<div class="container">
			<div class="row">
				<!-- ADD SECTION START -->
				<form id="shippingForm">
				<fieldset>
							<legend>Shipping</legend>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Purchaser</label> <select id="purchaserId" class="form-control" onchange="getShippingsBypurchaserId()">
									</select>
									 <input type="hidden" class="form-control" id="comapanyName" name="comapanyName">
									 <input type="hidden" class="form-control" id="shippingId" name="shippingId">
									 <!-- <input  type="hidden" id="billCartId" name="billCartId"> -->
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Name </label> 
									<input class="form-control" id="name" name="name" type="text" placeholder="">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Address</label> 
									<input class="form-control" type="text" id="address" name="address" placeholder=""> 
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">State</label>
										<select class="form-control"
							id="state" name="state">
						</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Pin </label> 
									<input class="form-control" id="pin" name="pin" type="text" placeholder="">
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
											<button class="btn btn-primary" id="btnClientSave" onClick="shippingFormValidate();">Add</button>
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
							<legend>List Shipping</legend>
							<div class="col-md-12">
								<div class="table-responsive">
									<table class=" table table-responsive table-bordered ">
										<thead>
											<tr>
												<!-- <th class="text-center">Company Name</th> -->
												<!-- <th class="text-center">Purchaser</th> -->
												<th class="text-center">Name</th>
												<th class="text-center">Address</th>
												<th class="text-center">State</th>
												<th class="text-center">Pin</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody id="shippingListData">
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
	var lstStates = '${ALLSTATES}';	
	var lstPurchasers = '${PURCHASERS}';
	var lstShipping = '${LISTSHIPPING}';

	//console.log(lstPurchasers);
	$(document).ready(function() {
		
		if(lstStates != undefined && lstStates.length >0){
			showStatesData(JSON.parse(lstStates)); 
		}
		if(lstPurchasers != undefined && lstPurchasers.length >0){
			showPurchaserData(JSON.parse(lstPurchasers));
		}
		if(lstShipping != undefined && lstShipping.length >0){
			showShippingData(JSON.parse(lstShipping));
		}
		$('#state').click(function(e) {
	    	sortDropDownListByText("#state");
	    });
		
		

	});
 	function sortDropDownListByText(selItem) {
		$(selItem).each(function() {
			var selectedValue = $(this).val();
			$(this).html($("option", $(this)).sort(function(a, b) {
				return a.text.toUpperCase() == b.text.toUpperCase() ? 0 : a.text.toUpperCase() < b.text.toUpperCase() ? -1 : 1
			}));
			$(this).val(selectedValue);
		});
	}  
	function showPurchaserData(response) {
		serviceUnitArray = {};
		var html = "<option value=''>-- Select --</option>";
		if (response != undefined && response.length > 0) {
			$.each(response, function(i, datObj) {
				serviceUnitArray[datObj.purchaserId] = datObj;
				html = html + '<option value="' + datObj.purchaserId + '">'
						+ datObj.companyName + '</option>';
			});
		}
		$('#purchaserId').empty().append(html);
		//console.log("=========="+serviceUnitArray);
	}
	
	function showStatesData(response) {
		arrStates = {};
		//<option value="Andra Pradesh">Andra Pradesh</option>
		var html = "<option value=''>-- Select --</option>";
		if (response != undefined && response.length > 0) {
			$.each(response, function(i, datObj) {
				arrStates[datObj.stateId] = datObj;
				html = html + '<option value="' + datObj.stateId + '">'+ datObj.gstnCode +'--'+ datObj.stateCode +'--'+ datObj.stateName + '</option>';
			});
		}
		$('#state').empty().append(html);
		//console.log("=========="+serviceUnitArray);
	}
	
	function populatePurchaserData(purchaserId){
		
		var purchaserId = $('#purchaserId').val();
		$('#companyName').val(serviceUnitArray[purchaserId].companyName);
		
	}
	function addShipping(){
		//alert("in to add shipping");
		data = {};
		data["purchaserId"] = $("#purchaserId").val();
		data["companyName"] = $("#companyName").val();
		data["name"] = $("#name").val();
		data["address"] = $("#address").val();
		data["state"] = $("#state").val();
		data["pin"] = $("#pin").val();
		$.ajax({
			type : "POST",
			url : "addShipping.htm",
			data : data,
			success : function(response) {
				resJSON = JSON.parse(response);
				if (response != null) {
					if (resJSON.status == "ERROR") {
						$("#shippingFrmMsg").text(resJSON.message);
						$("#shippingFrmMsg").show();
						$("#shippingFrmMsg").fadeOut(15000);
						$("#shippingFrmMsg").val("");
					} else {
						$("#shippingFrmMsg").text('Shipping saved Sucessfully');
						$("#shippingFrmMsg").show();
						$("#shippingFrmMsg").fadeOut(15000);
						shippingClear();
						showShippingData(response);
					}

				}
			},
			error : function(e) {
				$("#btn-save").prop("disabled", false);
			}
		});
	}
	
	
	function showShippingData(response) {
		////alert("in to showShipping data");
		serviceUnitArrayShipping = {};
		var html = '';
		if (response != undefined && response.length > 0) {
			$
					.each(
							response,
							function(i, datObj) {
								serviceUnitArrayShipping[datObj.shippingId] = datObj;
								html = html
										+ '<tr>'
										/* + '<td class="text-center">'
										+ datObj.companyName
										+ '</td>' */
										+ '<td class="text-center">'
										+ datObj.name
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
										+ '<a id="'
										+ datObj.shippingId
										+ '" class="btn btn-info btn-xs" onclick="editShipping(this.id)">'
										+ '<span class="glyphicon glyphicon-edit"></span>'
										+ '</a>'
										+ '<a id="'
										+ datObj.shippingId
										+ '" class="btn btn-danger btn-xs" onclick="deleteShipping(this.id)">'
										+ '<span class="glyphicon glyphicon-remove"></span>'
										+ '</a>' + '</td>' + '</tr>'
							});
		}
		$('#shippingListData').empty().append(html);
	}
	function editShipping(shippingId) {
		//alert("in to edit shipping "+shippingId);
		$('#btnUserSave').text("Update");
		$('#shippingId').val(shippingId);
		$('#companyName').val(serviceUnitArrayShipping[shippingId].companyName);
		$('#name').val(serviceUnitArrayShipping[shippingId].name);
		$('#address').val(serviceUnitArrayShipping[shippingId].address);
		$('#state').val(serviceUnitArrayShipping[shippingId].state);
		$('#pin').val(serviceUnitArrayShipping[shippingId].pin);
	}
	function deleteShipping(id) {
		//alert("in to delete==="+id);
		var count = 0;
		$.ajax({
			type : "POST",
			url : "deleteShipping.json",
			data : "shippingId=" + id,
			success : function(response) {
				if (response != null) {
					$("#shippingFrmMsg").text("Shipping deleted sucessfully");
					$("#shippingFrmMsg").show();
					$("#shippingFrmMsg").fadeOut(15000);
					showShippingData(response);
				}
			},
			error : function(e) {
			}
		});
	}
	function updateShipping(shippingId){
		//alert("in to update user===");
		data = {};
		data["purchaserId"] = $("#purchaserId").val();
		data["shippingId"] = $("#shippingId").val();
		data["purchaserName"] = $("#purchaserName").val();
		data["name"] = $("#name").val();
		data["address"] = $("#address").val();
		data["state"] = $("#state").val();
		data["pin"] = $("#pin").val();
		var shippingId = $("#shippingId").val();
		$.ajax({
			type : "POST",
			url : "updateShipping.htm",
			data : data,
			time : 1000,
			success : function(response) {
				$("#userId").val("");
				data = {};
				resJSON = JSON.parse(response);
				if (response != null) {
					if (resJSON.status == "ERROR") {
						$("#shippingFrmMsg").text(resJSON.message);
						$("#shippingFrmMsg").show();
						$("#shippingFrmMsg").fadeOut(15000);
					} else {
						$("#shippingFrmMsg").text('Updated Sucessfully');
						$("#shippingFrmMsg").show();
						$("#shippingFrmMsg").fadeOut(15000);
						productClear();
						showShippingData(resJSON);
					}
				}

			},
			error : function(e) {
				$("#btn-save").prop("disabled", false);
			}

		});
	}
	function shippingFormValidate() {
		//alert("in to shippingFormValidation");
		if ($("#shippingForm").valid()) {
			//alert("in to shipping validate");
			var shippingId = $("#shippingId").val();
			if (shippingId != "") {
				updateShipping();
			} else {
				addShipping();
			}
	}
	}
	
	$("#shippingForm")
	.validate(
			{
				rules : {

					name : {
						required : true,
						minlength : 2,
						alpha : true
					},
					address : {
						required : true
						
					},
					pin : {
						required : true,

						number : true
					},
					
				},
				messages : {

					name : {
						required : "Please enter  Name",
						minlength : "Your Name must consist of at least 2 characters",
						alpha : "only characters"
					},
					address : {
						required : "Please enter Address "
						
					},
					pin : {
						required : "Please enter Pin",
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
	

	function getShippingsBypurchaserId() {
		var purchaserId = $('#purchaserId').val();
		////alert("1. purchaserId===="+purchaserId);
		$.ajax({
			type : "POST",
			url : "getShippingsBypurchaserId.htm",
			data : "purchaserId=" + purchaserId,
			success : function(response) {
				if (response != null) {
					////alert("2. response===="+response);
					showShippingData(JSON.parse(response));
				}
			},
			error : function(e) {
			}
		})

	}
	</script>
</body>
</html>
