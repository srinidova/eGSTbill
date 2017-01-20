
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
			<li> New Billing </li>
			<li> Registration </li>
			<li> Purchase Info </li>
			<li>SearchBill</li>
			<li>Bill Info </li>
			<li>unBillCart</li>
			<li>clientInfo</li>
            <!-- //<li><a href="/eBilling/loginHome">Login</a></li> -->
            <li style="padding-left:50%;">Hi,<a href="/eBilling/loginHome">Login</a></li>

        <% } else {
         %>
         <li> <a href="productHome">Product</a> </li>
		<li> <a href="newBill">New Billing</a> </li>
		<li> <a href="purchaseInfoHome">Purchase Info</a> </li>
		<li> <a href="searchBill">SearchBill</a> </li>
		<li> <a href="billInfoHome">Bill Info</a> </li>
		<li> <a href="unBillCart">UnBillCart</a> </li>
		<li> <a href="clientHome">ClientInfo</a> </li>
		<li> <a href="uploadHome">uploadPage</a> </li>
		<li> <a href="damageHome">DamageProduct</a> </li>
		<li> <a href="statusHome">StatusPage</a> </li>
        <li style="padding-left:19%;">Hi, <%=register.getRegName() %><a href="logOut" id="logout">Logout</a></li>
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