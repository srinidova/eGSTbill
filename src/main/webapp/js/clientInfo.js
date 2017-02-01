

var serviceUnitArray ={};
var data = {};

function displayUserRow(catObj, dispType) {
	serviceUnitArray[catObj.clientId] = catObj;
		 var tblRow ="<ul class=''>"
				 /* + "<li class='five-box'  title='"+catObj.mobileNo+"'>"
				+ catObj.mobileNo  */
				+ "<li class='nine-box' style='width:75%;'><img class='' src='+catObj.uploadLogo+' style='width:50px;height:50px;' />"
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.companyName+"' style='width:150%;height:auto;'>"
				+ catObj.companyName
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.clientEmail+"' style='width:100%;'>"
				+ catObj.clientEmail
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.address+"' style='width:125%;'>"
				+ catObj.address
				+ "</li>"
				
				+ "<li class='ten-box' style='width:45%;'>"
				+ "<a href='javascript:void(0)' id='"
				+ catObj.clientId
				+ "' onclick='editClientData(this.id)' id='editId' class='edit' href='#'>Edit</a>"
				+ '</li>'
				
				+ "<li class='ten-box' style='width:45%;border-right:0;'>"
				+ "<a href='javascript:void(0)' id='"
				+ catObj.clientId
				+ "' onclick='deleteClient(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
				+ '</li>'
				+ "</li>"
				+"</ul>";
		 if (dispType == 'append') {
			 $(tblRow).appendTo("#userData");
		 } else {
			 $(tblRow).prependTo("#userData"); 
		 }
	
}

function showClientData(response){
	//alert('aaa');
	$("#userData ul li").remove();
	//resJSON = JSON.parse(response);
	if(response != undefined && response.length >0){
	$.each(response,function(i, catObj) {
		displayUserRow(catObj, "append");
	});
	//paginationTable(3);
	}
}


function ClientDataClear(){
	
 $('#companyName').val("");
 $('#mobileNo').val("");
 $('#address').val("");
 $('#clientEmail').val("");
 $('#password').val("");
 $('#cPassword').val("");
 
}

function editClientData(id)
{	
	alert('id---'+id);
	alert('serviceUnitArray[id]---'+serviceUnitArray[id].companyName);
	$('#companyName').val(serviceUnitArray[id].companyName);
	$('#contactPerson').val(serviceUnitArray[id].contactPerson);
	$('#clientId').val(serviceUnitArray[id].clientId);	 		
	
	$('#clientEmail').val(serviceUnitArray[id].clientEmail);
	$('#address').val(serviceUnitArray[id].address);
	$('#contactNo').val(serviceUnitArray[id].contactNo);
	$('#smsUrl').val(serviceUnitArray[id].smsUrl);
	$('#smsUserName').val(serviceUnitArray[id].smsUserName);
	$('#smsPassword').val(serviceUnitArray[id].smsPassword);
	
	
}
function deleteClient(id) {
	var count = 0;
		$.ajax({
					type : "POST",
					url : "deleteClient.json",
					data : "id=" + id,
					success: function (response) {
	                      
						 if(response != null){
							 
	                    	  	showRegisterData(response);
							 //displayUserRow(JSON.parse(response));
		           				   $("#unc1").text("Delete Sucessfully");
			            		   $("#unc1").show();
			                       $("#unc1").fadeOut(5000);
			                       return false;
		                	}
		                 },
		             error: function (e) { 
							console.log(e);
		             }
				});
}

