<%@page import="com.eGSTbill.model.User, com.eGSTbill.model.Client"%>
<%
//System.out.println("in header page");

User user= null;
Client client = null;
String sPropri = "";
String sGmail ="";
String sMobile ="";
String sAddress ="";
String sGstn ="";
String userName ="";

if(session.getAttribute("USER") != null){
	user=(User)session.getAttribute("USER"); 
	//System.out.println("in header clientId"+user.getClientId());
	client = user.getClient();
	//System.out.println("in header getContactPerson$$$$$$$$$$$$$----"+client.getContactPerson());
	sPropri = client.getContactPerson();
	sGmail = client.getEmail();
	sMobile = client.getMobile();
	sAddress = client.getAddress();
	sGstn = client.getGstn();
	userName = client.getCompanyName();
}
%>
<!-- Banner Start-->
<html>
</body>
<div id="top_header">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-12 col-xs-12">
				<div class="mobile_nos">
					<h2>Mobile Nos :<%= sMobile %></h2>
					<!-- <ul>
						<li><a href="#">+91-9246885990 ,</a></li>
						<li><a href="#">9246595990 ,</a></li>
						<li><a href="#">9247180238</a></li>
					</ul> -->
				</div>
			</div>
			<div class="col-md-4 col-sm-8 col-xs-8">
				<div class="email_id">
					<a href="#">Email : <%= sGmail %></a>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4">
				<div class="login_button">
					<div class="dropdown">
						<button onclick="myFunction()" class="dropbtn">Hi, <%= userName %></button>
						<div id="myDropdown" class="dropdown-content">
							<a href="#">Logout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<div id="header">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="logo" style="display:;" id="image">
					<a href="#"><img src="images/logo-dova.png"
						class="img-responsive" alt=""></a>
				</div>
			</div>
			<div class="col-md-4 pull-right" id="headerUser">
				<div class="address">
					<h2>Prop: <%= sPropri %></h2>
					<p>
					<%= sAddress %>
						
						<br />
						 
					</p>
					<h3>GSTN: <%= sGstn %></h3>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Banner End -->

<script type="text/javascript">



		var lstClients ='${LISTCLIENTS}';
		var lstUser ='${USER}';
		//Register register = (Register) session.getAttribute("userInfo");    
		//User user = (User) session.getAttribute("USER");
		/* $(document).ready(function() {
			displayDetails(JSON.parse(lstClients));
	}); */
		
		function displayDetails(){
			alert("in to displayDetails");
			
		}
		</script>
		</body>
</html>