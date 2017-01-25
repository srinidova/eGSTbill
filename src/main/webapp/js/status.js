var statusId = 0;
var serviceUnitArray ={};
var data = {};


function showStatusData(response){
	$("#statusData ul").remove();
	$("#statusData ul li").remove();
	serviceUnitArray = {};
	if(response != undefined && response.length >0){
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.statusId] = catObj;
			
				 var tblRow ="<ul class=''>"
						 /* + "<li class='five-box'  title='"+catObj.productId+"'>"
						+ catObj.productId  */
						+ "<li class='nine-box'  title='"+catObj.status+"'>"
						+ catObj.status
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.description+"'>"
						+ catObj.description
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.statusPriority+"'>"
						+ catObj.statusPriority
						+ "</li>"
						
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.statusId
						+ "' onclick='editStatus(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.statusId
						+ "' onclick='deleteStatus(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
						+ '</li>'
						+ "</li>"
						+"</ul>";
				$(tblRow).appendTo("#statusData"); 
			});
	//paginationTable(3);
	}
}

function statusDataClear(){
 $('#status').val("");
 $('#statusPriority').val("");
 $('#description').val("");
} 

function editStatus(id)
{		 		
	$('#statusId').val(serviceUnitArray[id].statusId);
	$('#status').val( serviceUnitArray[id].status);
	$('#description').val( serviceUnitArray[id].description);
	$('#statusPriority').val( serviceUnitArray[id].statusPriority);
}
 function deleteStatus(id) {
	var count = 0;
		$.ajax({
					type : "POST",
					url : "deleteStatusData.json",
					data : "id=" + id,
					success: function (response) {
		                 if(response != null ){
		                	 $("#unc").text("Delete Sucessfully");
		            		   $("#unc").show();
		                       $("#unc").fadeOut(5000);
		                	 showStatusData(response);
		                	}
		                 },
		             error: function (e) { 
							console.log(e);
		             }
				});
} 


function statusReg(){
	data = {};
	data["statusId"] = $("#statusId").val();
	data["status"] = $("#status").val();
	data["description"] = $("#description").val();
	data["statusPriority"] = $("#statusPriority").val();
	if($('#status').val().length == 0 ) {
	    $('#status').css('color','red');
	    $("#status").css("border-color","red");
	    $("#status").attr("placeholder","Please enter Status");
	    $('#status').addClass('your-class');
	    return false;
	    }
    else if($('#description').val().length == 0 ) {
	    $('#descrption').css('color','red');
	    $("#descrption").css("border-color","red");
	    $("#descrption").attr("placeholder","Please enter mrp");
	    $('#descrption').addClass('your-class');
	    return false;
	    }
    else if($('#statusPriority').val().length == 0 ) {
	    $('#statusPriority').css('color','red');
	    $("#statusPriority").css("border-color","red");
	    $("#statusPriority").attr("placeholder","Please enter mrp");
	    $('#statusPriority').addClass('your-class');
	    return false;
	    }
	
    else if($("#statusId").val() != ""){
		updateStatus();
	}else{
		saveStatus();
	}
}
function saveStatus(){
	 
	$.ajax({
             type: "POST",
             url: "statusSave.htm",
             data: data,
             success: function (response) {
                 $("#btn-save").prop("disabled", false);
                 resJSON = JSON.parse(response);
                 if(response != null ){
                  if(resJSON.status == "ERROR"){
                	  $("#unc").text('Name already exists. Please choose other Name');
                	  $("#status").val("");
                	  $("#unc").show();
                      $("#unc").fadeOut(5000);
                  }else{
                	  showStatusData(resJSON);
                	 $("#unc").text('Save Sucessfully');
               	  	 $("#unc").show();
                     $("#unc").fadeOut(5000);
  					 $("#status").val("");
  					 $("#description").val("");
  					$("#statusPriority").val("");
                  }
                	
                 }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
 function updateStatus(){
	$.ajax({
             type: "POST",
             url: "statusUpdate.htm",
             data: "jsondata= "+JSON.stringify(data),
             time:1000,
             success: function (response) {
            	 $("#statusId").val("");
            	 data = {};
            	 resJSON = JSON.parse(response);
            	 showStatusData(resJSON);
            	 $("#unc").text('Updated Sucessfully');
          	  	 $("#unc").show();
                $("#unc").fadeOut(5000);
            	  if(response != null){
            		 if(resJSON.status == "ERROR"){
                   	  	 $("#unc").text('Name already exists. Please choose other Name');
                   	 	 $("#unc").show();
                         $("#unc").fadeOut(5000);
                     }else{
                    	 showStatusData(resJSON);
                   	 $("#unc").text('Updated Sucessfully');
                  	  	 $("#unc").show();
                        $("#unc").fadeOut(5000);
     					 $("#status").val("");
     					 $("#description").val("");
     					$("#statusPriority").val("");
                     }
            	 } 
                 
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}