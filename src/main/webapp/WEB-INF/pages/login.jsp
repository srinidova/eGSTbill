
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <!-- <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script> --> 
<form action=""   onsubmit="return;">

userNamer :<input type="text" name="name" id="name">
Password :<input type="password" name="password" id="password">
 <input type="button" value="submit" onclick="saveLoginInfo();">

</form>

<script type="text/javascript">

	

function saveLoginInfo(){
	 data = {};
	 
	data["name"] = $("#name").val();
	data["password"] = $("#password").val();
	data["loginId"] = $("#loginId").val();
	$.ajax({
            type: "POST",
            url: "saveLogin.htm",
            success: function (response) {
            data:  "jsondata= "+JSON.stringify(data),
                $("#btn-save").prop("disabled", false);
                resJSON = JSON.parse(response);
               
                },
            error: function (e) { 
                $("#btn-save").prop("disabled", false);
            }

	}); 
}


</script>
</body>
</html>