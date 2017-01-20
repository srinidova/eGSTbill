

var serviceUnitArray ={};
var data = {};

function displayUserRow(catObj, dispType) {
	serviceUnitArray[catObj.regName] = catObj;
		 var tblRow ="<ul class=''>"
				 /* + "<li class='five-box'  title='"+catObj.mobileNo+"'>"
				+ catObj.mobileNo  */
				+ "<li class='nine-box'  title='"+catObj.regName+"'>"
				+ catObj.regName
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.mobileNo+"'>"
				+ catObj.mobileNo
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.eMail+"'>"
				+ catObj.eMail
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.regType+"'>"
				+ catObj.regType
				+ "</li>"
				
				+ "<li class='ten-box'>"
				+ "<a href='javascript:void(0)' id='"
				+ catObj.regName
				+ "' onclick='editRegisterData(this.id)' id='editId class='ico del' href='#'>Edit</a>"
				+ '</li>'
				
				+ "<li class='ten-box'>"
				+ "<a href='javascript:void(0)' id='"
				+ catObj.mobileNo
				+ "' onclick='deleteRegisterData(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
				+ '</li>'
				+ "</li>"
				+"</ul>";
		 if (dispType == 'append') {
			 $(tblRow).appendTo("#userData");
		 } else {
			 $(tblRow).prependTo("#userData"); 
		 }
	
}

function showRegisterData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove();
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	if(response != undefined && response.length > 0){
	$.each(response,function(i, catObj) {
		displayUserRow(catObj, "append");
	});
	//paginationTable(3);
	}
}


function dataClear(){
	
 $('#regName').val("");
 $('#mobileNo').val("");
 $('#regType').val("");
 $('#eMail').val("");
}

function editRegisterData(id)
{		 		
	//mobileNo = serviceUnitArray[id].mobileNo;
	//$('#regName').val(id);
	$('#regName').val( serviceUnitArray[id].regName);
	$('#mobileNo').val( serviceUnitArray[id].mobileNo);
	$('#eMail').val( serviceUnitArray[id].eMail);
	$('#regType').val( serviceUnitArray[id].regType);
	
}
function deleteRegisterData(id) {
	var count = 0;
		$.ajax({
					type : "POST",
					url : "deleteRegister.json",
					data : "id=" + id,
					success: function (response) {
		                       showRegisterData(response);
		                       if(response == null || response =="" ){
		           				$("#unc1").text("Delete Sucessfully");
			            		   $("#unc1").show();
			                       $("#unc1").fadeOut(5000);
			                       $("#regName").val("");
			                       $("#mobileNo").val("");
			                       $("#regType").val("");
			                       $("#eMail").val("");
			                       return false;
		                	}
		                 },
		             error: function (e) { 
							console.log(e);
		             }
				});
}

function userRegister() {
	 data = {};
	data["password"] = $("#password").val();
	data["mobileNo"] = $("#mobileNo").val();
	data["regName"] = $("#regName").val();
	data["regType"] = $("#regType").val();
	data["eMail"] = $("#eMail").val();
	
	if($('#regName').val().length == 0 || $('#mobileNo').val().length == 0 || $('#eMail').val().length == 0 ){
		 if($('#regName').val().length == 0 ) {
			    $('#regName').css('color','red');
			    $("#regName").css("border-color","red");
			    $("#regName").attr("placeholder","Please enter Name");
			    $('#regName').addClass('your-class');
			    setTimeout(function(){$('#regName').focus();},0);
			    return false;
			    }
		    
		    else if(!$('#mobileNo').val().match('[0-9]{10}') ) {
			    $('#mobileNo').css('color','red');
			    $("#mobileNo").css("border-color","red");
			    $("#mobileNo").attr("placeholder","Please enter Mobile No");
			    $('#mobileNo').addClass('your-class');
			    setTimeout(function(){$('#regName').focus();},0);
			    return false;
			    }
		    else if($('#eMail').val().length == 0 ) {
			    $('#eMail').css('color','red');
			    $("#eMail").css("border-color","red");
			    $("#eMail").attr("placeholder","Please enter eMail");
			    $('#eMail').addClass('your-class');
			   
			    }
		    return false;
			}
	//}
			   
		else{
			saveRegisterData();
	    }
	$("#btn-save").prop("disabled", true);
		
		
	}
	
function saveRegisterData(){
	$.ajax({
             type: "POST",
             url: "saveRegister.htm",
             data: data,
             success: function (response) {
            	 if(response != ""){
            		 resJSON = JSON.parse(response);
                     if(response != null ){
                    	 displayUserRow(resJSON,'prepend');
                    	  //showRegisterData(resJSON);
                    	  $("#unc").text('Save Sucessfully');
                    	  	$("#unc").show();
                          $("#unc").fadeOut(10000);
      					 $("#regName").val("");
      					 $("#mobileNo").val("");
      					$("#regType").val("");
      					$("#eMail").val("");
      					return false;
                      }
            	 } else {
            		 
            	 }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function updateRegisterData(){
	$.ajax({
             type: "POST",
             url: "updateRegister.htm",
             data: "jsondata= "+JSON.stringify(data),
             time:1000,
             success: function (response) {

            	 if(response != 0){
            		     $("#unc").text("Update Sucessfully");
            		   $("#unc").show();
                       $("#unc").fadeOut(5000); 
                       
                       showRegisterData(JSON.parse(response));
            		 $("#mobileNo").val("");
  					$("#regName").val("");
  					$("#productType").val("");
  					$("#regType").val("");
  					
  					 stop = true;
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