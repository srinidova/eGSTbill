function CSV(){
	if($("#selectId ").val() == 'product'){
		importCsv();
	}else{
		importPurchase();
	}
}

function importCsv(){
	var ext = $("#import_csv").val().split(".").pop().toLowerCase();
	if($.inArray(ext, ["csv"]) == -1) {
		alert('choose csv file only..');
		return false;
	}
	
	var csvval= "";
	var reader = new FileReader();
	reader.readAsText($("#import_csv")[0].files[0]);
	reader.onload = function(event) {
		var size = $("#import_csv")[0].files[0].size/(1024*1024);
		console.log("csv file size   "+size);
		if(parseFloat(size) > 0.5){
			alert('chose small csv files..');
			return false;
		}
		var products = [];
		csvval=event.target.result.split("\n");
		alert('csvval.length---'+csvval.length);
		 console.log("csvval.length"+csvval[0]);
		// if(csvval[0].split(",").length == 3){
		for(var i=1;i<csvval.length;i++) {
			//var csvvalue=csvval[i].split(",");
			var csvvalue = csvval[i].split(",");
			var productName = $.trim(csvvalue[0]);
			var productType = $.trim(csvvalue[1]);
			var mrp = $.trim(csvvalue[2]);
			var stock = $.trim(csvvalue[3]);
			if(productName != ""){
				//console.log("freeeeeeeeeeeee");
				products.push({"productName":productName,"productType":productType,"mrp":mrp,"stock":stock});
			}
			}
		alert('products.length---'+products.length);
		if (products.length > 0){
			$.ajax({   
				method: 'POST',			
				   url: 'importCSV.htm',
				   data: "jso="+JSON.stringify(products), 
				   success: function(data) {
				if (data != null && data != ""){
					 $("#unc").text('Name already exists. Please choose other Name');
              	 	 $("#unc").show();
                   	 $("#unc").fadeOut(5000);
					
					}else{
						$("#unc").text('Save Sucessfully');
	               	  	 $("#unc").show();
	                     $("#unc").fadeOut(5000);
					}
				}
			});
		}else{
			//no valid contacts.
		}
		 /*}$("#unc").text('choose Purchase csv');
   	  	 $("#unc").show();
         $("#unc").fadeOut(10000);*/
	};
}

function importPurchase(){
	var ext = $("#import_csv").val().split(".").pop().toLowerCase();
	if($.inArray(ext, ["csv"]) == -1) {
		alert('choose csv file only..');
		return false;
	}
	
	var csvval= "";
	var reader = new FileReader();
	reader.readAsText($("#import_csv")[0].files[0]);
	
	reader.onload = function(event) {
		var size = $("#import_csv")[0].files[0].size/(1024*1024);
		console.log("csv file size   "+size);
		if(parseFloat(size) > 0.5){
			alert('chose small csv files..');
			return false;
		}
		var products = [];
		csvval=event.target.result.split("\n");
		alert('csvval.length---'+csvval.length);
		for(var i=1;i<csvval.length;i++) {
			var csvvalue = csvval[i].split(",");
			var name = $.trim(csvvalue[0]);
			var mobileNo = $.trim(csvvalue[1]);
			var eMail = $.trim(csvvalue[2]);
			var address = $.trim(csvvalue[3]);
			if(name != ""){
				products.push({"name":name,"mobileNo":mobileNo,"eMail":eMail,"address":address});
			}
			}
		if (products.length > 0){
			$.ajax({   
				method: 'POST',			
				   url: 'importPurchase.htm',
				   data: "jso="+JSON.stringify(products), 
				   success: function(data) {
				if (data != null && data != ""){
					$("#unc").text('Name already exists. Please choose other Name');
             	 	 $("#unc").show();
                  	 $("#unc").fadeOut(5000);
					}else{
						$("#unc").text('Save Sucessfully');
	               	  	 $("#unc").show();
	                     $("#unc").fadeOut(5000);
					}
				}
			});
		}else{
			//no valid contacts.
		}
	};
}