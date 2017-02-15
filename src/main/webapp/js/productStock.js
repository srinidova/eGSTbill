function showProductData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove();
	serviceUnitArray = {};
	if(response != undefined && response.length >0){
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.productId] = catObj;
			
				 var tblRow ="<ul class=''>"
						+ "<li class='nine-box' style='width:300%;' title='"+catObj.productName+"'>"
						+ catObj.productName  
						+ "<li class='five-box' style='width:140%;' title='"+catObj.stock+"' style='width:300%;'>"
						+ catObj.stock
						+ "</li>"
						+ "<li class='five-box' style='width:140%; title='"+catObj.newStock+"' style='width:140%;'>"
						+ catObj.newStock
						+ "</li>"
						+ "<li class='five-box' style='width:140%;' title='"+catObj.oldStock+"' style='width:140%;'>"
						+ catObj.oldStock
						+ "</li>"
						
						+ "<li class='ten-box' style='width:140%;'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.productId
						+ "' onclick='editProductStock(this.id)' id='editId' value='editStock' class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box' style='width:140%;'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.stockId
						+ "' onclick='deleteProductStock(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
						+ '</li>'
						+ "<li class='ten-box' style='width:20%;'><a id='"+catObj.productId+"' onclick='stockDetails(this.id);return false;'><img src='./images/icon2.jpg'></a>"
						+"</li>"
						+ "</li>"
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
	//paginationTable(3);
	}
}
function popupStockData(response){
	$("#dialog tr").remove();
	if(response != undefined && response.length >0){
		var tblRow ="<table cellpadding='5' cellspacing='5' style='border:1px solid black; width: 100%;'>"
			tblRow +="<tr><th style='border:1px solid black; '>Transaction Date</th><th style='border:1px solid black; padding-right: 10%;'>Transaction Type</th><th style='border:1px solid black; padding-right: 9%;'>Quantity</th><th style='border:1px solid black; padding-right: 6%;'>Product Name</th></tr>"
		$.each(response,function(i, catObj) {
			tblRow 	+= "<tr style='border:1px solid black;'><td style='border:1px solid black;'>"
					+ catObj.transactionDate
					+ "</td>"
					+ "<td style='border:1px solid black;'>"
					+ catObj.transactionType  
					+ "</td>"
					+ "<td style='border:1px solid black;'>"
					+ catObj.quantity
					+ "</td>"
					+ "<td style='border:1px solid black;'>"
					+ catObj.productName
					+ "</td></tr>"
					
		});
		+"</table>";
		 $(tblRow).appendTo("#dialog");
		//paginationTable(3);
		}
}
$(function () {
    $("#dialog").dialog({
        autoOpen: false,
        modal: true,
        title: "Stock Details",
        buttons: {
            Close: function () {
                $(this).dialog('close');
            }
        }
    });
});
   /* $("#btnSubmit").click(function () {
        $.ajax({
            type: "POST",
            url: "Default.aspx/SendParameters",
            data: "{name: '" + $("#txtName").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                $("#dialog").html(r.d);
                $("#dialog").dialog("open");
            }
        });
    });
});*/
function stockDetails(productId){
	data = {};
	data["productId"] = productId;
	$.ajax({   
		type : "GET",
		url : "stockDetails",
		contentType: "application/json; charset=utf-8",
		 data: "productId="+productId,
		success : function(response) {
			console.log(response);
			resJSON = JSON.parse(response);
			popupStockData(resJSON)
			$("#dialog").html(resJSON.d);
            $("#dialog").dialog("open");
		//alert(response);
		//window.location.href = "billInfoHome";
		}
	});
}

