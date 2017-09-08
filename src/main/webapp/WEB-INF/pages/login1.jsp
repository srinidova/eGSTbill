<!-- Includes Start-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>eGSTbill</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link href="css/eGSTbill/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/eGSTbill/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/eGSTbill/datetimepicker.css" rel="stylesheet" type="text/css">
<link href="css/eGSTbill/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>

</head>
<!-- Includes End-->
<body>
	<div class="clearfix"></div>
	<div id="body_content">
		<div class="container">
			<div class="row">
				<!-- ADD SECTION START -->
				<div class="new_bill">
					<div class="col-md-12">
						<fieldset>
							<legend>Login</legend>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Mobile</label> 
									<input class="form-control" id="userMobile" value="9986626618" name="userMobile"
										type="text" placeholder="">
										<!--  <input type="hidden" class="form-control"  id="loginId" name="loginId"> -->
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="">Password</label> <input class="form-control" value="pass@123" id="userPassword" name="userPassword"
										type="text" placeholder="">
								</div>
							</div>
							<!-- <div class="col-md-4">
								<div class="form-group">
									<label for="">Rate</label> <input class="form-control"
										type="text" placeholder="">
								</div>
							</div> -->
							<div class="col-md-10">
								<div id="loginFrmMsg"
									style="display: none; margin-bottom: -20px; margin-top: 1px; text-align: right; font-weight: bold;">Save
									Sucessfully</div>
							</div>
							<div class="col-md-3 pull-right">
								<div class="buttons">
									<ul>
										<li>
											<button class="btn btn-primary " onclick="login();">Login</button>
										</li>
										<li>
											<button class="btn btn-primary">clear</button>
										</li>
									</ul>
								</div>
							</div>
							 <div class="row">
								<a href="#" class="pull-left need-help" id="resetPassword"
									onclick="resetPassword();">Reset password</a> <a href="#"
									class="pull-right need-help" style="color: #448D00;"
									onclick="forgotpassword();">forgot password</a> <span
									class="clearfix"></span>
							</div> 
						</fieldset>
					</div>
				</div>
				<!-- ADD SECTION END -->
				<div class="clearfix"></div>
				<!-- LIST SECTION START -->
				<!-- LIST SECTION END -->
			</div>
		</div>
	</div>
	</div>
	<div class="clearfix"></div>
	<script type="text/javascript">
	function login() {
		data = {};
		data["userMobile"] = $("#userMobile").val();
		data["userPassword"] = $("#userPassword").val();
		//alert("in to login==="+userMobile);
		$.ajax({
			type : "POST",
			url : "login.htm",
			data : data,
			dataType : 'json',
			success : function(response) {
				
				 alert("in to login page");
				 
				resJSON = JSON.parse(response);
				if (response != null) {
					if (resJSON.status == "ERROR") {
						$("#loginFrmMsg").text(resJSON.message);
						$("#loginFrmMsg").show();
						$("#loginFrmMsg").fadeOut(15000);
						$("#loginFrmMsg").val("");
					} else {
						$("#loginFrmMsg").text('Client login  Sucessfully');
						$("#loginFrmMsg").show();
						$("#loginFrmMsg").fadeOut(15000);
						
					}

				}
/* 				 if (response != null) {
					 alert("in to login page response "+response);
					 //window.location.href = "newBill.jsp";
					 if (resJSON.status == "ERROR") {
						 alert("in to login page error ");
					} else {
						window.location.href = 'newBillHome.htm';
					} 

				}   */
			},
			error : function(e) {
				//$("#btn-save").prop("disabled", false);
			}
		});
	}
	function forgotpassword(){
		data = {};
		data["userMobile"] = $("#userMobile").val();
		data["userPassword"] = $("#userPassword").val();
			//alert("in to forgot password==="+userMobile);
			$.ajax({
				type : "POST",
				url : "forgotPassword.htm",
				data : data,
				success : function(data) {
					/* if (data.Msg == 'success') {
						$("#errLogin").text("Password sent to your Mobile. Please Re Login.");
					}else{
						$("#errLogin").text(data.Msg);
					}   */
					
				}
			});
		}
	function resetPassword(){
		//alert("in to resetpassword")
		data = {};
		data["userMobile"] = $("#userMobile").val();
		data["userPassword"] = $("#userPassword").val();
			
			$.ajax({
				data : data,
				url : "resetPassword.htm",
				success : function(data) {
					if (data.Msg == 'success') {
						$("#errLogin").text("OTP sent to your Mobile. Please Re Login.");
					}else{
						$("#errLogin").text(data.Msg);
					}  
					
				}
			});
		}
	
	</script>
</body>
</html>
