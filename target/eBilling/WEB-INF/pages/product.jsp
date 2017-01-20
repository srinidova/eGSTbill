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

<script type="text/javascript">
var lstOrders =${allProducts};
$(document).ready(function() {
	
	showProductData(lstOrders);
});



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
						+ "<li class='nine-box'  title='"+catObj.productName+"'>"
						+ catObj.productName
						+ "</li>"
						+ "<li class='five-box'  title='"+protectType+"'>"
						+ protectType
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.mrp+"'>"
						+ catObj.mrp
						+ "</li>"
						
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.productId
						+ "' onclick='editProduct(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box'>"
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
 $('#productType').val("");
 $('#mrp').val("");
}

function editProduct(id)
{		 		
	//productId = serviceUnitArray[id].productId;
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
	data["productId"] = $("#productId").val();
	data["productName"] = $("#productName").val();
	data["mrp"] = $("#mrp").val();
	data["productType"] = $("#productType").val();
	var pId=$("#productId").val();
	if(pId != null && pId.length > 0  ){
		data["productId"] = pId;
		updateProduct();
	}else{
		if($('#productName').val().length == 0 || $('#mrp').val().length == 0){												   
		    
		    if($('#productName').val().length == 0 ) {
			    $('#productName').css('color','red');
			    $("#productName").css("border-color","red");
			    $("#productName").attr("placeholder","Please enter ProductName");
			    $('#productName').addClass('your-class');
			    }
		    
		    else if($('#mrp').val().length == 0 ) {
			    $('#mrp').css('color','red');
			    $("#mrp").css("border-color","red");
			    $("#mrp").attr("placeholder","Please enter mrp");
			    $('#mrp').addClass('your-class');
			   
			    }
		    return false;
			}
			   
		else{
			saveProduct();
	    }
	}
	$("#btn-save").prop("disabled", true);
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
                	  $("#unc").show();
                      $("#unc").fadeOut(5000);
                  }else{
                	showProductData(resJSON);
                	 $("#unc").text('Save Sucessfully');
               	  	 $("#unc").show();
                     $("#unc").fadeOut(5000);
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

            	 if(response != 0){
            		 //alert('aaaasaas');
            		     $("#unc").text("Update Sucessfully");
            		   $("#unc").show();
                       $("#unc").fadeOut(5000); 
                       
            		 showProductData(JSON.parse(response));
            		 $("#productId").val("");
  					$("#productName").val("");
  					$("#productType").val("");
  					$("#mrp").val("");
  					 stop = true;
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
				<h2><span class="icon1">&nbsp;</span>New Product</h2>
				<form name="myForm" method="post" id="contact-form" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="">
							<label>Product Name</label>
							 <input type="text" name="productName" id="productName"   placeholder="Enter Product name" tabindex="1" onkeydown=""  />
							 <input type="hidden" name="productId" id="productId"/>
						</div>
						<div class="block-searchbill-input">
							<label>Product Type</label>
							<select id="productType" name="ptype"    tabindex="2"  />
                        <option value="0">Nos</option>
                        <option value="1">Mts</option>
                    </select>
						</div> 
						<div class="block-searchbill-input">
							<label>MRP</label>
							<input type="text" name="prate" id="mrp"  placeholder="Enter mrp" tabindex="3" />
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="cancel"  name="Cancel" type="button" onclick="productDataClear();" >
                    <input class="btn-save" value="Save" id="saveIds" type="button" onClick="productRegister();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Product Details <aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<!-- <li class="five-box">No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>              -->   
						<li class="nine-box">Name
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box">Type
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box">MRP
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>                
						<li class="eleven-box">Edit</li>
						<li class="ten-box last">Delete</li>
					</ul>
					<div class="table-list-blk" id='userData'>
						<div class="pagenation">
							<div class="holder"></div>           
					</div>
				</div>
				<div class="block-footer">
					<aside class="block-footer-left"><exptotal></exptotal></aside>
					<aside class="block-footer-right">
						<input class="btn-cancel" name="" value="Cancel" type="button">
						<input class="btn-save" name="" value="Save" type="submit">
					</aside>
				</div>
			</div>
</section>
		
</body>
</html>


		
