<!DOCTYPE >
<html>
<head>
<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>
</head>
<body>

<script type="text/javascript" src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/CustomPagenation.js"></script> 
 <script type="text/javascript" src="js/purchaseInfo.js"></script>
 <script type="text/javascript" src="js/commonUtils.js"></script>

<script type="text/javascript">
var lstStatus ='${allStatus}';
$(document).ready(function() {
	
	showStatusData(JSON.parse(lstStatus));
	
	 $("#status").keypress(function() {
		var textbox = document.getElementById("status");
		if (textbox.value.length < 3){
	    	
	    	 $("#unc").text(' min 3 characters reqiured');
	        	$("#unc").show();
	           	$("#unc").fadeOut(2000);
	           //	$("#regName").focus();
	         // Enable submit button
	    } else {
	    	
	    	//return false;
	         // Disable submit button
	    }
	}); 
	$('#status').keypress(function (e) {
        var regex = new RegExp("^[a-zA-Z]+$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
            return true;
        }
        else
        {
        e.preventDefault();
        //alert('Please Enter Alphabate');
        $("#unc").text('Please Enter Alphabates');
    	$("#unc").show();
       	$("#unc").fadeOut(2000);
        return false;
        }
    });
	
	/* $('#description').keypress(function (e) {
        var regex = new RegExp("^[a-zA-Z]+$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
            return true;
        }
        else
        {
        e.preventDefault();
        //alert('Please Enter Alphabate');
        $("#unc").text('Please Enter Alphabates');
    	$("#unc").show();
       	$("#unc").fadeOut(2000);
        return false;
        }
    }); */
	$('#statusPriority').keypress(function (e) {
        var regex = new RegExp("^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
            return true;
        }
        else
        {
        e.preventDefault();
        //alert('Please Enter Alphabate');
        $("#unc").text('Please Enter Numbers');
    	$("#unc").show();
       	$("#unc").fadeOut(2000);
        return false;
        }
    });
	
});

var statusId = 0;
var serviceUnitArray ={};
var data = {};


function showStatusData(response){
	$("#statusData ul").remove();
	$("#statusData ul li").remove();
	serviceUnitArray = {};
	if(response != undefined && response.length >0){
	//var protectType = null;
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.statusId] = catObj;
			/* if(catObj.productType == 1){
				protectType = "mts";		
			}else{  
				protectType = "Nos";
			} */
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
/* function productSearch() {
	
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
	
} */
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
 
</script>
		
		<section class="container">
			<div class="block" id="">
				<h2><span class="icon1">&nbsp;</span>Status</h2>
				<form name="myForm" method="post" id="contact-form"  onsubmit="return false;">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="">
							<label>Status</label>
							 <input type="text" name="status" id="status"   placeholder="Enter Status" tabindex="1" />
							  <input type="hidden" name="statusId" id="statusId"/> 
						</div>
						<div class="block-searchbill-input" id="">
							<label>Description</label>
							 <input type="text" name="description" id="description"   placeholder="Enter Description" tabindex="1" onkeydown=""  />
							 <!-- <input type="hidden" name="productId" id="productId"/> -->
						</div>
						<div class="block-searchbill-input">
							<label>Status Priority</label>
							<input type="text" name="statusPriority" id=statusPriority   tabindex="3" maxlength="2" style="WIDTH: 40px; HEIGHT: 20px" size="2" />
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="cancel"  name="Cancel" type="button" onclick="statusDataClear();" >
                    <input class="btn-save" value="Save" id="saveIds" type="button" onClick="statusReg();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Status Details <aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<!-- <li class="five-box">No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>              -->   
						<li class="nine-box">Status
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box">Description
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box">Status Priority
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>                
						<li class="eleven-box">Edit</li>
						<li class="ten-box last">Delete</li>
					</ul>
					<div class="table-list-blk" id='statusData'>
						<div class="pagenation">
							<div class="holder"></div>           
					</div>
				</div>
				<div class="block-footer">
					<aside class="block-footer-left"><exptotal></exptotal></aside>
					<aside class="block-footer-right">
						<!-- <input class="btn-cancel" name="" value="Cancel" type="button">
						<input class="btn-save" name="" value="Save" type="submit"> -->
					</aside>
				</div>
			</div>
</section>
		
</body>
</html>


		

		