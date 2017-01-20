



var serviceUnitArray ={};
var data = {};


function showPurchaseData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove();
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	 
	if(response != undefined && response.length > 0){
		
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.name] = catObj;
				 var tblRow ="<ul class=''>"
						 /* + "<li class='five-box'  title='"+catObj.mobileNo+"'>"
						+ catObj.mobileNo  */
						+ "<li class='nine-box'  title='"+catObj.name+"'>"
						+ catObj.name
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.mobileNo+"'>"
						+ catObj.mobileNo
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.eMail+"'>"
						+ catObj.eMail
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.address+"'>"
						+ catObj.address
						+ "</li>"
						
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.name
						+ "' onclick='editPurchageInfo(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.name
						+ "' onclick='deletePurchaseInfo(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
						+ '</li>'
						+ "</li>"
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
	//paginationTable(3);
	}
}
function dataClear(){
	
 $('#name').val("");
 $('#mobileNo').val("");
 $('#address').val("");
 $('#eMail').val("");
}

function editPurchageInfo(id)
{		 		
	//mobileNo = serviceUnitArray[id].mobileNo;
	//$('#name').val(id);
	$('#name').val( serviceUnitArray[id].name);
	$('#mobileNo').val( serviceUnitArray[id].mobileNo);
	$('#eMail').val( serviceUnitArray[id].eMail);
	$('#address').val( serviceUnitArray[id].address);
}
function deletePurchaseInfo(id) {
	var count = 0;
		$.ajax({
					type : "POST",
					url : "deletePurchaseInfo.json",
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

function productRegister() {
	 data = {};
	data["mobileNo"] = $("#mobileNo").val();
	data["name"] = $("#name").val();
	data["address"] = $("#address").val();
	data["eMail"] = $("#eMail").val();
	
	if($('#name').val().length == 0 || $('#mobileNo').val().length == 0 || $('#eMail').val().length == 0 ){
		 if($('#name').val().length == 0 ) {
			    $('#name').css('color','red');
			    $("#name").css("border-color","red");
			    $("#name").attr("placeholder","Please enter Name");
			    $('#name').addClass('your-class');
			    return false;
			    }
		    
		    else if(!$('#mobileNo').val().match('[0-9]{10}') ) {
			    $('#mobileNo').css('color','red');
			    $("#mobileNo").css("border-color","red");
			    $("#mobileNo").attr("placeholder","Please enter Mobile No");
			    $('#mobileNo').addClass('your-class');
			    return false;
			    }
		    else if($('#eMail').val().length == 0 ) {
			    $('#eMail').css('color','red');
			    $("#eMail").css("border-color","red");
			    $("#eMail").attr("placeholder","Please enter eMail");
			    $('#eMail').addClass('your-class');
			   
			    }
		    else if($('#address').val().length == 0 ) {
			    $('#address').css('color','red');
			    $("#address").css("border-color","red");
			    $("#address").attr("placeholder","Please enter address");
			    $('#address').addClass('your-class');
			   
			    }
		    return false;
			}
			   
		else{
			savePurchageInfo();
	    }
	$("#btn-save").prop("disabled", true);
	
}

function savePurchageInfo(){
	$.ajax({
             type: "POST",
             url: "savePurchaseInfo.htm",
             data: data,
             success: function (response) {
                 $("#btn-save").prop("disabled", false);
                 resJSON = JSON.parse(response);
                 if(response != null ){
                	 
                	  showPurchaseData(resJSON);
                	  
                	  $("#unc").text('Save Sucessfully');
                	  	 $("#unc").show();
                      $("#unc").fadeOut(5000);
                	 
  					 $("#name").val("");
  					 $("#mobileNo").val("");
  					$("#address").val("");
  					$("#eMail").val("");
                	
                  }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function updatePurchaseInfo(){
	$.ajax({
             type: "POST",
             url: "updatePurchaseInfo.htm",
             data: "jsondata= "+JSON.stringify(data),
             time:1000,
             success: function (response) {

            	 if(response != 0){
            		 //alert('aaaasaas');
            		     $("#unc").text("Update Sucessfully");
            		   $("#unc").show();
                       $("#unc").fadeOut(5000); 
                       
                       showPurchaseData(JSON.parse(response));
            		 $("#mobileNo").val("");
  					$("#name").val("");
  					$("#productType").val("");
  					$("#address").val("");
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
