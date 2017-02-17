var productId = 0;
var serviceUnitArray ={};
var data = {};


function showProductData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove();
	serviceUnitArray = {};
	if(response != undefined && response.length >0){
	var protectType = null;
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.productId] = catObj;
			if(catObj.productType == 1){
				protectType = "mts";		
			}else{  
				protectType = "Nos";
			}
				 var tblRow ="<ul class=''>"
						 /* + "<li class='five-box'  title='"+catObj.productId+"'>"
						+ catObj.productId  */
						+ "<li class='nine-box'  title='"+catObj.productName+"' style='width:300%;'>"
						+ catObj.productName
						+ "</li>"
						+ "<li class='five-box'  title='"+protectType+"' style='width:140%;'>"
						+ protectType
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.mrp+"' style='width:140%;'>"
						+ catObj.mrp
						+ "</li>"
						
						+ "<li class='ten-box' style='width:140%;'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.productId
						+ "' onclick='editProduct(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box' style='width:140%;'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.productId
						+ "' onclick='deleteProduct(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
						+ '</li>'
						+ "</li>"
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
	//paginationTable(3);
	}
}
function productSearch() {
	
	$.ajax({
		type : "POST",
		url : "datebetweenSearch.json",
		dataType : "json",
		data : {
			startdate : startdate,
			enddate : enddate,
		},
		success : function(response) {
			showProductData(JSON.parse(response));
			if(response == null || response =="" ){
				$("#itemContainer ul li").remove();
				$("#itemContainer ul").remove();
			}
		
		}
	});
	
}
function productDataClear(){
 $('#productName').val("");
 $('#mrp').val("");
}

function editProduct(id)
{		 		
	$('#productId').val(id);
	$('#productName').val( serviceUnitArray[id].productName);
	$('#productType').val( serviceUnitArray[id].productType);
	$('#mrp').val( serviceUnitArray[id].mrp);
}
function deleteProduct(id) {
	var count = 0;
		$.ajax({
					type : "POST",
					url : "deleteProductData.json",
					data : "id=" + id,
					success: function (response) {
		                 if(response != null ){
		                	 $("#unc").text("Delete Sucessfully");
		            		   $("#unc").show();
		                       $("#unc").fadeOut(15000);
		                	 showProductData(response);
		                	}
		                 },
		             error: function (e) { 
							console.log(e);
		             }
				});
}

function productRegister() {
	 data = {};
	data["productId"] = $("#productId").val();
	data["productName"] = $("#productName").val();
	data["mrp"] = $("#mrp").val();
	data["productType"] = $("#productType").val();
	var pId=$("#productId").val();
	
		    
		    if($('#productName').val().length == 0 ) {
			    $('#productName').css('color','red');
			    $("#productName").css("border-color","red");
			    $("#productName").attr("placeholder","Please enter ProductName");
			    $('#productName').addClass('your-class');
			    return false;
			    }
		    
		    else if($('#mrp').val().length == 0 ) {
			    $('#mrp').css('color','red');
			    $("#mrp").css("border-color","red");
			    $("#mrp").attr("placeholder","Please enter mrp");
			    $('#mrp').addClass('your-class');
			    return false;
			    }
		   
		else if(pId != "" ){
			data["productId"] = pId;
			updateProduct();
		}			   
		else{
			saveProduct();
	    }
	
}

function saveProduct(){
	$.ajax({
             type: "POST",
             url: "productSave.htm",
             data: data,
             success: function (response) {
                 $("#btn-save").prop("disabled", false);
                 resJSON = JSON.parse(response);
                 if(response != null ){
                  if(resJSON.status == "ERROR"){
                	  $("#unc").text('Name already exists. Please choose other Name');
                	  $("#productName").val("");
                	  $("#unc").show();
                      $("#unc").fadeOut(15000);
                  }else{
                	showProductData(resJSON);
                	 $("#unc").text('Save Sucessfully');
               	  	 $("#unc").show();
                     $("#unc").fadeOut(15000);
  					 $("#productName").val("");
  					 $("#productType").val("");
  					$("#mrp").val("");
                  }
                	
                 }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function updateProduct(){
	$.ajax({
             type: "POST",
             url: "productUpdate.htm",
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
                         $("#unc").fadeOut(15000);
                     }else{
                   	showProductData(resJSON);
                   	 $("#unc").text('Updated Sucessfully');
                  	  	 $("#unc").show();
                        $("#unc").fadeOut(15000);
     					 $("#productName").val("");
     					 $("#productType").val("");
     					$("#mrp").val("");
                     }
            	 }
                 
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}