function clientUser() {
	 data = {};
	data["clientId"] = $("#clientId").val();
	data["emailSupport"] = $("#emailSupport").val();
	data["companyName"] = $("#companyName").val();
	data["address"] = $("#address").val();
	data["clientEmail"] = $("#clientEmail").val();
	data["contactPerson"] = $("#contactPerson").val();
	data["smsSuport"] = $("#smsSuport").val();
	data["contactNo"] = $("#contactNo").val();
	data["tinNo"] = $("#tinNo").val();
	data["uploadLogo"] = $("#uploadLogo").val();
	data["smsUrl"] = $("#smsUrl").val();
	data["smsUserName"] = $("#smsUserName").val();
	data["smsPassword"] = $("#smsPassword").val();
	     if($('#companyName').val().length == 0 ) {
		    $('#companyName').css('color','red');
		    $("#companyName").css("border-color","red");
		    $("#companyName").attr("placeholder","Please enter Name");
		    $('#companyName').addClass('your-class');
		    setTimeout(function(){$('#companyName').focus();},0);
		    return false;
		 }else if($('#contactPerson').val().length == 0  ) {
		    $('#contactPerson').css('color','red');
		    $("#contactPerson").css("border-color","red");
		    $("#contactPerson").attr("placeholder","Please enter contactPerson Name");
		    $('#contactPerson').addClass('your-class');
		    setTimeout(function(){$('#contactPerson').focus();},0);
		    return false;
		 }
	    else if($('#contactNo').val().length == 0 ) {
		    $('#contactNo').css('color','red');
		    $("#contactNo").css("border-color","red");
		    $("#contactNo").attr("placeholder","Please enter email");
		    $('#contactNo').addClass('your-class');
		    setTimeout(function(){$('#contactNo').focus();},0);
		    return false;
		    }
	    else if($('#uploadLogo').val().length == 0 ) {
		    $('#uploadLogo').css('color','red');
		    $("#uploadLogo").css("border-color","red");
		    $("#uploadLogo").attr("placeholder","Please enter uploadLogo");
		    $('#uploadLogo').addClass('your-class');
		    setTimeout(function(){$('#uploadLogo').focus();},0);
		    return false;
		    }
	    else if($('#tinNo').val().length == 0 ) {
		    $('#tinNo').css('color','red');
		    $("#tinNo").css("border-color","red");
		    $("#tinNo").attr("placeholder","Please enter cPassword");
		    $('#tinNo').addClass('your-class');
		    setTimeout(function(){$('#tinNo').focus();},0);
		    return false;
		 }else if($('#address').val().length == 0 ) {
			    $('#address').css('color','red');
			    $("#address").css("border-color","red");
			    $("#address").attr("placeholder","Please enter address");
			    $('#address').addClass('your-class');
			    setTimeout(function(){$('#address').focus();},0);
			    return false;
			 }else if($('#emailSupport').val().length == 0 ) {
				    $('#emailSupport').css('color','red');
				    $("#emailSupport").css("border-color","red");
				    $("#emailSupport").attr("placeholder","Please enter emailSupport");
				    $('#emailSupport').addClass('your-class');
				    setTimeout(function(){$('#emailSupport').focus();},0);
				    return false;
				 }else if($('#smsUrl').val().length == 0 ) {
					    $('#smsUrl').css('color','red');
					    $("#smsUrl").css("border-color","red");
					    $("#smsUrl").attr("placeholder","Please enter smsUrl");
					    $('#smsUrl').addClass('your-class');
					    setTimeout(function(){$('#smsUrl').focus();},0);
					    return false;
					 }else if($('#smsUserName').val().length == 0 ) {
						    $('#smsUserName').css('color','red');
						    $("#smsUserName").css("border-color","red");
						    $("#smsUserName").attr("placeholder","Please enter smsUserName");
						    $('#smsUserName').addClass('your-class');
						    setTimeout(function(){$('#smsUserName').focus();},0);
						    return false;
						 }else if($('#smsPassword').val().length == 0 ) {
							    $('#smsPassword').css('color','red');
							    $("#smsPassword").css("border-color","red");
							    $("#smsPassword").attr("placeholder","Please enter cPassword");
							    $('#smsPassword').addClass('your-class');
							    setTimeout(function(){$('#smsPassword').focus();},0);
							    return false;
							 }else if($("#clientId").val() != ""){
							    	updateClient();
								}else{
									saveClient();
								}
						}
			function saveClient(){
				
				
			var formData = new FormData();
				
				formData.append('file', $('input[type=file]')[0].files[0]);
			    
				formData.append('clientId', data.clientId);
				formData.append('emailSupport',data.emailSupport);
				formData.append('companyName',data.companyName);
				formData.append('clientEmail',data.clientEmail);
				formData.append('address',data.address);
				formData.append('contactPerson',data.contactPerson);
				formData.append('smsSuport',data.smsSuport);
				formData.append('contactNo',data.contactNo);
				formData.append('tinNo',data.tinNo);
				formData.append('smsUrl',data.smsUrl);
				formData.append('smsUserName',data.smsUserName);
				formData.append('smsPassword',data.smsPassword);
				console.log(formData);
				
				$.ajax({
			             type: "POST",
			             url: "saveClient.htm",
			             data: formData,
			             cache: false,
			             contentType: false,
			             processData: false,
			             success: function (response) {
			            		 resJSON = JSON.parse(response);
			            		 
			                     if(resJSON != null ){
			                    	 $("#userData ul li").remove();
			                    	 for(i=0;i<resJSON.length;i++){
			                    		 
			                    		 displayUserRow(resJSON[i],'prepend');
			                    	 }
			                    	 
			                    	  $("#unc").text('Save Sucessfully');
			                    	  	$("#unc").show();
			                    	  	$("#unc").fadeOut(10000);
			      					 	$("#companyName").val("");
			      					 	$("#mobileNo").val("");
			      					 	$("#address").val("");
			      					 	$("#clientEmail").val("");
			      					 	$("#password").val("");
			      					 	$("#cPassword").val("");
			      					return false;
			                      }
			            	  else {
			            		 
			            	 }
			                 },
			             error: function (e) { 
			                 $("#btn-save").prop("disabled", false);
			             }
			
				});
			}
