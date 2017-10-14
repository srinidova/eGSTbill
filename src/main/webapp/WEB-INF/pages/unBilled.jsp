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
				<div class="col-md-12">
					<form id="purchaserForm">
						<fieldset>
							<legend>Unbilled</legend>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Bill No</label> <input
										class="form-control" type="text" id="searchBillno" name="searchBillno"
										maxlength="15" placeholder="" onkeyup="searchUnbilled();">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Bill Date</label> <input
										class="form-control" type="text" id="searchBillDate" name="searchBillDate"
										maxlength="15" placeholder="" onkeyup="searchUnbilled();">
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
												value="addPurchaser" onClick="purchaseFormValidate();">Search</button>
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
							<legend>UnBilled List</legend>
							<div class="col-md-12">
								<div class="table-responsive">
									<table class=" table table-responsive table-bordered ">
										<thead>
											<tr>
												<th class="text-center">Bill No</th>
												<th class="text-center">totalQuantity</th>
												<th class="text-center">totalAmount</th>
												<th class="text-center">totalDiscount</th>
												<th class="text-center">taxValue</th>
												<th class="text-center">totalCgst</th>
												<th class="text-center">totalSgst</th>
												<th class="text-center">totalIgst</th>
												<th class="text-center">grandTotal</th>
												<th class="text-center">totalBeforeTax</th>
												<th class="text-center">totalTax</th>
												<th class="text-center">totalAfterTax</th>
												<th class="text-center">billDate</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody id="unbillDataListData">
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
	
	
	var lstBillCart = '${BILLCART}';
	var lstPurchasers = '${LISTPURCHASERS}';
	
	console.log(lstBillCart);
	$(document).ready(function() {
		showUnBilledData(JSON.parse(lstBillCart));
	});
	
	
	function showUnBilledData(response) {
		//alert("in to showUnBilledData");
		serviceUnitArrayBillcart = {};
		var html = '';
		if (response != undefined && response.length > 0) {
			$
					.each(
							response,
							function(i, datObj) {
								serviceUnitArrayBillcart[datObj.billCartId] = datObj;
								html = html
										+ '<tr>'
										+ '<td class="text-center">'
										+ datObj.billNo
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalQuantity
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalAmount
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalDiscount
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.taxValue
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalCgst
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalSgst
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalIgst
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.grandTotal
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalBeforeTax
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalTax
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.totalAfterTax
										+ '</td>'
										+ '<td class="text-center">'
										+ datObj.billDate
										+ '</td>'
										+ '<td class="text-center">'
										+ '<a id="'
										+ datObj.billCartId
										+ '" class="btn btn-info btn-xs" onclick="editProduct(this.id)">'
										+ '<span class="glyphicon glyphicon-edit"></span>'
										+ '</a>'
										+ '<a id="'
										+ datObj.billCartId
										+ '" class="btn btn-danger btn-xs" onclick="deleteProduct(this.id)">'
										+ '<span class="glyphicon glyphicon-remove"></span>'
										+ '</a>' + '</td>' + '</tr>'
							});
		}
		$('#unbillDataListData').empty().append(html);
		//document.getElementById("unbillDataListData").innerHTML = html;
		//document.getElementById("programListData").innerHTML = html;
	}
	
	function searchUnbilled(){
		//alert("1.in to serach unbilled");
		document.getElementById("unbillDataListData").innerHTML = "";
		//alert("2.in to serach unbilled");
		UnBilledData = {};
		UnBilledData["searchBillno"] = $("#searchBillno").val();
		UnBilledData["searchBillDate"] = $("#searchBillDate").val();
		//alert("3.in to serach unbilled");
		//alert("4.unbillDataListData"+unbillDataListData);
		$.ajax({
			type : "POST",
			url : "searchUnbilled.htm",
			data : UnBilledData,
			success : function(response) {
				var resJSON = JSON.parse(response);
				//showUnBilledData(data);
				showUnBilledData(resJSON);

			},
			error : function(e) {
				$("#btn-save").prop("disabled", false);
			}
		});
	}
	</script>
</body>
</html>
