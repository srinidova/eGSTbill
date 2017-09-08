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
						<form id="billForm" onsubmit="return false;">
							<fieldset>
								<legend>New Bill</legend>
								<div class="col-md-4">
									<div class="form-group">
										<label for="">Product Name</label> <select id="productId"
											name="productId" class="form-control"
											onchange="populateProdData();">
										</select> <input type="hidden" class="form-control" id="productName"
											name="productName"> <input type="hidden"
											class="form-control" id="billDetailsCartId"
											name="billDetailsCartId"> <input type="hidden"
											id="billCartId" name="billCartId">
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
											id="salePrice" name="salePrice" type="text" placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="">CGST</label> <input class="form-control"
											id="cgst" name="cgst" type="text" placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="">SGST</label> <input class="form-control"
											id="sgst" name="sgst" type="text" placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="">Discount</label> <input class="form-control"
											id="discount" name="discount" type="text" placeholder="">
									</div>
								</div>
								<div class="col-md-10">
									<div id="addBillMsg"
										style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
										Sucessfully</div>
								</div>
								<div class="col-md-3 pull-right">
									<div class="buttons">
										<ul>
											<li>
												<button class="btn btn-primary"
													onClick="billFormValidate();">Add</button>
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
							<div class="col-md-12">
								<div class=" table-responsive">
									<table class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Document No :</th>
												<th>Against invoice :</th>
											</tr>
											<tr>
												<th>Date Of Issue :</th>
												<th>Date Of invoice :</th>
											</tr>
											<tr>
												<th>State :
													<table style="float: right; width: 25%;">
														<tr>
															<th>Code :</th>
														</tr>
													</table>
												</th>
												<th></th>
											</tr>
											<tr>
												<th style="background: #e8e8e8; color: #000 !important;">
													<form class="form-inline">
														<div class="form-group ">
															<label for="email">Bill to Party</label> <select
																id="purchaserId" class="form-control party_select_box"
																onchange="populatePurchaserData();">
															</select>
														</div>
													</form>
												</th>
												<th style="background: #e8e8e8; color: #000 !important;">
													<form class="form-inline">
														<div class="form-group ">
															<label for="email"> Ship to Party</label> <select
																id="shippingId" onchange="populateShippingData();"
																class="form-control party_select_box">
																<option value="">--Select--</option>
															</select>
														</div>
													</form>
												</th>
											</tr>
											<tr>
												<th>Name :<span id="disCompanyName"></span></th>
												<th>Name :<span id="disShippingName"></span></th>
											</tr>
											<tr>
												<td style="height: 60px; width: 50%;"><b>Address :
														<span id="disPurchaserAddress"></span>
												</b></td>
												<td style="height: 60px; width: 50%;"><b>Address :<span
														id="disShippingAddress"></span>
												</b></td>
											</tr>
											<tr>
												<th>GSTIN :<span id="disPurchaserGSTN"></span></th>
												<th>GSTIN :</th>
											</tr>
											<tr>
												<th>State :
													<table style="float: right; width: 25%;">
														<tr>
															<th>Code :<span id="disPurchaserCode"></span></th>
														</tr>
													</table>
												</th>
												<th>State : <span id="disShippingState"></span>
													<table style="float: right; width: 25%;">
														<tr>
															<th>Code :</th>
														</tr>
													</table>
												</th>
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
												<th class="text-center">S.No</th>
												<th class="text-center">Product Description</th>
												<th class="text-center">HSN Code</th>
												<th class="text-center">UOM</th>
												<th class="text-center">Qty</th>
												<th class="text-center">Rate</th>
												<th class="text-center">Amount</th>
												<th class="text-center">Discount</th>
												<th class="text-center">Taxable Value</th>
												<th colspan="2" style="text-align: center;">CGST</th>
												<th colspan="2" style="text-align: center;">SGST</th>
												<th class="text-center">Total</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tr>
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
												style="border-bottom: none !important; background: #1d76bb; color: #fff;">Rate</th>
											<th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;">Amount</th>
											<th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;">Rate</th>
											<th
												style="border-bottom: none !important; background: #1d76bb; color: #fff;">Amount</th>
											<th style="border: none !important;"></th>
										</tr>
										<tbody id="billListData">
										</tbody>
										<tr>
											<th colspan="4" style="text-align: center;">Total</th>
											<th style="text-align: right;"><div id="totalQuantity"></div></th>
											<th style="text-align: right;"></th>
											<th style="text-align: right;"><div id="totalAmount"></div></th>
											<th style="text-align: right;"><div id="totalDiscount"></div></th>
											<th style="text-align: right;"><div id="taxValue"></div></th>
											<th style="text-align: right;"></th>
											<th style="text-align: right;"><div id="totalCgst"></div></th>
											<th style="text-align: right;"></th>
											<th style="text-align: right;"><div id="totalSgst"></div></th>
											<th style="text-align: right;"><div id="grandTotal"></div></th>
										</tr>
										<tr>
											<th colspan="9" style="text-align: center;">Total Amount
												In Words</th>
											<th colspan="4" style="text-align: left;">Total Amount
												Before Tax</th>
											<th style="text-align: right;"><div id="totalBeforeTax"></div></th>
										</tr>
										<tr>
											<th colspan="9"
												style="text-align: center; border: none !important;"></th>
											<th colspan="4" style="text-align: left;">Add : CGST</th>
											<th style="text-align: right;"><div id="totalCgstAdd"></th>
										</tr>
										<tr>
											<th colspan="9"
												style="text-align: center; border: none !important;"></th>
											<th colspan="4" style="text-align: left;">Add : SGST</th>
											<th style="text-align: right;"><div id="totalSgstAdd"></th>
										</tr>
										<tr>
											<th colspan="9"
												style="text-align: center; border: none !important;"></th>
											<th colspan="4" style="text-align: left;">Total Tax
												Amount</th>
											<th style="text-align: right;"><div id="totalTax"></div></th>
										</tr>
										<tr>
											<th colspan="9"
												style="text-align: center; border: none !important;"></th>
											<th colspan="4"
												style="text-align: left; border-bottom: none !important;">Total
												Amount after Tax</th>
											<th style="text-align: right; border: none !important;"><div
													id="totalAfterTax"></div></th>
										</tr>
										</thead>
									</table>
								</div>
							</div>
							<div class="col-md-12">
								<div class="shipment">
									<a href="javascript:void()"
										onClick="$('.shipment_new_bill').toggle()">Shipment</a>
								</div>
							</div>

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

							<div class="col-md-3 pull-right">
								<div class="buttons" style="margin-top: 1em;">
									<ul>
										<li>
											<button class="btn btn-primary ">Bill</button>
										</li>
										<li>
											<button class="btn btn-primary">Consignment</button>
										</li>
										<li>
											<button class="btn btn-primary">Cancel</button>
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
		//var lstShipping = '${LISTSHIPPING}';
		
		
		//console.log(lstShipping);
		
		serviceUnitArrayShipping = {};
		//alert("lstOrders.length=="+lstOrders.length);

		$(document).ready(function() {

			//alert("in to listShipping==="+lstShipping);
			if (lstOrders != undefined && lstOrders.length > 0) {
				showProductData(JSON.parse(lstOrders));
			}
/* 			if(lstShipping != undefined && lstShipping.length >0){
				showShippingData(JSON.parse(lstShipping));
				//alert("lstShipping=="+lstShipping);
				$('#purchaserId').val(lstShipping);
				populateShippingSelect() ;
			} */
			showPurchaserData(JSON.parse(lstPurchasers));
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

		function populateProdData(productId) {
			var productId = $('#productId').val();
			$('#productName').val(serviceUnitArray[productId].productName);
			$('#salePrice').val(serviceUnitArray[productId].salePrice);
			$('#cgst').val(serviceUnitArray[productId].cGST);
			$('#sgst').val(serviceUnitArray[productId].sGST);
			$('#discount').val(serviceUnitArray[productId].discount);
		}

		function billFormValidate() {
			if ($("#billForm").valid()) {
				var billDetailsCartId = $("#billDetailsCartId").val();
				if (billDetailsCartId != "") {
					updateBillDetailsCart();
				} else {
					billProduct();
				}
			}
		}
		function billProduct() {
			data = {};
			data["productId"] = $("#productId").val();
			data["productName"] = $("#productName").val();
			data["quantity"] = $("#quantity").val();
			data["salePrice"] = $("#salePrice").val();
			data["cGST"] = $("#cgst").val();
			data["sGST"] = $("#sgst").val();
			data["discount"] = $("#discount").val();
			data["uom"] = serviceUnitArray[$("#productId").val()].uom;
			data["hsnCode"] = serviceUnitArray[$("#productId").val()].hsnCode;
			$.ajax({
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
					//console.log("after added to cart error response=="+ response);
					//alert("after added to cart error response==" + response);
				}
			});
		}

		function showBilldata(response) {
			var lstBillDetCart = response[0].lstBillDetCart;
			//alert(lstBillDetCart);
			serviceUnitArrayBill = {};
			var html = '';
			if (lstBillDetCart != undefined && lstBillDetCart.length > 0) {
				$
						.each(
								lstBillDetCart,
								function(i, datObj) {
									serviceUnitArrayBill[datObj.billDetailsCartId] = datObj;
									var j = i + 1;
									html = html
											+ '<tr>'
											+ '<td style="text-align: left;">'
											+ j
											+ '</td>'
											+ '<td style="text-align: left;">'
											+ datObj.productName
											+ '</td>'
											+ '<td style="text-align: left;">'
											+ datObj.hsnCode
											+ '</td>'
											+ '<td style="text-align: left;">'
											+ datObj.uom
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.quantity
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.rate
											+ '</td>'
											+ '<td class="text-center">'
											+ datObj.amount
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.discount
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.taxableValue
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.cgstRate
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.cgstAmount
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.sgstRate
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.sgstAmount
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ datObj.total
											+ '</td>'
											+ '<td style="text-align: right;">'
											+ '<a id="'
											+ datObj.billDetailsCartId
											+ '" class="btn btn-info btn-xs" onclick="editBillDetailsCart(this.id)">'
											+ '<span class="glyphicon glyphicon-edit"></span>'
											+ '</a>'
											+ '<a id="'
											+ datObj.billDetailsCartId
											+ '" class="btn btn-danger btn-xs" onclick="deleteBillDetailsCart(this.id)">'
											+ '<span class="glyphicon glyphicon-remove"></span>'
											+ '</a>' + '</td>' + '</tr>'
								});
			}
			$('#billListData').empty().append(html);
			$('#billCartId').text(response[0].billCartId);
			$('#totalQuantity').text(response[0].totalQuantity);
			$('#totalAmount').text(response[0].totalAmount);
			$('#totalDiscount').text(response[0].totalDiscount);
			$('#taxValue').text(response[0].taxValue);
			$('#totalCgst').text(response[0].totalCgst);
			$('#totalSgst').text(response[0].totalSgst);
			$('#grandTotal').text(response[0].grandTotal);
			$('#totalBeforeTax').text(response[0].totalBeforeTax);
			$('#totalCgstAdd').text(response[0].totalCgst);
			$('#totalSgstAdd').text(response[0].totalSgst);
			$('#totalTax').text(response[0].totalTax);
			$('#totalAfterTax').text(response[0].totalAfterTax);
		}

		function editBillDetailsCart(billDetailsCartId) {
			//alert("in to edit BillDetailsCart"+ serviceUnitArrayBill[billDetailsCartId].productId);
			$('#billDetailsCartId').val(billDetailsCartId);
			$('#productId').val(
					serviceUnitArrayBill[billDetailsCartId].productId);
			$('#productName').val(
					serviceUnitArrayBill[billDetailsCartId].productName);
			$('#quantity')
					.val(serviceUnitArrayBill[billDetailsCartId].quantity);
			$('#salePrice').val(serviceUnitArrayBill[billDetailsCartId].rate);
			$('#cgst').val(serviceUnitArrayBill[billDetailsCartId].cgstRate);
			$('#sgst').val(serviceUnitArrayBill[billDetailsCartId].sgstRate);
			$('#discount')
					.val(serviceUnitArrayBill[billDetailsCartId].discount);
		}
		function deleteBillDetailsCart(id) {
			//alert("in to delete BillDetailsCart" + id);
			var count = 0;
			$.ajax({
				type : "POST",
				url : "deleteBillDetailsCart.json",
				data : "billDetailsCartId=" + id,
				dataType : 'json',
				success : function(response) {
					if (response != null) {
						$("#addBillMsg").text("Deleted sucessfully");
						$("#addBillMsg").show();
						$("#addBillMsg").fadeOut(5000);
						showBilldata(response);
					}
				},
				error : function(e) {
				}
			});
		}
		function updateBillDetailsCart() {
			//alert("in to update BillDetailsCart" + productId);
			data = {};
			data["productId"] = $("#productId").val();
			data["billDetailsCartId"] = $("#billDetailsCartId").val();
			data["productName"] = $("#productName").val();
			data["quantity"] = $("#quantity").val();
			data["salePrice"] = $("#salePrice").val();
			data["cGST"] = $("#cgst").val();
			data["sGST"] = $("#sgst").val();
			data["discount"] = $("#discount").val();

			$.ajax({
				type : "POST",
				url : "updateBillDetailsCart.htm",
				data : "jsondata= " + JSON.stringify(data),
				time : 1000,
				dataType : 'json',
				success : function(response) {
					$("#billDetailsCartId").val("");
					data = {};
					newBillClear();
					$('#billListData').empty();
					$("#addBillMsg").text('Updated Sucessfully');
					$("#addBillMsg").show();
					$("#addBillMsg").fadeOut(5000);
					showBilldata(response);
				},
				error : function(e) {
				}

			});
		}

		function showPurchaserData(response) {
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
					addressFull = addressFull + ", " + mobileNo;
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
			var state = serviceUnitArrayPurchaser[purchaserId].state;
			if (state.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + ", " + state;
				} else {
					addressFull = addressFull + " " + state;
				}
			}
			var pincode = serviceUnitArrayPurchaser[purchaserId].pincode;
			;
			if (pincode.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + ", " + pincode;
				} else {
					addressFull = addressFull + " " + pincode;
				}
			}

			//alert("in to populate purchaser data===" + purchaserId);

			$('#disCompanyName').text(
					serviceUnitArrayPurchaser[purchaserId].companyName);
			$('#disPurchaserAddress').text(addressFull);
			$('#disPurchaserCode').text(
					serviceUnitArrayPurchaser[purchaserId].state);
			$('#disPurchaserGSTN').text(
					serviceUnitArrayPurchaser[purchaserId].gstNumber);
			getShippingByPurchaserId();
			//getShippingData(purchaserId);

		}

		 function getShippingData(purchaserId) {
		//alert("in to getShippingData==="+purchaserId);
			data = {};
			data["purchaserId"] = purchaserId;
			//alert("in to get shipping data===" + purchaserId);
			$.ajax({
				type : "POST",
				url : "listShippings.htm",
				data : data,
				success : function(response) {
					resJSON = JSON.parse(response);
					//alert("getShippingData ---------- resJSON====" + resJSON);
					if (response != null) {
						if (resJSON.status == "ERROR") {

						} else {
							showShippingData(resJSON);
						}
					}
				},
				error : function(e) {

				}
			});
		} 

		function showShippingData(response) {
			var html = "<option value=''>-- Select --</option>";
			if (response != undefined && response.length > 0) {
				$.each(response, function(i, datObj) {
					serviceUnitArrayShipping[datObj.shippingId] = datObj;
					html = html + '<option value="' + datObj.shippingId + '">'
							+ datObj.name + '</option>';
				});
			}
			$('#shippingId').empty().append(html);
			//console.log("show in to ===" + serviceUnitArrayShipping);
		}

		function populateShippingData(purchaserId) {
			var shippingId = $('#shippingId').val();
			var purchaserId = $('#purchaserId').val();
			//alert("in to populateShippingData=shippingId=="+shippingId);
			//alert("in to populateShippingData=purchaserId=="+purchaserId);
			var addressFull = "";
			var address = serviceUnitArrayShipping[shippingId].address;
			if (address.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + ", " + address;
				} else {
					addressFull = addressFull + " " + address;
				}
			}
			var pincode = serviceUnitArrayShipping[shippingId].pin;
			if (pincode.length > 0) {
				if (addressFull.length > 0) {
					addressFull = addressFull + ", " + pincode;
				} else {
					addressFull = addressFull + " " + pincode;
				}
			}
			$('#disShippingName').text(
					serviceUnitArrayShipping[shippingId].name);
			$('#disShippingAddress').text(addressFull);
			$('#disShippingState').text(
					serviceUnitArrayShipping[shippingId].state);
			getShippingData(purchaserId);

		}
		
/* 		function populateShippingSelect() {
			var purchaserId = $('#purchaserId').val();
			getShippingByPurchaserId(purchaserId);
		} */
		
		function getShippingByPurchaserId() {
			var purchaserId = $('#purchaserId').val();
			//alert("in to getShippingByPurchaserId==="+purchaserId);
			$.ajax({
				type : "POST",
				url : "getShippingsBypurchaserId.json",
				data : "purchaserId=" + purchaserId,
				success : function(response) {
					if (response != null) {
						showShippingData(response);
					}
				},
				error : function(e) {
				}
			})

		}
		$("#billForm")
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
								salePrice : {
									required : true,

									number : true
								},
								sgst : {
									required : true,

									number : true
								},
								cgst : {
									required : true,

									number : true
								},
								discount : {
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
								salePrice : {
									required : "Please enter Rate",
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
								discount : {
									required : "Please enter Discount",
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
			//alert("---0----newBillClear-------");
			//$("#billForm").data('validator').resetForm();
			$("#productId").val("");
			$("#quantity").val("");
			$("#salePrice").val("");
			$("#sgst").val("");
			$("#cgst").val("");
			$("#discount").val("");
			//alert("---2----newBillClear-------");
		}
	</script>
</body>
</html>
