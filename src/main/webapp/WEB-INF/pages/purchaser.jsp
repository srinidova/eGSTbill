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
										type="hidden" class="form-control" id="purchaserId"
										name="purchaserId">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">GSTN<sup>*</sup></label> <input
										class="form-control" type="text" id="gstnNo" name="gstnNo"
										maxlength="15" placeholder="" >
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Address<sup>*</sup></label>
									<input class="form-control" type="text" id="purchaserAddress" name="purchaserAddress" placeholder=""> 
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">State<sup>*</sup></label> 
									<select class="form-control" id="purState" name="purState" >
										
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
									<label for="">PAN<sup>*</sup></label> <input
										class="form-control" type="text" id="panNo" name="panNo"
										maxlength="15" placeholder="" >
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
		var lstStates = '${ALLSTATES}';
		var lstClients ='${LISTCLIENTS}';
		var lstPurchasers = '${LISTPURCHASERS}';
		var sClientId = '${CLIENTID}';
		
		
		
		//console.log(lstClients);
		/* console.log(sClientId);
		console.log(lstPurchasers); */
		console.log(lstStates);
		console.log(lstClients);
		
		$(document).ready(function() {
			if(lstStates != undefined && lstStates.length >0){
				showStatesData(JSON.parse(lstStates)); 
			}
			if(lstClients != undefined && lstClients.length >0){
				showClientData(JSON.parse(lstClients));
				//alert("sClientId=="+sClientId);
				$('#clientId').val(sClientId);
				populatePurchaserSelect() ;
			}
			if(lstPurchasers != undefined && lstPurchasers.length >0){
				showPurchaseData(JSON.parse(lstPurchasers));
			}

			
			
			$('#purState').click(function(e) {
		    	sortDropDownListByText("#purState");
		    });
			/* $('#gstnNo').click(function(e) {
		    	//sortDropDownListByText("#purState");
				gstn("#gstnNo"); 
		    }); */
			/* $('#gstnNo').keyup(function() {
			      /*  var inputVal = $(this).val();
			       var regex = new RegExp("^[a-zA-Z ]+$");
			        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			       var emailReg =  ("^\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d[Z]{1}[A-Z\d]{1}"); */
			      // ("^\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d[Z]{1}[A-Z\d]{1}");
			       /* if(!emailReg.test(inputVal)) {
			           $("#purchaseFrmMsg").text('Invalid Email Format');
			           $("#purchaseFrmMsg").show();
			              $("#purchaseFrmMsg").fadeOut(2000);
			           return false;
			       }
			   });  */
			/* $('#gstnNo').keypress(function (e) {
		        var regex = new RegExp("/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/");
		        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		        if (regex.test(str)) {
		            return true;
		        }
		        else
		        {
		        e.preventDefault();
		        //alert('Please Enter Alphabate');
		        $("#purchaseFrmMsg").text('Please Enter Alphabates');
	        	$("#purchaseFrmMsg").show();
	           	$("#purchaseFrmMsg").fadeOut(2000);
		        return false;
		        $( "#gstnNo" ).focus();
		        }
		    }); */
		    
			/* $('#gstnNo').keyup(function() {
			       var inputVal = $(this).val();
			       //var gstnReg = /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/;
			       var gstnReg =  /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}Z[0-9]{1}?$/
			    		   
			       if(!gstnReg.test(inputVal)) {
			           $("#purchaseFrmMsg").text('Invalid Email Format');
			           $("#purchaseFrmMsg").show();
			              $("#purchaseFrmMsg").fadeOut(2000);
			           return false;
			       }
			   }); */
		    
			/* $('#gstnNo').keypress(function (e) {
		       // var regex = new RegExp("/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/");
		        //var regex = new RegExp("/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}Z[0-9]{1}?$/");
		        var regex = new RegExp  ("^([0][1-9]|[1-2][0-9]|[3][0-5])([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$");
		        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		        if (regex.test(str)) {
		            return true;
		        }
		        else
		        {
		        e.preventDefault();
		        $("#purchaseFrmMsg").text('Invalid Format');
	        	$("#purchaseFrmMsg").show();
	           	$("#purchaseFrmMsg").fadeOut(2000);
		        return false;
		        }
		    }); */
			$('#gstnNo').keyup(function() {
			        var inputVal = $(this).val();
			        var gstnReg =   /^([0-9]{2}[a-zA-Z]{4}([a-zA-Z]{1}|[0-9]{1})[0-9]{4}[a-zA-Z]{1}([a-zA-Z]|[0-9]){3}){0,15}$/;
			       //var gstnReg = /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}Z[0-9]{1}?$/;
			       //var gstnReg = /^([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([0-9]){1}([a-zA-Z]){1}([0-9]){1}?$/;
			       if(!gstnReg.test(inputVal)) {
			        $("#purchaseFrmMsg").text('Invalid Gstn Format');
			           $("#purchaseFrmMsg").show();
			              $("#purchaseFrmMsg").fadeOut(2000);
			           return false;
			       } 
				/* var reggst = /^([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([0-9]){1}([a-zA-Z]){1}([0-9]){1}?$/;
				if(!reggst.test(gstnNo) && gstnNo!=''  && gstnNo.length!=15){
				        alert('GST Identification Number is not valid. It should be in this "11AAAAA1111Z1A1" format');
				} */
			   });
			
		});

		function purchaseClear() {
			$("#purchaserForm")[0].reset();
			$("#purchaserForm").data('validator').resetForm();
		}
		function purchaseFormValidate() {
			if ($("#purchaserForm").valid()) {
				//alert("gstnNo........"+$("#gstnNo").val().substring(0,2));
				$("#purState").change(function(){ 
			        var element = $(this).find('option:selected').attr("value"); 
			    }); 
				////alert("state code......"+element);
				var purchaseId = $("#purchaserId").val();
				if (purchaseId != "") {
					////alert("hello update=========" + purchaseId);
					updatePurchaser(purchaseId);
					$('#btnPurchaseSave').text("Add");
				} else {
					//////alert("--------inside else---------");
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
									minlength : 15,
									maxlength : 15,
									required : true
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
									//required : "Please enter GSTN Number",
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
			//////alert("inside savePurchaser");
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
			//////alert("purchase data"+purchaserData)
			////alert("in to save purchaser ==="+clientId);
			console.log(clientId);
			//gstnNumber();
			 var gstnNo = $("#gstnNo").val();
				
			var purState = $("#purState").val();
			var panNo = $("#panNo").val();
			
			var gstnState = gstnNo.substring(0,2);
			var gstnpurstate = purState.substring(0,2);
			
			var gstnpanNumber = gstnNo.substring(2,12);
			var gstnPan = panNo.substring();
			
			console.log(gstnState);
			
			if((gstnpurstate == gstnState)){
				var gstnNo = $("#gstnNo").val();
			}else {
				$("#purchaseFrmMsg").text('State Code Not Matched In Gstn');
				$("#purchaseFrmMsg").show();
				$("#purchaseFrmMsg").fadeOut(15000);
				return false;
			}if((gstnpanNumber == panNo)){
				var gstnNo = $("#gstnNo").val();
			}else {
				$("#purchaseFrmMsg").text('Pan Number Not Matched In Gstn');
				$("#purchaseFrmMsg").show();
				$("#purchaseFrmMsg").fadeOut(15000);
				return false;
			}
			purchaserData["gstNumber"] = gstnNo; 
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
				/* resJSON = JSON.parse(response);
				if (response != null) {
					if (resJSON.status == "ERROR") {
						
						$("#purchaseFrmMsg").text(resJSON.message);
						$("#purchaseFrmMsg").show();
						$("#purchaseFrmMsg").fadeOut(15000);
						$("#purchaseFrmMsg").val("");
				
					}else{
						$("#purchaseFrmMsg").text('Purchaser saved Sucessfully');
						$("#purchaseFrmMsg").show();
						$("#purchaseFrmMsg").fadeOut(15000);
						purchaseClear();
						//resJSON = JSON.parse(response);
						showPurchaseData(resJSON);
						}
					} */
				
			});
		}
		function showPurchaseData(response) {
			////alert("inside showpurchase data========"+response);
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
			//alert("inside delete");
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
			//alert("inside edit");btnPurchaseSave
			$('#btnPurchaseSave').text("Update");
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
			 //alert("inside update jsp purchaser==========="+purchaserId);
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
			//alert("panno id in update jsp..............");
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
			
		 function showStatesData(response) {
				arrStates = {};
				//<option value="Andra Pradesh">Andra Pradesh</option>
				var html = "<option value=''>-- Select --</option>";
				if (response != undefined && response.length > 0) {
					$.each(response, function(i, datObj) {
						arrStates[datObj.gstnCode] = datObj;
						html = html + '<option value="' + datObj.gstnCode + '">'+ datObj.gstnCode +'--'+ datObj.stateCode +'--'+ datObj.stateName + '</option>';
					});
				}
				$('#purState').empty().append(html);
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
			/* function gstn(id) {
				if(!$('#gstnNo').val().match(/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/) ) {
				    $("#unc").text("Please enter numbers only.");
					   $("#unc").show();
			        $("#unc").fadeOut(15000);
				    return false;
				    }
				
			} */
			function populatePurchaserSelect() {
				var clientId = $('#clientId').val();
				getPurchasersByClientId(clientId);
			}	
			
			function getPurchasersByClientId(sClientId) {
				$.ajax({
					type : "POST",
					url : "getPurchasersByClientId.json",
					data : "sClientId=" + sClientId,
					success : function(response) {
						if (response != null) {
							showPurchaseData(response);
						}
					},
					error : function(e) {
					}
				})

			}
			function populateGstn(purchaserId) {
				//alert("in to populateGstn purchaserId"+purchaserId)
				var purchaserId = $('#purchaserId').val();
				//alert("in to populateGstn purchaserId"+purchaserId)
				var gstnFull = "";
				var state = serviceUnitArrayPurchaser[purchaserId].purState;
				//alert("in to populate gstn state"+purState);
				//alert("in to populateGstn serviceUnitArrayPurchaser[purchaserId].state"+serviceUnitArrayPurchaser[purchaserId].purState);
				if (purState == serviceUnitArrayPurchaser[purchaserId].purState) {
					if (gstnFull.length > 0) {
						gstnFull = gstnFull + " " + purState;
					} else {
						gstnFull = gstnFull + " " + purState;
					}
				}
				var panNo = serviceUnitArrayPurchaser[purchaserId].panNo;
				if (panNo == serviceUnitArrayPurchaser[purchaserId].panNo) {
					if (gstnFull.length > 0) {
						gstnFull = gstnFull + " " + panNo;
					} else {
						gstnFull = gstnFull + " " + panNo;
					}
				}
				
				$('#gstNumber').text(gstnFull);
				

			}
			function gstnNumber(){
				
				var gstnNo = $("#gstnNo").val();
				
				var purState = $("#purState").val();
				var panNo = $("#panNo").val();
				
				var gstnState = gstnNo.substring(0,2);
				var gstnpurstate = purState.substring(0,2);
				
				var gstnpanNumber = gstnNo.substring(2,12);
				var gstnPan = panNo.substring();
				
				console.log(gstnState);
				
				 if((gstnpurstate == gstnState)){
					var gstnNo = $("#gstnNo").val();
				}else {
					$("#purchaseFrmMsg").text('State Code Not Matched In Gstn');
					$("#purchaseFrmMsg").show();
					$("#purchaseFrmMsg").fadeOut(15000);
					return false;
				}if((gstnpanNumber == panNo)){
					var gstnNo = $("#gstnNo").val();
				}else {
					$("#purchaseFrmMsg").text('Pan Number Not Matched In Gstn');
					$("#purchaseFrmMsg").show();
					$("#purchaseFrmMsg").fadeOut(15000);
					return false;
				} 
				
				
				
			}
	</script>
</body>
</html>
