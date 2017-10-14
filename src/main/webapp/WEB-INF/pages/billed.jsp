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
											<!-- <tr>
												<th>Document No :</th>
												<th>Against invoice :</th>
											</tr> -->
											<tr>
												<th >Bill No :<span id="billNo">
												</span></th>
												<th>Date Of invoice :<span ></span>
												<input type="text" name="billDate" id="billDate">
											 
				</th>
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
															<th>Code : <span id="disShippingGstnCode"></span></th>
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
												<th class="text-center" id="billNo">S.No</th>
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
											<th colspan="9" style="text-align: center;"><div id="wordsAmount"></div>
												</th>
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
	
	$(document).ready(function() {
		var generateBill ='${printBill}';
		var printBill=JSON.parse(generateBill);
	          console.log(printBill);
		});

	</script>
</body>
</html>
