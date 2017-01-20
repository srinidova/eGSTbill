<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

function importCsv(){
	var ext = $("#import_csv").val().split(".").pop().toLowerCase();
	if($.inArray(ext, ["csv"]) == -1) {
	/* 	$('#smsnchat_error  > p').text(SELECT_CSV_FILE);
		$('#smsnchat_error').css("display","block");
		setInterval(function(){$("#smsnchat_error").fadeOut();}, 5000); */
		alert('choose csv file only..');
		return false;
	}
	
	var csvval= "";
	var reader = new FileReader();
	reader.readAsText($("#import_csv")[0].files[0]);
	
	reader.onload = function(event) {
		var size = $("#import_csv")[0].files[0].size/(1024*1024);
		//console.log("csv file size   "+size);
		if(parseFloat(size) > 0.5){
			/* $('#smsnchat_error  > p').text(BIG_CSV);
			$('#smsnchat_error').css("display","block");
			setInterval(function(){$("#smsnchat_error").fadeOut();}, 5000); */
			alert('chose small csv files..');
			return false;
		}
		var toPhones = [];
		csvval=event.target.result.split("\n");
		for(var i=1;i<csvval.length;i++) {
			var csvvalue=csvval[i].split(",");
			var csvvalue = csvval[i].split(",");
			var phone = $.trim(csvvalue[0]);
			var name = $.trim(csvvalue[1]);
			toPhones.push({"rollNo":phone,"name":name});
			}
		if (toPhones.length > 0){
			$.ajax({   
				method: 'POST',			
				   url: 'importRollCSV.htm',
				   data: "jso="+JSON.stringify(toPhones), 
				   success: function(data) {
			/* jQuery.fn.makeRequestWithContent('POST', 'application/json',  "rest/twilio/add/number",
					JSON.stringify( {"username":sessionContactObj.userName, "password":sessionContactObj.password,"ToPhones":toPhones}), function (data) { */
				if (data != null && data != ""){
					
					}
				}
			});
		}else{
			//no valid contacts.
		}
	};
}


</script>
<b>Import Roll CSV: </b>
	<input type='file' id='import_csv' name='csv' onchange='importCsv();'>


</body>
</html>