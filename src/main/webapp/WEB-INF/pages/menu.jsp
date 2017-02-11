
<%@page import="com.eBilling.model.Register"%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
$("#logout").click(function(){
	  $.ajax({ 
	    	type : "GET",
			url : "logOut",
			success : function(response){
				//alert('logout');
			}
	  });
	});
});
</script>
<nav>
<ul id="menuDiv">
			<%
			Register register = (Register) session.getAttribute("userInfo");                     
                if(register == null) {
            %>
            <li> Product </li>
            <li> Stock </li>
            <li> Purchaser </li>
			<li> New Bill </li>
			<li>BillSearch</li>
			<li> UnBill </li>
			<li> Damage </li>
			<li> Upload </li>
			<li> Users </li>
			<li> Send Sms </li>
			<!-- <li>Bill Info </li> -->
			<!-- <li>clientInfo</li> -->
            <!-- //<li><a href="/eBilling/loginHome">Login</a></li> -->
            <li style="padding-left:50%;">Hi,<a href="/eBilling/loginHome">Login</a></li>

        <% } else {
         %>
         <li> <a href="productHome">Product</a> </li>
         <li> <a href="stockHome">Stock</a> </li>
         <li> <a href="purchaseInfoHome">Purchaser</a> </li>
		<li> <a href="newBill">New Bill</a> </li>
		<li> <a href="searchBill">BillSearch</a> </li>
		<!-- <li> <a href="billInfoHome">Bill Info</a> </li> -->
		<li> <a href="unBillCart">UnBill</a> </li>
		<!-- <li> <a href="clientHome">ClientInfo</a> </li> -->
		<li> <a href="damageHome">Damage</a> </li>
		<li> <a href="uploadHome">Upload</a> </li>
		<li> <a href="allUsers">Users</a> </li>
		<li> <a href="sendSmsHome">Send Sms</a> </li>
		<!-- <li> <a href="statusHome">Status</a> </li> -->
		
        <li style="padding-left:19%;">Hi, <%=register.getRegName() %><a href="logOut" id="logout" style="margin-left: 73px;">Logout</a></li>
        <% }%>
		
</ul>
    <!-- <ul>
        <li> <a href="department.jsp">Department</a> </li>
        <li> <a href="client.jsp">Client </a> </li>
        <li> <a href="user.jsp">User </a> </li>
        <li> <a href="branch.jsp">Branch </a> </li>
        <li> <a href="permissions.jsp">Permissions </a> </li>
        <li> <a href="category.jsp">Category </a> </li>
        <li> <a href="subcategory.jsp">Sub Category</a> </li>
        <li> <a href="product.jsp">Product</a> </li>
        <li> <a href="#">Stock</a> 
            <ul>
                <li><a href="stockentry.jsp">Stock Entry</a></li>
                <li><a href="stockallocation.jsp">Stock Allocation</a></li>
                <li><a href="stockreturn.jsp">Stock Return</a></li>
            </ul>
        </li>
        <li> <a href="billing.jsp">Billing </a> </li>
        <li> <a href="expenses.jsp">Expenses</a> </li>
        <li> <a href="#">Reports</a> 
            <ul>
                <li><a href="todaysales.jsp">Today Sales</a></li>
                <li><a href="todayexpenses">Today Expenses</a></li>
                <li><a href="todaystock.jsp">Today Stock</a></li>
                <li><a href="todayall.jsp">Today All</a></li>
            </ul>		  
        </li>
        <li> <a href="#">Server</a> 
            <ul>
                <li><a href="#">Stock Upload</a></li>
                <li><a href="#">Stock Download</a></li>
                <li><a href="#">Sales Upload</a></li>
            </ul>		  
        </li>
    </ul> -->
</nav>