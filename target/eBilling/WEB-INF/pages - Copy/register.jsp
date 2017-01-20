<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$("#btn-save").on("click",function(event) {
		taxiRegister();
	});
});
function taxiRegister() {
	var data = {}
	data["regName"] = $("#regName").val();
	data["mobileNo"] = $("#mobileNo").val();
	data["userType"] = $("#userType").val();

	$("#btn-save").prop("disabled", true);

	$.ajax({
             type: "POST",
             url: "regSave.htm",
             data: "jsondata= "+JSON.stringify(data),
             success: function (data) {
                 $("#btn-update").prop("disabled", false);
                 //...
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
                 //...
             }

	}); 
	return false;
}
</script>

<!-- <form action="" id="search-form" method="post" onsubmit="return;" style="    width: 50%;">

Name :<input id="regName" type="text" name="regName"/>
Mobile No :<input id="mobileNo" name ="mobileNo" value="">
user Type:<select id="userType"  name ="userType">
<option value="1">Admin</option>
<option value="2">User</option>
<option value="3">Vendor</option>
</select>
<input type="submit" id="btn-save" value="Register">
</form> -->
</body>
</html>