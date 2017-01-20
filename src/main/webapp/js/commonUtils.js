/*function onlyLeters(val,errId) {
	var regex = new RegExp("^[a-zA-Z]+$");
	if (regex.test(val)) {
        return true;
    }
    else
    {
    $("#"+errId).text('Please Enter Alphabates');
    $("#"+errId).show();
    $("#"+errId).fadeOut(5000);
    return false;
    }

}
function checkLength(val,errId) {
	var textbox = document.getElementById("productName");
	if (textbox.value.length < 3) {
		$("#"+errId).text('Minimum 3 values Required');
		$("#"+errId).show();
		$("#"+errId).fadeOut(5000);
	}
}
function allNumbers(val,errId){
	 var regex = new RegExp("^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$");
     if (regex.test(val)) {
         return true;
     }
     else
     {
     $("#"+errId).text('Please Enter Numbers');
     $("#"+errId).show();
     $("#"+errId).fadeOut(5000);
     return false;
     }
}*/