function ProductStockDataClear(){
 $('#stock').val("");
 $('#oldStock').val("");
 $('#newStock').val("");
 $('#productId').val("");
}
function editProductStock(id){
	$('#productId').val(id);
	//var productId = $("#productId").val();
	//editProductStock(productId);
	$('#stock').val( serviceUnitArray[id].stock);
	$('#oldStock').val(serviceUnitArray[id]. oldStock);
	$('#newStock').val( serviceUnitArray[id].newStock);
	$('#stockId').val( serviceUnitArray[id].stockId);
}
function addProductStock(id)
{	
	var productId =$('#productId').val();
	if(typeof(serviceUnitArray) != "undefined" && serviceUnitArray[productId] != undefined && serviceUnitArray[productId].stock != undefined){
	   $('#stock').val( serviceUnitArray[productId].stock);
	}else{
		 $('#stock').val("0");
		 $("#stock").attr("disabled", "disabled");
	}
	if(typeof(serviceUnitArray) != "undefined" && serviceUnitArray[productId] != undefined && serviceUnitArray[productId].oldStock != undefined){
		$('#oldStock').val(serviceUnitArray[productId]. oldStock);
		}else{
			 $('#oldStock').val("0");
			 $("#oldStock").attr("disabled", "disabled");
		}
	if(typeof(serviceUnitArray) != "undefined" && serviceUnitArray[productId] != undefined && serviceUnitArray[productId].newStock != undefined){
		$('#newStock').val( serviceUnitArray[productId].newStock);
		}else{
			 $('#newStock').val("0");
		}
	/*if(typeof(serviceUnitArray) != "undefined" && serviceUnitArray[id] != undefined && serviceUnitArray[id].stock != undefined){
		$('#stockId').val( serviceUnitArray[id].stockId);
		}*/
	$('#newStock').val("");
	$('#stockId').val("");
}
function deleteProductStock(id) {
		$.ajax({
					type : "POST",
					url : "deleteProductStock.json",
					data : "id=" + id,
					success: function (response) {
		                 if(response != null ){
		                	 $("#unc1").text("Delete Sucessfully");
		            		   $("#unc1").show();
		                       $("#unc1").fadeOut(5000);
		                	 showProductData(response);
		                	}
		                 },
		             error: function (e) { 
							console.log(e);
		             }
				});
}

function productStock() {
	 data = {};
	data["productId"] = $("#productId").val();
	data["stock"] = $("#stock").val();
	data["oldStock"] = $("#oldStock").val();
	data["newStock"] = $("#newStock").val();
	data["stockId"]=$("#stockId").val();
		    
		     if($('#productId').val().length == 0 ) {
			    $('#productId').css('color','red');
			    $("#productId").css("border-color","red");
			    $("#productId").attr("placeholder","Please Enter productId");
			    $('#productId').addClass('your-class');
			    return false;
			    }
		   
		else if($("#stockId").val() != "" ){
			updateProductStock();
		}			   
		else{
			saveProductStock();
	    }
	
}

function saveProductStock(){
	
	
	$.ajax({
             type: "POST",
             url: "saveProductStock.htm",
             data: data,
             success: function (response) {
                 $("#btn-save").prop("disabled", false);
                 resJSON = JSON.parse(response);
                 if(response != null ){
                  if(resJSON.status == "ERROR"){
                	  $("#unc").text('Name already exists. Please choose other Name');
                	  $("#stock").val("");
                	  $("#unc").show();
                      $("#unc").fadeOut(5000);
                  }else{
                	showProductData(resJSON);
                	 $("#unc").text('Save Sucessfully');
               	  	 $("#unc").show();
                     $("#unc").fadeOut(5000);
  					 $("#stock").val("");
  					 $("#newStock").val("");
  					$("#oldStock").val("");
                  }
                	
                 }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function updateProductStock(){
	$.ajax({
             type: "POST",
             url: "updateProductStock.htm",
             data: "jsondata= "+JSON.stringify(data),
             time:1000,
             success: function (response) {
            	 $("#productId").val("");
            	 data = {};
            	 resJSON = JSON.parse(response);
            	 if(response != null){
            		 if(resJSON.status == "ERROR"){
                   	  	 $("#unc").text('Name already exists. Please choose other Name');
                   	 	 $("#unc").show();
                         $("#unc").fadeOut(5000);
                     }else{
                   	showProductData(resJSON);
                   	 $("#unc").text('Updated Sucessfully');
                  	  	 $("#unc").show();
                        $("#unc").fadeOut(5000);
     					 $("#stock").val("");
     					 $("#newStock").val("");
     					$("#oldStock").val("");
                     }
            	 }
                 
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}

