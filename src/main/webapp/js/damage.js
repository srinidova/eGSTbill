var damageId = 0;
var serviceUnitArray ={};
var data = {};


function showDamageData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove();
	serviceUnitArray = {};
	if(response != undefined && response.length >0){
	var protectId = null;
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.damageId] = catObj;
			 if(catObj.productId == 1){
				protectId = "mts";		
			}else{  
				protectId = "Nos";
			} 
				 var tblRow ="<ul class=''>"
						 /* + "<li class='five-box'  title='"+catObj.productId+"'>"
						+ catObj.productId  */
						+ "<li class='nine-box'  title='"+catObj.productId+"' style='width:300%;'>"
						+ catObj.productId
						+ "</li>"
						/* + "<li class='five-box'  title='"+protectType+"' style='width:140%;'>"
						+ protectType
						+ "</li>" */
						+ "<li class='five-box'  title='"+catObj.quantity+"' style='width:140%;'>"
						+ catObj.quantity
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.description+"' style='width:140%;'>"
						+ catObj.description
						+ "</li>"
						+ "<li class='ten-box' style='width:140%;'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.damageId
						+ "' onclick='editDamage(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box' style='width:140%;'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.damageId
						+ "' onclick='deleteDamage(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
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
			showDamageData(JSON.parse(response));
			if(response == null || response =="" ){
				$("#itemContainer ul li").remove();
				$("#itemContainer ul").remove();
			}
		
		}
	});
	
}
function damageDataClear(){
 $('#productId').val("");
 $('#quantity').val("");
 $('#description').val("");
}

function editDamage(id)
{		 		
	$('#damageId').val(id);
	$('#productId').val( serviceUnitArray[id].productId);
	$('#quantity').val( serviceUnitArray[id].quantity);
	$('#description').val( serviceUnitArray[id].description);
}
function deleteDamage(id) {
	
	data = {};
	data["productId"] =serviceUnitArray[id].productId;
	data["damageId"] =serviceUnitArray[id].damageId;
	data["quantity"] =serviceUnitArray[id].quantity;
		$.ajax({
					type : "POST",
					url : "deleteDamage.json",
					data : "jsondata= "+JSON.stringify(data),
					success: function (response) {
		                 if(response != null ){
		                	 $("#unc").text("Delete Sucessfully");
		            		   $("#unc").show();
		                       $("#unc").fadeOut(5000);
		                	 showDamageData(response);
		                	}
		                 },
		             error: function (e) { 
							console.log(e);
		             }
				});
}

function damageRegister() {
	 data = {};
	data["damageId"] = $("#damageId").val();
	data["productId"] = $("#productId").val();
	data["quantity"] = $("#quantity").val();
	data["description"] = $("#description").val();
	var dId=$("#damageId").val();
	
		    
		     if($('#quantity').val().length == 0 ) {
			    $('#quantity').css('color','red');
			    $("#quantity").css("border-color","red");
			    $("#quantity").attr("placeholder","Please enter Quantity");
			    $('#quantity').addClass('your-class');
			    return false;
			    }
		    
		    else if($('#description').val().length == 0 ) {
			    $('#description').css('color','red');
			    $("#description").css("border-color","red");
			    $("#description").attr("placeholder","Please enter Description");
			    $('#description').addClass('your-class');
			    return false;
			    } 
		   
		 if(dId != "" ){
			data["dmageId"] = dId;
			updateDamage();
		}			   
		else{
			saveDamage();
	    }
	
}

function saveDamage(){
	$.ajax({
             type: "POST",
             url: "damageSave.htm",
             data: "jsondata= "+JSON.stringify(data),
             success: function (response) {
                 $("#btn-save").prop("disabled", false);
                 resJSON = JSON.parse(response);
                 if(response != null ){
                  if(resJSON.status == "ERROR"){
                	  $("#unc").text('Name already exists. Please choose other Name');
                	  $("#productId").val("");
                	  $("#unc").show();
                      $("#unc").fadeOut(5000);
                  }else{
                	showDamageData(resJSON);
                	 $("#unc").text('Save Sucessfully');
               	  	 $("#unc").show();
                     $("#unc").fadeOut(5000);
  					 $("#productId").val("");
  					 $("#quantity").val("");
  					$("#description").val("");
                  }
                	
                 }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function updateDamage(){
	$.ajax({
             type: "POST",
             url: "updateDamage.htm",
             data: "jsondata= "+JSON.stringify(data),
             time:1000,
             success: function (response) {
            	 $("#productId").val("");
            	 $('#quantity').val("");
            	 $('#description').val("");
            	 data = {};
            	 resJSON = JSON.parse(response);
            	 if(response != null){
            		 if(resJSON.status == "ERROR"){
                   	  	 $("#unc").text('Name already exists. Please choose other Name');
                   	 	 $("#unc").show();
                         $("#unc").fadeOut(5000);
                     }else{
                   	showDamageData(resJSON);
                   	 $("#unc").text('Updated Sucessfully');
                  	  	 $("#unc").show();
                        $("#unc").fadeOut(5000);
     					 $("#productId").val("");
     					 $("#quantity").val("");
     					$("#description").val("");
                     }
            	 }
                 
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}