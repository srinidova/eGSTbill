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
 <script type="text/javascript" src="js/product.js"></script>
 <script type="text/javascript" src="js/commonUtils.js"></script>

<script type="text/javascript">
var lstOrders ='${allProducts}';
$(document).ready(function() {
	
	/* showProductData(JSON.parse(lstOrders));
	
	
	$('#productName').keypress(function (e) {
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
function sendSms(){
	data = {};
	data["message"] = $("#message").val();
	data["sendTo"] = $("#sendTo").val();
	$.ajax({
        type: "POST",
        url: "sendSms.htm",
        data: "jsondata= "+JSON.stringify(data),
        success: function (response) {
       		 if(response != "" ){
	       		$("#unc").text('Send Sucessfully');
	       	  	$("#unc").show();
	       	  	$("#unc").fadeOut(10000);
       		 }
       		 
               /*  if(resJSON != null ){
               	 $("#userData ul li").remove();
               	 for(i=0;i<resJSON.length;i++){
               		 
               		 displayUserRow(resJSON[i],'prepend');
               	 }
               	 
               	  $("#unc").text('Save Sucessfully');
               	  	$("#unc").show();
               	  	$("#unc").fadeOut(10000);
 					 	
 					return false;
                 }
       	  else {
       		 
       	 } */
            },
        error: function (e) { 
            $("#btn-save").prop("disabled", false);
        }

}); 
}

</script>
		
		<section class="container">
			<div class="block" id="">
				<h2><span class="icon1">&nbsp;</span>Send Sms</h2>
				<form name="myForm" method="post" id="contact-form" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="">
							<label>Message:</label>
							 <textarea rows="4" cols="30" name="message" id="message" ></textarea>
						</div>
						<div class="block-searchbill-input">
							<label>Send To:</label>
							<select id="sendTo" name="sendTo"    tabindex="2"  />
                        <option value="0">Purchaser</option>
                        <option value="1">Custmor</option>
                    </select>
						</div> 
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="cancel"  name="Cancel" type="button" onclick="" >
                    <input class="btn-save" value="Submit" id="Submit" type="button" onClick="sendSms();">
						</aside>
					</div>
				</form>
			</div>
			
</section>
		
</body>
</html>


		
