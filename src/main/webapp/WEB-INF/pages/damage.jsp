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
var lstDamage ='${allDamages}';
$(document).ready(function() {
	
	getAllProducts();
	showDamageData(JSON.parse(lstDamage));
	
	
	/* $('#productName').keypress(function (e) {
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
	
	$('#mrp').keypress(function (e) {
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
    }); */
	
	
});
function getAllProducts() {
	var allProducts = '${sessionScope.allProducts}';
	if(typeof allProducts != ''){
		allProducts = JSON.parse(allProducts); 
		if(allProducts != null && allProducts.length > 0){
		var html = "<option value=''>-- Select --</option>";
		$.each(allProducts,function(i, produtObj) {
			 html = html + '<option value="'
				+ produtObj.productId + '">'
				+ produtObj.productName + '</option>';
		});
		$('#productId').empty().append(html);
		}	
	} else {
		
	}
}

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
</script>
		
		<section class="container">
			<div class="block" id="">
				<h2><span class="icon1">&nbsp;</span>Damage</h2>
				<form name="myForm" method="post" id="contact-form" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="">
							<label>Product Id</label>
							<select style="margin-left:120px; margin-top:-27px;" id="productId" name="productId">
							
                                                            	<option value="">--Select--</option> 
                                                        </select>
                              <input  type="hidden" name="damageId" id="damageId">                          
							<!-- <input type="text" name="productName" id="productName"   placeholder="Enter Product name" tabindex="1" onkeydown=""  /> -->
							 <input type="hidden" name="productId" id="productId"/>
							 <input type="hidden" name="productName" id="productName"/>
						</div>
						
						<div class="block-searchbill-input">
							<label>Quantity</label>
							<input type="text" name="prate" id="quantity"  placeholder="Enter quantity" tabindex="3" />
						</div>
						<div class="block-searchbill-input">
							<label>Description</label>
							<textarea name="description" id="description" rows="5"></textarea>
							<!-- <input type="textbox" name="prate" id="description"  placeholder="Enter description" tabindex="3" /> -->
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="cancel"  name="Cancel" type="button" onclick="damageDataClear();" >
                    <input class="btn-save" value="Save" id="saveIds" type="button" onClick="damageRegister();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Damage Details <aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<!-- <li class="five-box">No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>              -->   
						<li class="nine-box" style="width:300%;">Product Id
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:140%;">Quantity
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:140%;">Description
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>                
						<li class="eleven-box" style="width:140%;">Edit</li>
						<li class="ten-box last" style="width:140%;">Delete</li>
					</ul>
					<div class="table-list-blk" id='userData'>
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


		
