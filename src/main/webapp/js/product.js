function showProductData(response) {
	serviceUnitArray = {};
	var html = '';
	if (response != undefined && response.length > 0) {
		$
				.each(
						response,
						function(i, datObj) {
							serviceUnitArray[datObj.productId] = datObj;
							html = html
									+ '<tr>'
									+ '<td class="text-center">'
									+ datObj.productName
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.mrp
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.hsnCode
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.purchaserPrice
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.mrp
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.discount
									+ '</td>'
									+ '<td class="text-center">'
									+ '<a id="'
									+ datObj.productId
									+ '" class="btn btn-info btn-xs" onclick="editProduct(this.id)">'
									+ '<span class="glyphicon glyphicon-edit"></span>'
									+ '</a>'
									+ '<a id="'
									+ datObj.productId
									+ '" class="btn btn-danger btn-xs" onclick="deleteProduct(this.id)">'
									+ '<span class="glyphicon glyphicon-remove"></span>'
									+ '</a>' + '</td>' + '</tr>'
						});
	}
	$('#newsListData').empty().append(html);
}

function editProduct(productId) {
	$('#productId').val(productId);
	$('#productName').val(serviceUnitArray[productId].productName);
	$('#hsnCode').val(serviceUnitArray[productId].hsnCode);
	$('#uom').val(serviceUnitArray[productId].uom);
	$('#quantity').val(serviceUnitArray[productId].quantity);
	$('#purchaserPrice').val(serviceUnitArray[productId].purchaserPrice);
	$('#mrp').val(serviceUnitArray[productId].mrp);
	$('#salePrice').val(serviceUnitArray[productId].salePrice);
	$('#discount').val(serviceUnitArray[productId].discount);
	$('#cgst').val(serviceUnitArray[productId].cGST);
	$('#sgst').val(serviceUnitArray[productId].sGST);
	$('#igst').val(serviceUnitArray[productId].iGST);
	$('#productType').val(serviceUnitArray[productId].productType);
}

function deleteProduct(id) {
	var count = 0;
	$.ajax({
		type : "POST",
		url : "deleteProduct.json",
		data : "productId=" + id,
		success : function(response) {
			if (response != null) {
				$("#prodFrmMsg").text("Product deleted sucessfully");
				$("#prodFrmMsg").show();
				$("#prodFrmMsg").fadeOut(15000);
				showProductData(response);
			}
		},
		error : function(e) {
		}
	});
}
function prodFormValidate() {
	var productId = $("#productId").val();
	if ($("#productForm").valid()) {
		if (productId != "") {
			updateProduct();
		} else {
			saveProduct();
		}
	}
}
function productClear() {
	$("#productForm")[0].reset();
}
$("#productForm")
		.validate(
				{
					rules : {

						productName : {
							required : true,
							minlength : 2,
							alpha : true
						},
						hsnCode : {
							required : true,

							number : true
						},
						uom : {
							required : true,

							number : true
						},
						quantity : {
							required : true,

							number : true
						},
						purchaserPrice : {
							required : true,

							number : true
						},
						mrp : {
							required : true,

							number : true
						},
						salePrice : {
							required : true,

							number : true
						},
						discount : {
							required : true,

							number : true
						},
						cgst : {
							required : true,

							number : true
						},
						sgst : {
							required : true,

							number : true
						},
						igst : {
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
						hsnCode : {
							required : "Please enter hsnCode number",
							number : "Please enter numbers Only"
						},
						uom : {
							required : "Please enter Uom",
							number : "Please enter numbers Only"
						},
						quantity : {
							required : "Please enter quantity",
							number : "Please enter numbers Only"
						},
						purchaserPrice : {
							required : "Please enter Purchaser Price",
							number : "Please enter numbers Only"
						},
						mrp : {
							required : "Please enter Mrp",
							number : "Please enter numbers Only"
						},
						salePrice : {
							required : "Please enter SalePrice",
							number : "Please enter numbers Only"
						},
						discount : {
							required : "Please enter Discount",
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
						igst : {
							required : "Please enter IGST",
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

function saveProduct() {
	data = {};
	data["productId"] = $("#productId").val();
	data["productName"] = $("#productName").val();
	data["hsnCode"] = $("#hsnCode").val();
	data["uom"] = $("#uom").val();
	data["quantity"] = $("#quantity").val();
	data["purchaserPrice"] = $("#purchaserPrice").val();
	data["mrp"] = $("#mrp").val();
	data["salePrice"] = $("#salePrice").val();
	data["discount"] = $("#discount").val();
	data["cGST"] = $("#cgst").val();
	data["sGST"] = $("#sgst").val();
	data["iGST"] = $("#igst").val();
	data["productType"] = $("#productType").val();
	$.ajax({
		type : "POST",
		url : "addProduct.htm",
		data : data,
		success : function(response) {
			resJSON = JSON.parse(response);
			if (response != null) {
				if (resJSON.status == "ERROR") {
					$("#prodFrmMsg").text(resJSON.message);
					$("#prodFrmMsg").show();
					$("#prodFrmMsg").fadeOut(15000);
					$("#productName").val("");
				} else {
					$("#prodFrmMsg").text('Product saved Sucessfully');
					$("#prodFrmMsg").show();
					$("#prodFrmMsg").fadeOut(15000);
					productClear();
					showProductData(resJSON);
				}

			}
		},
		error : function(e) {
			$("#btn-save").prop("disabled", false);
		}
	});
}
function updateProduct() {
	data = {};
	data["productId"] = $("#productId").val();
	data["productName"] = $("#productName").val();
	data["hsnCode"] = $("#hsnCode").val();
	data["uom"] = $("#uom").val();
	data["quantity"] = $("#quantity").val();
	data["purchaserPrice"] = $("#purchaserPrice").val();
	data["mrp"] = $("#mrp").val();
	data["salePrice"] = $("#salePrice").val();
	data["discount"] = $("#discount").val();
	data["cGST"] = $("#cgst").val();
	data["sGST"] = $("#sgst").val();
	data["iGST"] = $("#igst").val();
	data["productType"] = $("#productType").val();
	var productId = $("#productId").val();
	$.ajax({
		type : "POST",
		url : "updateProduct.htm",
		data : data,
		time : 1000,
		success : function(response) {
			$("#productId").val("");
			data = {};
			resJSON = JSON.parse(response);
			if (response != null) {
				if (resJSON.status == "ERROR") {
					$("#prodFrmMsg").text(resJSON.message);
					$("#prodFrmMsg").show();
					$("#prodFrmMsg").fadeOut(15000);
				} else {
					$("#prodFrmMsg").text('Updated Sucessfully');
					$("#prodFrmMsg").show();
					$("#prodFrmMsg").fadeOut(15000);
					productClear();
					showProductData(resJSON);
				}
			}

		},
		error : function(e) {
			$("#btn-save").prop("disabled", false);
		}

	});
}