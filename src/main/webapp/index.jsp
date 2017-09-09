<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Billing</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link href="css/eGSTbill/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/eGSTbill/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/eGSTbill/login.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="container">
  <div class="col-sm-8 col-sm-offset-2 main">
    <div id="login-box">
      <div class="col-md-6">
        <div class="main_logo"> <img src="images/logo-dova.png" class="img-responsive" alt="">
          <p>DovaSoft Technologies is an IT Outsourcing, Software Solutions and Service providers.</p>
        </div>
      </div>
      <div class="col-md-6">
        <div class="login_form"> <img src="images/logo.png" class="img-responsive" alt="">
          <div class="main-login main-center">
            <form class="form-horizontal" id="loginForm">
            <div class="col-md-12">
              <div class="form-group">
                <label for="username" class="cols-sm-2 control-label">Mobile</label>
                <spin id="LoginFrmMsg" style="display: none; margin-left:100px ; text-align: right; font-weight: bold;">aaaaa</spin>
                <div class="cols-sm-10">
                  <div class="input-group"> <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" name="userMobile" id="userMobile"  placeholder="Enter your Mobile"/>
                  </div>
                </div>
              </div>
              </div>
              <div class="col-md-12">
              <div class="form-group">
                <label for="password" class="cols-sm-2 control-label">Password</label>
                <div class="cols-sm-10">
                  <div class="input-group"> <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <input type="password" class="form-control" name="userPassword" id="userPassword"  placeholder="Enter your Password"/>
                  </div>
                </div>
              </div>
              </div>
              <div class="login-register"> <a href="#" style="float:left;" onclick="resetPassword();">Reset Password</a> <a href="#" onclick="forgotpassword();">Forgot password</a> </div>
              <div class="col-md-12">
              <div class="form-group ">
                <button type="button" class="btn btn-primary btn-lg btn-block login-button" onclick="loginFormValidate();">Login</button>
                <button type="button" class="btn btn-primary btn-lg btn-block login-button" onclick="loginClear();">Clear</button>
              </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>
<div id="particles-js"></div>
<div class="top"> <a href="#" class="scrollToTop"></a> </div>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>

<script>
function loginFormValidate() {
	if ($("#loginForm").valid()) {
		//alert("----Ok---");
		login();
	}
}

function login() {
	//alert("===in login===");
	data = {};
	data["userMobile"] = $("#userMobile").val();
	data["userPassword"] = $("#userPassword").val();
	
	$.ajax({
		type : "POST",
		url : "login.htm",
		data : data,
		success : function(response) {
			resJSON = JSON.parse(response);
			//alert("------sucess response----resJSON=="+resJSON.status);
			if (response != null) {
				if (resJSON.status == "success") {
					//alert("------sucess ----");
					window.location.href = "newBillHome.htm";
				} else {
					//alert("------error ----");
					$("#LoginFrmMsg").text(resJSON.message);
					$("#LoginFrmMsg").show();
					$("#LoginFrmMsg").fadeOut(15000);
				}

			}
		},
		error : function(e) {
		}
	});

}

function forgotpassword(){
	data = {};
	data["userMobile"] = $("#userMobile").val();
	data["userPassword"] = $("#userPassword").val();
		////alert("in to forgot password==="+userMobile);
		$.ajax({
			type : "POST",
			url : "forgotPassword.htm",
			data : data,
			success : function(data) {
				 if (data.Msg == 'success') {
					$("#errLogin").text("Password sent to your Mobile. Please Re Login.");
				}else{
					$("#errLogin").text(data.Msg);
				}   
				
			}
		});
	}
	
function resetPassword(){
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
	$("#loginForm").validate(
			{
				rules : {

					userMobile : {
						required : true,

						number : true
					},
					userPassword : {
						required : true

					},
				},
				messages : {

					userMobile : {
						required : "Please enter Mobile",
						number : "Please enter numbers Only"
					},
					userPassword : {
						required : "Please enter Password"

					},
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					error.addClass("help-block");

					if (element.prop("type") === "checkbox") {
						error.insertAfter(element.parent("label"));
					} else {
						error.insertAfter(element);
					}
				},
				highlight : function(element, errorClass, validClass) {
					$(element).parents(".col-sm-5").addClass("has-error")
							.removeClass("has-success");
				},
				unhighlight : function(element, errorClass, validClass) {
					$(element).parents(".col-sm-5").addClass("has-success")
							.removeClass("has-error");
				}
			});
	$.validator.addMethod("alpha", function(value, element) {
		return this.optional(element) || value == value.match(/^[a-zA-Z\s]+$/);
	});

	$.getScript("js/particles.min.js", function() {
		particlesJS('particles-js', {
			"particles" : {
				"number" : {
					"value" : 80,
					"density" : {
						"enable" : true,
						"value_area" : 800
					}
				},
				"color" : {
					"value" : "#ffffff"
				},
				"shape" : {
					"type" : "circle",
					"stroke" : {
						"width" : 0,
						"color" : "#000000"
					},
					"polygon" : {
						"nb_sides" : 5
					},
					"image" : {
						"width" : 100,
						"height" : 100
					}
				},
				"opacity" : {
					"value" : 0.5,
					"random" : false,
					"anim" : {
						"enable" : false,
						"speed" : 1,
						"opacity_min" : 0.1,
						"sync" : false
					}
				},
				"size" : {
					"value" : 5,
					"random" : true,
					"anim" : {
						"enable" : false,
						"speed" : 40,
						"size_min" : 0.1,
						"sync" : false
					}
				},
				"line_linked" : {
					"enable" : true,
					"distance" : 150,
					"color" : "#ffffff",
					"opacity" : 0.4,
					"width" : 1
				},
				"move" : {
					"enable" : true,
					"speed" : 6,
					"direction" : "none",
					"random" : false,
					"straight" : false,
					"out_mode" : "out",
					"attract" : {
						"enable" : false,
						"rotateX" : 600,
						"rotateY" : 1200
					}
				}
			},
			"interactivity" : {
				"detect_on" : "canvas",
				"events" : {
					"onhover" : {
						"enable" : true,
						"mode" : "repulse"
					},
					"onclick" : {
						"enable" : true,
						"mode" : "push"
					},
					"resize" : true
				},
				"modes" : {
					"grab" : {
						"distance" : 400,
						"line_linked" : {
							"opacity" : 1
						}
					},
					"bubble" : {
						"distance" : 400,
						"size" : 40,
						"duration" : 2,
						"opacity" : 8,
						"speed" : 3
					},
					"repulse" : {
						"distance" : 200
					},
					"push" : {
						"particles_nb" : 4
					},
					"remove" : {
						"particles_nb" : 2
					}
				}
			},
			"retina_detect" : true,
			"config_demo" : {
				"hide_card" : false,
				"background_color" : "#b61924",
				"background_image" : "",
				"background_position" : "50% 50%",
				"background_repeat" : "no-repeat",
				"background_size" : "cover"
			}
		});

	});
	
	function loginClear() {
		$("#loginForm")[0].reset();
		$("#loginForm").data('validator').resetForm();
	}
</script> 
<script>$(document).ready(function(){
	
	//Check to see if the window is top if not then display button
	$(window).scroll(function(){
		if ($(this).scrollTop() > 100) {
			$('.scrollToTop').fadeIn();
		} else {
			$('.scrollToTop').fadeOut();
		}
	});
	
	//Click event to scroll to top
	$('.scrollToTop').click(function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});
	
});

</script>
</body>
</html>
