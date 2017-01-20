<!DOCTYPE >
<head>
<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>

</head><body>

<!-- <script type="text/javascript" src="js/jquery-1.7.min.js"></script> -->
<script type="text/javascript" src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/userRegister.js"></script>
 <script type="text/javascript" src="js/validations.js"></script>
 <!-- <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script> -->
 <script type="text/javascript">
 $(document).ready(function() {
		var lstOrders ='${allregInfo}';
		showRegisterData(lstOrders);
	});
 
 </script>
		<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>New Purchaser</h2>
				<form name="cf_form" method="post" onsubmit="return false;" id="contact-form" >
					<div class="block-searchbill">
						<div class="block-searchbill-input">
							<label >Name</label>
							<input type="text" name="regName" id="regName" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input">
							<label>Mobile No</label>
							<input type="text" name="mobileNo" id="mobileNo" onkeyup="removeError(this.id);" >
						</div> 
						<div class="block-searchbill-input last">
							<label>Email</label>
							<input type="text" name="eMail" id="eMail" onkeyup="removeError(this.id);">
						</div>
					</div>
					<div class="block-searchbill">
					<div class="block-searchbill-input">
							<label>Register Type</label>
							<select id="regType" name="regType"    tabindex=""  />
                                                            <option value="Admin">Admin</option>
															<option value="User">User</option>
															<option value="Vendor">Vendor</option>
                                                        </select> 
						</div>
						<div class="block-searchbill-input last">
							<label>Password</label>
							<input type="password" name="password" id="password" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input last">
							<label>Confirm Password</label>
							<input type="password" name="cPassword" id="cPassword" onkeyup="removeError(this.id);">
						</div>
						</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Cancel" type="button" onclick="dataClear();">
							<input class="btn-save" name="" value="Save" id="saveId" type="submit" onclick="userRegister();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Product Details<aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<li class="nine-box">Name
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box">Mobile No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box">eMail
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>    
						<li class="five-box">RegisterType
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>            
						<li class="ten-box">Edit</li>
						<li class="ten-box last">Delete</li>
					</ul>
					<div class="table-list-blk" id="userData">
						<!-- <ul>
							<li class="nine-box">Shirts</li>
							<li class="five-box">1,000</li>
							<li class="five-box">Nos</li>                    
							<li class="ten-box"><a href="#">Edit</a></li>
							<li class="ten-box last"><a href="#">Delete</a></li>
						</ul>
						<ul>
							<li class="nine-box">Phants</li>
							<li class="five-box">2,000</li>
							<li class="five-box">Mts</li>                    
							<li class="ten-box"><a href="#">Edit</a></li>
							<li class="ten-box last"><a href="#">Delete</a></li>
						</ul>    -->                                         
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