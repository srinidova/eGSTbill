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
									+ datObj.hsnCode
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.purchaserPrice
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.cGST
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.iGST
									+ '</td>'
									+ '<td class="text-center">'
									+ datObj.mrp
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
	$('#clientListData').empty().append(html);
}

function editProduct(productId) {
	$('#btnProdSave').text("Update");
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

function productClear() {
	$("#productForm")[0].reset();
	$('#btnProdSave').text("Add");
}

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
	data["categoryId"] = $("#categoryId").val();
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



	function getProductsByClientId(sClientId) {
	//alert("in to getProductsByClientId ==="+sClientId);
	$.ajax({
		type : "POST",
		url : "getProductsByClientId.json",
		data : "sClientId=" + sClientId,
		success : function(response) {
			if (response != null) {
				showProductData(response)
			}
		},
		error : function(e) {
		}
	})

}
	
	function getCatgeoryByclientId(sClientId){
		 $('#sClientId').val();
		 $('#categoryId').val();
		$.ajax({
			type : "POST",
			url : "getCatgeoryByclientId.json",
			data : "sClientId=" + sClientId,
			success : function(response) {
				if (response != null) {
					showCategoryData(response);
				}
			},
			error : function(e) {
			}
		})
	}