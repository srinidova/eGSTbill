<!DOCTYPE section PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
.login-block {
	font-family: 'Open Sans', sans-serif;
	background: #092756;
	background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
</style>

</head><body>

<!-- <script type="text/javascript" src="js/jquery-1.7.min.js"></script> -->
<script type="text/javascript" src="js/jquery.min.js"></script>
 <!-- <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script> -->
 <script type="text/javascript">
 
 $(document).ready(function() {
		var lstOrders ='${sessionScope.allPurchaseInfo}';
		//showPurchaseData(JSON.parse(lstOrders));
		
		
	});
 function resetPassword() {
 	data = {};
 	data["mobileNoEmail"] = $("#mobileNoEmail").val();
 	data["oldPassword"] = $("#oldPassword").val();
 	data["newPassword"] = $("#newPassword").val();
 	$.ajax({   
 		method: 'POST',			
 		   url: 'resetPassword.htm',
 		   data:"jsondata= "+JSON.stringify(data), 
 		   success: function(data) {
 			   console.log("sendSmssendSmssendSmssendSms");
 		}
 	});
 }

 </script>
	<!-- 	<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>Reset Password</h2>
				<form name="cf_form" method="post" id="contact-form"  onsubmit="return false;">
					<div class="block-searchbill">
						<div class="block-searchbill-input">
							<label>Mobile No/Email:</label>
							<input type="text" name="mobileEmail" id="mobileNoEmail" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input last">
							<label>OldPassword:</label>
							<input type="text" name="oldPassword" id="oldPassword" onkeyup="removeError(this.id);">
						</div> 
					</div>
					<div class="block-searchbill">
					<div class="block-searchbill-input ">
							<label>NewPassword:</label>
							<input type="text" name="newPassword" id="newPassword" onkeyup="removeError(this.id);">
						</div>
					<div class="block-searchbill-input last">
							<label>ConfirmPassword:</label>
							 <input type="text" name="confirmPassword" id="confirmPassword"> 
						</div>
						</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Cancel" type="button">
							<input class="btn-save" name="" value="Save" type="submit" onclick="resetPassword();">
						</aside>
					</div>
				</form>
			</div>
			</section> -->
			
			<!-- SET: MAIN CONTENT -->
<section class="container">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>User ResetForm</h2>
        <form name="cf_form" method="post" id="loginForm" onsubmit="return false;">
            <div class="login-block">                
                <div class="login-un">
                    <label class="login-label-text">MobileNo Or Email:</label>
                    <input class="input-login" type="text" name="mobileNoEmail"  value="" id="mobileNoEmail" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53%;" />
                </div>
                <div class="login-un">
                    <label class="login-label-text">OldPassword:</label>
                    <input class="input-login" type="text" name="oldPassword"  value="" id="oldPassword" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53%; margin-left:12%" />
                </div>
                <div class="login-un">
                    <label class="login-label-text">NewPassword:</label>
                    <input class="input-login" type="text" name="newPassword"  value="" id="newPassword" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53%; margin-left:12%" />
                </div>
                <div class="login-un">
                    <label class="login-label-text" style="margin-left: -5%">ConfirmPassword:</label>
                    <input class="input-login" type="text" name="confirmPassword"  value="" id="confirmPassword" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53%; margin-left:12%" />
                </div>
               <!--  <div class="login-pwd">
                    <label class="login-label-text">OldPassword</label>
                    <input class="input-login" type="text" name="cnumber" value="" id="password" onkeydown="removeBorder(this.id);"  style="margin-left: 37px;width: 54%;" />
                </div>
                 <div class="login-pwd">
                    <label class="login-label-text">NewPassword</label>
                    <input class="input-login" type="text" name="cnumber" value="" id="password" onkeydown="removeBorder(this.id);" style="margin-left:10px;" />
                </div>
                 <div class="login-pwd">
                    <label class="login-label-text">ConfirmPassword</label>
                    <input class="input-login" type="text" name="cnumber" value="" id="password" onkeydown="removeBorder(this.id);" style="margin-left:10px;" />
                </div> -->
                <div class="blck-login"> 
                	<a href="#" class="login-links" style="padding-right:36px;">Forgot Password</a>  | <a href="registration" class="login-links" style="padding-left:29px;">Register</a> 
                </div>            
            </div>
            <div class="block-footer">
                <aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
                <aside class="block-footer-right">
                    <input class="btn-cancel" name="" value="Cancel" type="button">
                    <input class="btn-save" name="" id="login" value="login" type="submit" onclick="resetPassword();">
                </aside>
            </div>
        </form>
    </div>

</div>
<!-- END: MAIN CONTENT --> 
</body>