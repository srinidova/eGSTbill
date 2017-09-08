<%
//System.out.println("From Jsp------");
boolean bShow = false;
boolean bMasterAdmin = false;
boolean bshowOnly = false;
boolean bshowManager = false;
if(session.getAttribute("LOGINROLE") != null){
	String sRole=(String)session.getAttribute("LOGINROLE"); 
	//System.out.println("In Menu jsp sRole=="+sRole);
	
	if(sRole != null && sRole.equals("MasterAdmin") ){
		bMasterAdmin = true;
	}
	if(sRole != null && (sRole.equals("MasterAdmin") || sRole.equals("Admin") ) ){
		bShow = true;
	}
	if(sRole.equals("Employee")){
		bshowOnly = true;
	}
	if(sRole.equals("Manager")){
		bshowManager = true;
	}
	
}


%>

<!-- Menu Start -->
<div class="clearfix"></div>
<div id="header-area" class="header_area">
	<div class="header_bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav role="navigation" class="navbar navbar-default mainmenu">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" data-target="#navbarCollapse"
								data-toggle="collapse" class="navbar-toggle">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div id="navbarCollapse" class="collapse navbar-collapse">
							<ul id="fresponsive" class="nav navbar-nav dropdown">
							   <% if(bShow){ %>
								<li class="active"><a href="productHome">Product</a></li>
								<li class="active"><a href="newBillHome">New Bill</a></li>
								<li class="active"><a href="purchaserHome">Purchaser</a></li>
								<li class="active"><a href="shippingHome">Shipping</a></li>
								<!-- <li class="active"><a href="loginHome">LogOut</a></li> -->
								<li class="active"><a href="userHome">User</a></li>
								<li class="active"><a href="unbilledHome">UnBilled</a></li>
							   <%}  if(bMasterAdmin){ %>
									<li class="active"><a href="clientHome">Client</a></li>
									<li class="active"><a href="loginHome">LogOut</a></li>
								<%}else if(bshowOnly){%>
								<li class="active"><a href="newBillHome">New Bill</a></li>
								<li class="active"><a href="loginHome">LogOut</a></li>
								<%}else if(bshowManager){%>
								<li class="active"><a href="productHome">Product</a></li>
								<li class="active"><a href="newBillHome">New Bill</a></li>
								<li class="active"><a href="purchaserHome">Purchaser</a></li>
								<li class="active"><a href="shippingHome">Shipping</a></li>
								<li class="active"><a href="loginHome">LogOut</a></li>
								<% } else{%>
								 <!-- <li class="active"><a href="loginHome">Login</a></li>  -->
								 <li class="active"><a href="loginHome">LogOut</a></li>
							    <%}%>
							<%-- <%if(bshowOnly){ %>
								<li class="active"><a href="newBillHome">New Bill</a></li>
								<% }%>
								<% } else{%>
								<li class="active"><a href="loginHome">LogOut</a></li>
								<% }%> --%>
								
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<!-- /.header_bottom -->
	</div>
</div>