var serviceUnitArrayBill ={};
var purchaseArr = [];
function showBillDetailsData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove();// onclick that time go to controll then fecth the data 
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	if(response != undefined && response.length > 0){
		var productArr = response[0].listBillingInfoCart;
		purchaseArr = response[0].listPurchase;
		if(productArr != null){
			$.each(productArr,function(i, catObj) {
				serviceUnitArray[catObj.billDetailsId] = catObj;
				 var tblRow ="<ul class=''>"
					 	+ "<li class='five-box'  title='"+catObj.billDetailsId+"'>"
						+ catObj.billDetailsId  
						+"</li>"
						+ "<li class='bil-prod-box'  title='"+catObj.productName+"'>"
						+ catObj.productName
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.mrp+"'>"
						+ catObj.mrp
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.quantity+"'>"
						+ catObj.quantity
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.rate+"'>"
						+ catObj.rate
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.amount+"'>"
						+ catObj.amount
						+ "</li>"
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billDetailsId
						+ "' onclick='editBill(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						/*+ "<li class='eleven-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billDetailsId
						+ "' onclick='deleteProduct(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
						+ '</li>'*/
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
		}
    	$('#totalMrpDisp').text(response[0].totalMrp);
    	$('#totalQuantityDisp').text(response[0].totalQuantity);
    	$('#totalRateDisp').text(response[0].totalRate);
    	$('#totalAmountDisp').text(response[0].totalAmount);
    	$('#totalAmount').val(response[0].totalAmount);
    	 $('#totalMrp').val(response[0].totalMrp);
		 $('#totalQuantity').val(response[0].totalQuantity);
		 $('#totalRate').val(response[0].totalRate);
		 
		 $('#billId').val(response[0].billId);
		 $('#name').val(response[0].name);
		 $('#discount').val(response[0].discount);
		 $('#phone').val(response[0].phone);
		 $('#address').val(response[0].address);
		 $('#lrNo').val(response[0].lrNo);
		 $('#lrDate').val(response[0].lrDate);
		 $('#orderNo').val(response[0].orderNo);
		 $('#orderDate').val(response[0].orderDate);
		 $('#dispatchedBy').val(response[0].dispatchedBy);
		 $('#dispatchedDate').val(response[0].dispatchedDate);
		 $('#noOfPages').val(response[0].noOfPacks);
		 $('#termsOfPayment').val(response[0].termOfPayment);
		 $('#terms').val(response[0].terms);
		 $('#lrDate').val(response[0].lrDate);
    	
	}
	//paginationTable(3);
}
function showTotalBill(response) {
	$("#totalTable ul").remove();
	$("#totalTable ul li").remove();
	serviceUnitArrayBill = {};
	response = jQuery.parseJSON(response);
	if(response != undefined && response.length > 0){
	$.each(response,function(i, catObj) {
			alert('catObj.billId=='+catObj.billId);
			serviceUnitArrayBill[catObj.billId] = catObj;
			 $('#totalMrpDisp').text(catObj.totalMrp);
			 $('#totalQuantityDisp').text(catObj.totalQuantity);
			 $('#totalRateDisp').text(catObj.totalRate);
			 $('#totalAmountDisp').text(catObj.totalAmount);
			 
			 $('#totalAmount').val(catObj.totalAmount);
			 $('#totalMrp').val(catObj.totalMrp);
			 $('#totalQuantity').val(catObj.totalQuantity);
			 $('#totalRate').val(catObj.totalRate);
			 
			 $('#billId').val(catObj.billId);
			 $('#name').val(catObj.name);
			 $('#discount').val(catObj.discount);
			 $('#phone').val(catObj.phone);
			 $('#address').val(catObj.address);
			 $('#lrNo').val(catObj.lrNo);
			 $('#lrDate').val(catObj.lrDate);
			 $('#orderNo').val(catObj.orderNo);
			 $('#orderDate').val(catObj.orderDate);
			 $('#dispatchedBy').val(catObj.dispatchedBy);
			 $('#dispatchedDate').val(catObj.dispatchedDate);
			 $('#noOfPages').val(catObj.noOfPacks);
			 //$('#packSlipNo').val(catObj.totalAmount);
			 $('#termsOfPayment').val(catObj.termOfPayment);
			 $('#terms').val(catObj.terms);
			 $('#lrDate').val(catObj.lrDate);
			 
			});
	}
	
}

function dataClear(){
	
	 $('#productName').val("");
	 $('#rate').val("");
	 $('#quantity').val("");
	}

	function editBill(id)
	{		 		
		//$('#productId').val(id);
		$('#productId').val( serviceUnitArray[id].productId);
		$('#quantity').val( serviceUnitArray[id].quantity);
		$('#rate').val( serviceUnitArray[id].rate);
		$("#billDetailsId").val(id);
	}
	function deleteProduct(id) {
		var count = 0;
			$.ajax({
						type : "POST",
						url : "deleteBillCart.json",
						data : "id=" + id,
						success: function (response) {
			                 if(response != null ){
			                	 $("#unc1").text("Delete Sucessfully");
			            		   $("#unc1").show();
			                       $("#unc1").fadeOut(5000);
			                       showBillDetailsData(response);
			                	}
			                 },
			             error: function (e) { 
								console.log(e);
			             }
					});
	}

	
	function saveBillProduct(){
		$.ajax({
	             type: "POST",
	             url: "saveBillProduct.htm",
	             data: "jsondata= "+JSON.stringify(data),
	             success: function (response) {
	            	 //resJSON = JSON.parse(response);
	                 if(response != null ){
	                	  //allBillingDetaisCart(resJSON);
	                	 
	                	  showBillDetailsData(response);
	                	  
	                	  $("#unc").text("Save Sucessfully");
	            		   $("#unc").show();
	                       $("#unc").fadeOut(5000);
	                  
	                 }
	            	
	                 },
	             error: function (e) { 
	                 $("#btn-save").prop("disabled", false);
	             }
	             
	             
		}); 
	}