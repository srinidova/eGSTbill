function showProductData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove();
	serviceUnitArray = {};
	if(response != undefined && response.length >0){
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.productId] = catObj;
			
				 var tblRow ="<ul class=''>"
						+ "<li class='nine-box'  title='"+catObj.productId+"'>"
						+ catObj.productId  
						+ "<li class='nine-box'  title='"+catObj.stock+"' style='width:300%;'>"
						+ catObj.stock
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.newStock+"' style='width:140%;'>"
						+ catObj.newStock
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.oldStock+"' style='width:140%;'>"
						+ catObj.oldStock
						+ "</li>"
						
						+ "<li class='ten-box' style='width:140%;'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.productId
						+ "' onclick='editProductStock(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box' style='width:140%;'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.stockId
						+ "' onclick='deleteProductStock(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
						+ '</li>'
						+ "</li>"
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
	//paginationTable(3);
	}
}

function ProductStockDataClear(){
 $('#stock').val("");
 $('#oldStock').val("");
}
function poupulateProductStock(id){
	
	var productId = $("#productId").val();
	editProductStock(productId);
	
}
function editProductStock(id)
{		 		//alert("length"+serviceUnitArray[id].length)
	//var stock=serviceUnitArray[id].stock;
	if($("#productId ").val() == ''){
		$('#stock').text("0");
	}else if($('#stock').val( serviceUnitArray[id].stock)==null){
		$('#stock').text("0");
	}
	var oldStock =serviceUnitArray[id].oldStock;
	if(oldStock == null){
		oldStock=0;
	}
	$('#productId').val(id);
	$('#stock').val(stock );
	 $("#stock").attr("disabled", "disabled"); 
	//$('#stock').disabled =true;
	$('#newStock').val( serviceUnitArray[id].newStock);
	$('#oldStock').val( oldStock);
	$('#stockId').val( serviceUnitArray[id].stockId);
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
	
		    
		    if($('#stock').val().length == 0 ) {
			    $('#stock').css('color','red');
			    $("#stock").css("border-color","red");
			    $("#stock").attr("placeholder","Please enter stock");
			    $('#stock').addClass('your-class');
			    return false;
			    }
		    
		    else if($('#oldStock').val().length == 0 ) {
			    $('#oldStock').css('color','red');
			    $("#oldStock").css("border-color","red");
			    $("#oldStock").attr("placeholder","Please enter oldStock");
			    $('#oldStock').addClass('your-class');
			    return false;
			    }
		   
		else if($("#stockId").val() != "" ){
			alert('aaaaaaaaaaa'+$("#stockId").val());
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