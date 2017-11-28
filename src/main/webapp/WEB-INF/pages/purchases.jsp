<!-- Includes Start-->
<%@page import="com.eGSTbill.model.User, com.eGSTbill.model.Client"%>
<%

User user= null;
Client client = null;
String disAccountNumber = "";
String disBank ="";
String disIfscCode ="";
String disBranch ="";
String sGstn ="";
String userName ="";

String clientMobile = "";
String clientAddress = "";
String clientPincode = "";
String clientCompany = "";

if(session.getAttribute("USER") != null){
	user=(User)session.getAttribute("USER"); 
	client = user.getClient();
	disAccountNumber = client.getAccountNumber();
	disBank = client.getBank();
	disIfscCode = client.getIfsc();
	disBranch = client.getBranch();
	sGstn = client.getGstn();
	clientMobile = client.getMobile();
	userName = user.getUserName();
	clientAddress = client.getAddress();
	clientPincode = client.getPin();
	clientCompany = client.getCompanyName();
}
%>
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
 <!-- <link href="css/eGSTbill/style1.css" rel="stylesheet" type="text/css">  -->
<link href="css/eGSTbill/datetimepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/commonUtils.js"></script>
 <!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>  -->

</head>
<!-- Includes End-->
<body>
	<div class="clearfix"></div>
	<div id="body_content">
		<div class="container">
			<div class="row">
				<!-- ADD SECTION START -->
				<div class="new_bill">
					<div class="col-md-12">
						<form id="purchasesForm">
							<fieldset>
								<legend>Purchases</legend>
								<div class="col-md-4">
									<div class="form-group">
										<label for="">Product Name</label> <select id="productId"
											name="productId" class="form-control"
											onchange="populateProdData();">
										</select> <input type="hidden" class="form-control" id="productName"
											name="productName"> <input type="hidden"
											class="form-control" id="purchasesId"
											name="purchasesId"> 
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="">Quantity</label> <input class="form-control"
											id="quantity" name="quantity" type="text" placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="">Rate</label> <input class="form-control"
											id="rate" name="rate" type="text" placeholder="">
									</div>
								</div>
								
								<div class="col-md-10">
									<div id="purchasesMsg"
										style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
										Sucessfully</div>
								</div>
								<div class="col-md-3 pull-right">
									<div class="buttons">
										<ul>
											<li>
												<button class="btn btn-primary" id="btnProdSave"
													onClick="purchasesFormValidate();">Add</button>
											</li>
											<li>
												<button type="button" class="btn btn-primary" name="clear"
												value="clear" onClick="newBillClear();">Clear</button>
											</li>
										</ul>
									</div>	
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- ADD SECTION END -->
				<div class="clearfix"></div>
				<!-- LIST SECTION START -->
				<div class="new_bill" style="margin-top: 3em;">
					<div class="col-md-12">
						<fieldset>
							<legend>Credit Note</legend>
							
							<div class="invoice_table">
                <div class="invoice">
                  <div class="col-md-5">
                   <!--  <h3>TIN : 36053303269</h3> -->
                  </div>
                  <div class="col-md-4">
                    <h3>PURCHASES INVOICE</h3>
                  </div>
                </div>
                <div class="col-md-9" id= "image">
                  <!-- <div class="i_logo" ><img src="images/1.jpg"  class="img-responsive" alt=""></div> -->
                </div>
                <div class="col-md-3">
                  <div class="i_address">
                    <%-- <h5>Mobile No :  <%= clientMobile %> </h5>
                    <p><%= clientAddress %></p> --%>
                  </div>
                </div>
              </div>
							
 
							<div class="col-md-12">
								<div class=" table-responsive">
									<table class="table table-bordered table-hover">
										<thead>
											<!-- <tr>
												<th>Document No :</th>
												<th>Against invoice :</th>
											</tr> -->
											<tr>
												<!-- <th >Bill No :<span id="billNo">
												</span></th>
												<th>Date Of invoice :<span ></span>
												<input type="text" name="billDate" id="billDate">
											
				</th> -->
											</tr>
											<!-- <tr>
												<th>State :
													<table style="float: right; width: 25%;">
														<tr>
															<th>Code :</th>
														</tr>
													</table>
												</th>
												<th></th>
											</tr> -->
											<tr>
												<th style="background: #e8e8e8; color: #000 !important;" id="billtoparty">
													<form class="form-inline" id="purchaserForm">
														<div class="form-group ">
															<label for="email">Bill to Party</label> <select
																id="vendorId" class="form-control party_select_box"
																onchange="populateVendorData();">
															</select>
														</div>
													</form>
												</th>
												<!-- <th style="background: #e8e8e8; color: #000 !important;" id="shiptoparty">
													<form class="form-inline">
														<div class="form-group ">
															<label for="email"> Ship to Party</label> <select
																id="shippingId" onchange="populateShippingData();"
																class="form-control party_select_box">
																<option value="">--Select--</option>
															</select>
														</div>
													</form>
												</th> -->
											</tr>
											<tr>
												<th>Name :<span id="disCompanyName"></span></th>
												<!-- <th>Name :<span id="disShippingName"></span></th> -->
											</tr>
											<tr>
												<td style="height: 60px; width: 50%;"><b>Address :
														<span id="disPurchaserAddress"></span>
												</b></td>
												<!-- <td style="height: 60px; width: 50%;"><b>Address :<span
														id="disShippingAddress"></span>
												</b></td> -->
											</tr>
											<tr>
												<th>GSTIN :<span id="disPurchaserGSTN"></span></th>
												<!-- <th>GSTIN :</th> -->
											</tr>
											<tr>
												<th>State :<span id="disPurchaserState"></span>
													<table style="float: right; width: 25%;">
														<tr>
															<th>Code :<span id="disPurchaserCode"></span></th>
														</tr>
													</table>
												</th>
												<!-- <th>State : <span id="disShippingState"></span>
													<table style="float: right; width: 25%;">
														<tr>
															<th>Code : <span id="disShippingGstnCode"></span></th>
														</tr>
													</table>
												</th> -->
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<div class="col-md-12">
								<div class=" table-responsive" style="margin-top: 1em;">
									<table class="table table-bordered table-hover">
										<thead>
											<tr style="background: #28a8e0; color: #fff;">
												<th class="text-center" id="billNo">S.No</th>
												<th class="text-center">Product Description</th>
												<!-- <th class="text-center">HSN Code</th>
												<th class="text-center">UOM</th> -->
												<th class="text-center">Qty</th>
												<th class="text-center">Rate</th>
												<th class="text-center">Total Amount</th>
												<!-- <th class="text-center">Amount</th> -->
												<!-- <th class="text-center">Discount</th>
												<th class="text-center">Taxable Value</th>
												<th colspan="2" style="text-align: center;" id="cGST">CGST</th>
												<th colspan="2" style="text-align: center;" id="sGST">SGST</th>
												 <th colspan="2" style="text-align: center;" id="iGST">IGST</th> 
												<th class="text-center">Total</th> -->
												<th class="text-center" id="action">Action</th>
											</tr>
										</thead>
										<tbody id="purchasesListData">
										</tbody>
										<!-- <tr>
											<th style="border: none !important;"></th>
											<th style="border: none !important;"></th>
											<th style="border: none !important;"></th>
											<th style="border: none !important;"></th>
											<th style="border: none !important;"></th>
											<th style="border: none !important;"></th>
											<th style="border: none !important;"></th>
											<th style="border: none !important;"></th>
											<th style="border: none !important;"></th>
											<th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;" id="cgstrate">Rate</th>
											<th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;" id="cgstamount">Amount</th>
											<th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;" id="sgstrate">Rate</th>
											<th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;" id="sgstamount">Amount</th>
												 <th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;" id="igstrate">Rate</th>
												<th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;" id="igstamount">Amount</th> 
											<th style="border: none !important;"></th>
										</tr> -->
										<tbody id="billListData">
										</tbody>
										<tr>
											<!-- <th colspan="4" style="text-align: center;">Total</th> -->
											<!-- <th style="text-align: right;"><div id="totalQuantity"></div></th>
											<th style="text-align: right;"></th>
											<th style="text-align: right;"><div id="totalAmount"></div></th>
											<th style="text-align: right;"><div id="totalDiscount"></div></th> -->
											<!-- <th style="text-align: right;"><div id="taxValue"></div></th>
											<th style="text-align: right;" id="hideCgst"></th>
											<th style="text-align: right;" ><div id="totalCgst"></div></th>
											<th style="text-align: right;" id="hideSgst"></th>
											<th style="text-align: right;" ><div id="totalSgst"></div></th>
											<th style="text-align: right;" id="hideIgst"></th> 
											<th style="text-align: right;" ><div id="totalIgst"></div></th> -->
											<!-- <th style="text-align: right;"><div id="grandTotal"></div></th> -->
										</tr>
										<%-- <tr>
											<th colspan="9" style="text-align: center;"><div id="wordsAmount"></div>
												</th>
											<th colspan="4" style="text-align: left;">Total Amount
												Before Tax</th>
											<th style="text-align: right;"><div id="totalBeforeTax"></div></th>
										</tr>
										<tr>
											<th colspan="9" 
												style="text-align: ; border: none !important;" ><div ></div>Account No :  <%= disAccountNumber %></span></th>
											<th colspan="4" style="text-align: left;" id="addCGST">Add : CGST</th>
											<th style="text-align: right;"><div id="totalCgstAdd"></th>
										</tr>
										<tr>
											<th colspan="9"
												style="text-align: ; border: none !important;"><span></span>IFSC Code : <%= disIfscCode %>
												</th>
											<th colspan="4" style="text-align: left;" id="addSGST">Add : SGST</th>
											<th style="text-align: right;"><div id="totalSgstAdd"></th>
										</tr>
										<tr id ="addIGST">
											<th colspan="9"
												style="text-align: ; border: none !important;">
												</th>
											<th colspan="4" style="text-align: left;" id="">Add : IGST</th>
											<th style="text-align: right;"><div id="totalIgstAdd"></th>
										</tr>
										<tr>
											<th colspan="9"
												style="text-align: ; border: none !important;">Bank : <%= disBank %></th>
											<th colspan="4" style="text-align: left;">Total Tax
												Amount</th>
											<th style="text-align: right;"><div id="totalTax"></div></th>
										</tr>
										<tr>
											<th colspan="9"
												style="text-align: ; border: none !important;">Branch : <%= disBranch %></th>
											<th colspan="4"
												style="text-align: left; border-bottom: none !important;">Total
												Amount after Tax</th>
											<th style="text-align: right; border: none !important;"><div
													id="totalAfterTax"></div></th>
										</tr> --%>
										</thead>
									</table>
								</div>
							</div>
							<div class="invoice_table_footer">
                <!-- <div class="col-md-8">
                  <div class="f_matter">
                    <h4>WHETHER TAX IS PAYBLE ON REVERSE CHARGE BASIS YES / NO </br>
                      E.& O.E</h4>
                    <p> All Disputes Subject To Nagari Jurisdiction.</br>
                      Interest will be charged @ 24% Per Annum will be charged after 30 days</p>
                  </div>
                </div> -->
                <%-- <div class="col-md-4">
                  <div class="f_address">
                    <h4><span>For</span> <%= clientCompany %></h4>
                    <p>Proprietor</p>
                  </div>
                </div> --%>
              </div>
							<!-- <div class="col-md-12">
								<div class="shipment" id="shipment">
									<a href="javascript:void()"
										onClick="$('.shipment_new_bill').toggle()">Shipment</a>
								</div>
							</div> -->

							<div class="shipment_new_bill"
								style="margin-top: 3em; display: none;">
								<div class="col-md-12">
									<fieldset style="border: 1px solid #ddd !important;">
										<legend style="border: 1px solid #ddd !important;">Shipment
										</legend>
										<div class="col-md-4">
											<div class="form-group">
												<label for="">Lr No</label> <input class="form-control"
													type="text" placeholder="">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="">Lr Date</label> <input class="form-control"
													type="text" placeholder="">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="">No Of Packages</label> <input
													class="form-control" type="text" placeholder="">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="">Pack Slip No</label> <input
													class="form-control" type="text" placeholder="">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="">Despatched Date</label> <input
													class="form-control" type="text" placeholder="">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="">Despathed By</label> <input
													class="form-control" type="text" placeholder="">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="">Terms Of Payment</label> <input
													class="form-control" type="text" placeholder="">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="">Terms</label> <input class="form-control"
													type="text" placeholder="">
											</div>
										</div>
										<div class="clearfix"></div>

									</fieldset>
								</div>
							</div>
							
							

							<div class="col-md-3 pull-right" id="printBillMsg">
								<div class="buttons" style="margin-top: 1em;">
									<ul>
										<li>
											<button class="btn btn-primary " id="bill" onclick="printBill();">Save</button>
											
										</li>
										<!-- <li>
											<button class="btn btn-primary" id="consignment">Consignment</button>
										</li> -->
										<li>
											<button class="btn btn-primary" id="cancel">Cancel</button>
										</li>
									</ul>
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
		var lstOrders = '${LISTPRODUCTS}';
		var lstPurchasers = '${LISTPURCHASERS}';
		var lstIncrement = '${INCREMENTID}';
		var CLIENTINFO = '${sessionScope.CLIENTINFO}';
		
		var lstPurchases = '${LISTPURCHASES}';
		var lstVendors = '${LISTVENDORS}'
		//console.log(lstPurchases);
		
		 var clientInfo = JSON.parse(CLIENTINFO)
		// console.log(clientInfo);
		 console.log(lstVendors);
		
		serviceUnitArrayShipping = {};

		$(document).ready(function() {
			if (lstOrders != undefined && lstOrders.length > 0) {
				showProductData(JSON.parse(lstOrders));
			}
			//showPurchaserData(JSON.parse(lstPurchasers));
			showVendorData(JSON.parse(lstVendors));
			
			if(lstPurchases != undefined && lstPurchases.length >0){
				showPurchasesdata(JSON.parse(lstPurchases));
			}
			 var dateNewFormat, onlyDate, today = new Date();

	          dateNewFormat = (1 + today.getMonth())+ '-' + today.getFullYear();
	          
	          onlyDate = today.getDate();

	          if (onlyDate.toString().length != 2) {
	           onlyDate += '-' + dateNewFormat;
	          }
	          else {
	              dateNewFormat += '-0' + onlyDate;
	          }
	          $('#billDate').val(onlyDate);
		});
		
		

			
			
			
		function showProductData(response) {
			serviceUnitArray = {};
			var html = "<option value=''>-- Select --</option>";
			if (response != undefined && response.length > 0) {
				$.each(response, function(i, datObj) {
					serviceUnitArray[datObj.productId] = datObj;
					html = html + '<option value="' + datObj.productId + '">'
							+ datObj.productName + '</option>';
				});
			}
			$('#productId').empty().append(html);
		}
		function showBillCart(response) {
			//alert("showBillCart"+billCartId)
			serviceUnitArrayBillcart = {};
			var html = "<th>Bill No</th>";
			if (response != undefined && response.length > 0) {
				$.each(response, function(i, datObj) {
					serviceUnitArrayBillcart[datObj.billCartId] = datObj;
					html = html + '<th>Bill No</th>';
				});
			}
			$('#billCartId').empty().append(html);
		}

		function populateProdData(productId) {
			var productId = $('#productId').val();
			//alert("in to populate product data "+productId);
			$('#productName').val(serviceUnitArray[productId].productName);
			$('#salePrice').val(serviceUnitArray[productId].salePrice);
			$('#cgst').val(serviceUnitArray[productId].cGST);
			$('#sgst').val(serviceUnitArray[productId].sGST);
			$('#igst').val(serviceUnitArray[productId].iGST);
			$('#discount').val(serviceUnitArray[productId].discount);
			////alert(serviceUnitArray[productId].productName);
		}

		function purchasesFormValidate() {
			if ($("#purchasesForm").valid()) {
				var purchasesId = $("#purchasesId").val();
				if (purchasesId != "") {
					updatePurchases();
				} else {
					addPurchases();
				}
			}
		}
		function addPurchases(){
			data = {};
			data["productId"] = $("#productId").val();
			data["purchasesId"] = $("#purchasesId").val();
			data["productName"] = $("#productName").val();
			data["quantity"] = $("#quantity").val();
			data["rate"] = $("#rate").val();
			/* $.ajax({
				type : "POST",
				url : "addBillDetailsCart.htm",
				data : data,
				dataType : 'json',
				success : function(response) {
					newBillClear();
					$("#addBillMsg").text("Product added sucessfully");
					$("#addBillMsg").show();
					$("#addBillMsg").fadeOut(5000);
					if (response != null) {
						showBilldata(response);
					}
				},
				error : function(e) {
				}
			}); */
			$.ajax({
				type :"post",
				url :"addPurchases.htm",
				data : data,
				success : function(response){
					 $("#purchasesMsg").text("Purchases Saved Successfully");
					$("#purchasesMsg").show();
					$("#purchasesMsg").fadeOut(5000);
					listPurchases();
					showPurchasesdata(); 
					/* resJSON = JSON.parse(response);
					if (response != null) {
						if (resJSON.status == "ERROR") {
							$("#purchasesMsg").text(resJSON.message);
							$("#purchasesMsg").show();
							$("#purchasesMsg").fadeOut(15000);
							$("#purchasesMsg").val("");
						} else {
							$("#purchasesMsg").text('Vendor saved Sucessfully');
							$("#purchasesMsg").show();
							$("#purchasesMsg").fadeOut(15000);
							
							showPurchasesdata();
						}

					} */
				}
			});
 		}
		
		function listPurchases(){
			$.ajax({
				type :"post",
				url :"listPurchases.htm",
				data : data,
				success : function(response){
					resJSON = JSON.parse(response);
					showPurchasesdata(resJSON)
				},
				error : function(e) {
					$("#btn-save").prop("disabled", false);
				}
			})
		}
		
		
		function deletePurchases(purchasesId){
		//	alert("in to delete purchases");
			$.ajax({
				type : "post",
				url : "deletePurchases.htm",
				data : "purchasesId="+ purchasesId,
				success : function(response){
					if(response != null){
						$("#purchasesMsg").text("Purchases Deleted Successfully");
						$("#purchasesMsg").show();
						$("#purchasesMsg").fadeOut(5000);
						//listPurchases();
						showPurchasesdata(response);
				}
				},
				
			});
		}
		function editPurchases(purchasesId){
			$('#btnProdSave').text("Update");
			$('#purchasesId').val(purchasesId);
			$('#productId').val(serviceUnitArrayPurchases[purchasesId].productId);
			$('#productName').val(serviceUnitArrayPurchases[purchasesId].productName);
			$('#quantity').val(serviceUnitArrayPurchases[purchasesId].quantity);
			$('#rate').val(serviceUnitArrayPurchases[purchasesId].rate);
		}
		

		function showPurchasesdata(response) {
			////alert("in to show client data");
			serviceUnitArrayPurchases = {};
			var html = '';
			if (response != undefined && response.length > 0) {
				$
						.each(
								response,
								function(i, datObj) {
									serviceUnitArrayPurchases[datObj.purchasesId] = datObj;
									var j = i + 1;
									html = html
											+ '<tr>'
											+ '<td class="text-center">'
											+ j
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.productName
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.quantity
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.rate
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.totalAmount
											+ '</td>'
											+ '<td class="text-center">'
											+ '<a id="'
											+ datObj.purchasesId
											+ '" class="btn btn-info btn-xs" onclick="editPurchases(this.id)">'
											+ '<span class="glyphicon glyphicon-edit"></span>'
											+ '</a>'
											+ '<a id="'
											+ datObj.purchasesId
											+ '" class="btn btn-danger btn-xs" onclick="deletePurchases(this.id)">'
											+ '<span class="glyphicon glyphicon-remove"></span>'
											+ '</a>' + '</td>' + '</tr>'
								});
			}
			//$('#clientListData').empty().append(html);
			document.getElementById("purchasesListData").innerHTML = html;
		}
		
		
		

		
		
		function updatePurchases(){
			data = {};
			data["productId"] = $("#productId").val();
			data["purchasesId"] = $("#purchasesId").val();
			data["productName"] = $("#productName").val();
			data["quantity"] = $("#quantity").val();
			data["rate"] = $("#rate").val();
			var purchasesId = $("#purchasesId").val();
			$.ajax({
				type : "post",
				url : "updatePurchases.htm",
				data : data,
				time : 1000,
				success : function(response){
					$("#purchasesId").val("");
					data = {};
					resJSON = JSON.parse(response);
					if (response != null) {
						if (resJSON.status == "ERROR") {
							$("#purchasesMsg").text(resJSON.message);
							$("#purchasesMsg").show();
							$("#purchasesMsg").fadeOut(15000);
						} else {
							$("#purchasesMsg").text('Updated Sucessfully');
							$("#purchasesMsg").show();
							$("#purchasesMsg").fadeOut(15000);
							listPurchases();
						}
					}
				},
				error : function(e) {
					$("#btn-save").prop("disabled", false);
				}
			});
		}
		function showVendorData(response){
			serviceUnitArrayVendor = {};
			var html = "<option value=''>-- Select --</option>";
			if (response != undefined && response.length > 0) {
				$.each(response, function(i, datObj) {
					serviceUnitArrayVendor[datObj.vendorId] = datObj;
					html = html + '<option value="' + datObj.vendorId + '">'
							+ datObj.companyName + '</option>';
				});
			}
			$('#vendorId').empty().append(html);
		}
		
		function populateVendorData(vendorId){
			var vendorId = $("#vendorId").val();
			var addressFull = "";
			var contactPerson = serviceUnitArrayVendor[vendorId].contactPerson;
			if(contactPerson.length > 0){
				if(addressFull.length > 0){
					addressFull = addressFull + ", " + contactPerson;
				}else{
					addressFull = addressFull + " " + contactPerson;
				}
			}
			var address = serviceUnitArrayVendor[vendorId].address
			if(address.length > 0){
				if(addressFull.length >0){
					addressFull = address + " , "+address;
				}else{
					addressFull = addressFull + " " + address;
				}
			}
			var mobile = serviceUnitArrayVendor[vendorId].mobile;
			if(mobile.length >0){
				if(addressFull .length >0){
					addressFull = address + " ,mobile:"+mobile;
				}else{
					addressFull = addressFull + " "+mobile;
				}
			}
			var email = serviceUnitArrayVendor[vendorId].email;
			if(email .length >0){
				if(addressFull . length>0){
					addressFull = address + ",email:"+email;
				}else{
					addressFull = addressFull+" "+email;
				}
			}
			var pincode = serviceUnitArrayVendor[vendorId].pincode;
			if(pincode.length>0){
				if(addressFull.length>0){
					addressFull = address +" -"+pincode;
				}else{
					addressFull = address + " "+pincode;
				}
			}
			$('#disCompanyName').text(
					serviceUnitArrayVendor[vendorId].companyName);
			$('#disPurchaserAddress').text(addressFull);
			$('#disPurchaserCode').text(
					serviceUnitArrayVendor[vendorId].state);
			$('#disPurchaserGSTN').text(
					serviceUnitArrayVendor[vendorId].gstn);
			$('#disPurchaserState').text(
					serviceUnitArrayVendor[vendorId].state);
		}

		/* function showPurchaserData(response) {
			serviceUnitArrayPurchaser = {};
			var html = "<option value=''>-- Select --</option>";
			if (response != undefined && response.length > 0) {
				$.each(response, function(i, datObj) {
					serviceUnitArrayPurchaser[datObj.purchaserId] = datObj;
					html = html + '<option value="' + datObj.purchaserId + '">'
							+ datObj.companyName + '</option>';
				});
			}
			$('#purchaserId').empty().append(html);
		}

		function populatePurchaserData(purchaserId) {
			var purchaserId = $('#purchaserId').val();
			var addressFull = "";
			var contactName = serviceUnitArrayPurchaser[purchaserId].contactName;
			if (contactName.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + ", " + contactName;
				} else {
					addressFull = addressFull + " " + contactName;
				}
			}
			 var mobileNo = serviceUnitArrayPurchaser[purchaserId].mobileNo;
			if (mobileNo.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + ", mobile:" + mobileNo;
				} else {
					addressFull = addressFull + " " + mobileNO;
				}
			}
			var emailID = serviceUnitArrayPurchaser[purchaserId].emailID;
			if (emailID.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + ", " + emailID;
				} else {
					addressFull = addressFull + " " + emailID;
				}
			} 
			var address = serviceUnitArrayPurchaser[purchaserId].address;
			if (address.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + ", " + address;
				} else {
					addressFull = addressFull + " " + address;
				}
			}
			var pincode = serviceUnitArrayPurchaser[purchaserId].pincode;
			;
			if (pincode.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + "- " + pincode;
				} else {
					addressFull = addressFull + " " + pincode;
				}
			}


			$('#disCompanyName').text(
					serviceUnitArrayPurchaser[purchaserId].companyName);
			$('#disPurchaserAddress').text(addressFull);
			$('#disPurchaserCode').text(
					serviceUnitArrayPurchaser[purchaserId].state);
			$('#disPurchaserGSTN').text(
					serviceUnitArrayPurchaser[purchaserId].gstNumber);
			$('#disPurchaserState').text(
					serviceUnitArrayPurchaser[purchaserId].state);
			getShippingByPurchaserId();
 
			if(clientInfo.state == serviceUnitArrayPurchaser[purchaserId].state){
				
				
				
				$("#cGST").show();
				$("#sGST").show();
				$("#iGST").hide();
				$("#cGSTRate").show();
				$("#sGSTRate").show();
				$("#iGSTRate").hide();
				$("#cGSTAmount").show();
				$("#sGSTAmount").show();
				$("#cgstrate").show();
				$("#sgstrate").show();
				$("#igstrate").hide();
				$("#cgstamount").show();
				$("#sgstamount").show();
				$("#igstamount").hide();
				$("#iGSTAmount").hide();
				$("#hideCgst").show();
				$("#hideSgst").show();
				$("#hideIgst").hide();
				$("#aa").show();
				$("#bb").show();
				$("#cc").hide();
				$("#totalSgst").show();
				$("#totalCgst").show();
				$("#totalIgst").hide();
				$("#totalCgstAdd").show();
				$("#totalSgstAdd").show();
				$("#addCGST").show();
				$("#addSGST").show();
				$("#addIGST").hide();
				
			}else{
				$("#cGST").hide();
				$("#sGST").hide();
				$("#iGST").show();
				$("#cGSTRate").hide();
				$("#sGSTRate").hide();
				$("#iGSTRate").show();
				$("#cgstamount").hide();
				$("#sgstamount").hide();
				$("#cgstrate").hide();
				$("#sgstrate").hide();
				$("#igstrate").show();
				$("#igstamount").show();
				$("#totalCgst").hide();
				$("#totalSgst").hide();
				$("#cGSTAmount").hide();
				$("#sGSTAmount").hide();
				$("#iGSTAmount").show();
				$("#hideCgst").hide();
				$("#hideSgst").hide();
				$("#hideIgst").show();
				$("#totalIgst").show();
				$("#aa").hide();
				$("#bb").hide();
				$("#cc").show();
				$("#totalCgstAdd").hide();
				$("#totalSgstAdd").hide();
				$("#addCGST").hide();
				$("#addSGST").hide();
				$("#addIGST").show();
			}
			
		} */

		 function getShippingData(purchaserId) {
			data = {};
			data["purchaserId"] = purchaserId;
			$.ajax({
				type : "POST",
				url : "listShippings.htm",
				data : data,
				success : function(response) {
					resJSON = JSON.parse(response);
					if (response != null) {
						if (resJSON.status == "ERROR") {

						} else {
							//showShippingData(resJSON);
						}
					}
				},
				error : function(e) {

				}
			});
		} 

		

		
		
		
		
		
		$("#purchasesForm")
				.validate(
						{
							rules : {

								productName : {
									required : true,
									minlength : 2,
									alpha : true
								},
								quantity : {
									required : true,

									number : true
								},
								rate : {
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
								quantity : {
									required : "Please enter Quantity",
									number : "Please enter numbers Only"
								},
								rate : {
									required : "Please enter Rate",
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

		function newBillClear() {
			$("#purchasesForm")[0].reset();
			$('#btnProdSave').text("Add");
		}
		function generateBill(){
			var a=$("#billCartId").val();
			console.log($("#billCartId").val());
			
			$.ajax({
				type : "POST",
				url : "printBill.htm",
				data : "billCartId= "+$("#billCartId").val(),
				time : 1000,
				dataType : 'json',
				success : function(response) {
					console.log(response);
					window.location.href = "generateBill";
				},
				error : function(e) {
				}

			});
		}
		 function printBill(){
			
			console.log($('#purchaserId').val());
			console.log($('#shippingId').val());
			
			//alert("in to print bill shipping shippingId   "+shippingId);
			
			if($('#purchaserId').val() == ""){
				//alert("select purchaser data");
				return false;
			}else if($('#shippingId').val() == ""){
				//alert("select shipping data");
				return false;
			}
			
			
			var frm_dynActions = document.getElementsByName('dynActions');

			for (var i=0; i < frm_dynActions.length; i++){ 
				frm_dynActions[i].style.display = 'none';
			} 
			
			
			//alert('printBill');
			$('#newbill').hide();
			$('#billForm').hide();
			$('#menu.jsp').hide();
			$('#action').hide();
			$('#consignment').hide();
			$('#page-title').hide();
			$('#editBillDetailsCart').hide();
			$('#top_header').hide();
			$('#editAction').hide();
			$('#deleteAction').hide();
			$('#headerUser').hide();
			$('#email_id').hide();
			$('#shipment').hide();
			$('#billtoparty').hide();
			$('#shiptoparty').hide();
			$('#bill').hide();
			$('#cancel').hide();
			$('#footer').hide();
			//$('#prtBtn').hide();
			$('#image').hide();
			
			 window.print();

		} 
		
	</script>
</body>
</html>