/*function updateClient(){
	var formData = new FormData();
	formData.append('file', $('#uploadLogo')[0].files[0]);
    
	formData.append('clientId', data.clientId);
	formData.append('emailSupport',data.emailSupport);
	formData.append('companyName',data.companyName);
	formData.append('clientEmail',data.clientEmail);
	formData.append('address',data.address);
	formData.append('contactPerson',data.contactPerson);
	formData.append('smsSuport',data.smsSuport);
	formData.append('contactNo',data.contactNo);
	formData.append('tinNo',data.tinNo);
	formData.append('smsUrl',data.smsUrl);
	formData.append('smsUserName',data.smsUserName);
	formData.append('smsPassword',data.smsPassword);
	console.log(formData);
	
	jQuery.fn.makeMultipartRequest('POST', "updateClient.htm", false, formData, false, 'json', function(response){
		console.log(response);
		
	});
}*/
function updateClient(){
	
	var formData = new FormData();
	//formData.append('file', $('#uploadLogo')[0].files[0]);
	formData.append('file', $('input[type=file]')[0].files[0]);
    
	formData.append('clientId', data.clientId);
	formData.append('emailSupport',data.emailSupport);
	formData.append('companyName',data.companyName);
	formData.append('clientEmail',data.clientEmail);
	formData.append('address',data.address);
	formData.append('contactPerson',data.contactPerson);
	formData.append('smsSuport',data.smsSuport);
	formData.append('contactNo',data.contactNo);
	formData.append('tinNo',data.tinNo);
	formData.append('smsUrl',data.smsUrl);
	formData.append('smsUserName',data.smsUserName);
	formData.append('smsPassword',data.smsPassword);
	console.log(formData);
	$.ajax({
             type: "POST",
             url: "updateClient.htm",
             data: "formData",
             cache: false,
             contentType: false,
             processData: false,
             success: function (response) {
            	 $("#contactPerson").val("");
            	 data = {};
            	 $("#userData ul li").remove();
            	 resJSON = JSON.parse(response);
            	 
            	 if(resJSON != 0){
            		 for(i=0;i<resJSON.length;i++){
                		 
                		 displayUserRow(resJSON[i],'prepend');
                		 
                	 }
                       
            		 	$("#unc").text("Update Sucessfully");
          		   		$("#unc").show();
          		   		$("#unc").fadeOut(5000); 
          		   		$("#mobileNo").val("");
          		   		$("#companyName").val("");
          		   		$("#productType").val("");
          		   		$("#address").val("");
          		   		$("#clientEmail").val("");
					 	$("#password").val("");
					 	$("#cPassword").val("");
					 	$("#cPassword").val("");
					 	return false;
                 }
                 
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
 

function removeError(ele){
	$("#"+ele).css('color', "#333333");
	$("#"+ele).css('border-color', "");
	$("#"+ele).removeClass('your-class');
}