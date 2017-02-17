var billId = 0;
var serviceUnitArray ={};
var data = {};

function unBillInfoCart(){
	data = {};
	var billno = $("#billNo").val();
	data["billNo"] = $("#billNo").val();
	data["name"] = $("#name").val();
	data["phone"] = $("#phone").val();
	$.ajax({   
		type : "POST",
		url : "unBillInfoCart.json?ts" + new Date(),
		 data: "jsondata= "+JSON.stringify(data),
		success : function(response) {
			//alert(response);
			showBillInfoData(response);
		
		}
	});
}

function showBillInfoData(response){
	serviceUnitArray = {};
	$("#billData ul").remove();
	$("#billData ul li").remove();
	response = jQuery.parseJSON(response);
	if(response != undefined && response.length >0){
	$.each(response,function(i, catObj) {
			serviceUnitArray[catObj.billId] = catObj;
				var tblRow = "<ul class=''>"
						+ "<li class='five-box' style='width:18%;'>"
						+ catObj.billNo
						+ "</li>"
						+ "<li class='nine-box' style='width:94%;'>"
						+ catObj.name
						+ "</li>"
						+ "<li class='five-box' style='width:34%;'>"
						+catObj.phone
						+ "</li>"
						+ "<li class='five-box' style='width:35%;'>"
						+ catObj.billDate
						+ "</li>"
						+ "<li class='five-box' style='width:24%;'>"
						+ catObj.totalAmount
						+ "</li>"
						+ "<li class='five-box' style='width:21%;'>"
						+ catObj.discount
						+ "</li>"
						+ "<li class='five-box' style='width:25%;'>"
						+ catObj.lrNo
						+ "</li>"
						+ "<li class='five-box' style='width:30%;'>"
						+ catObj.lrDate
						+ "</li>"
						+ "<li class='five-box' style='width:25%;'>"
						+ catObj.dispatchedBy
						+ "</li>"
						+ "<li class='five-box' style='width:25%;'>"
						+ catObj.dispatchedDate
						+ "</li>"
						+ "<li class='ten-box' style='width:20%;'><a id='"+catObj.billId+"' onclick='unBillPrint(this.id);return false;'><img src='./images/icon2.jpg'></a>"
						+"</li>"
						+ "<li class='ten-box' style='width:16.5%;'><a id='"+catObj.billId+"' onclick='updateUnbillCart(this.id);return false;'><img src='./images/copy.png' width='12' height='12'></a>"
						+"</li>"
						+"</ul>"
				$(tblRow).appendTo("#billData");
			});
	//paginationTable(7);
	}
}
 function unBillPrint(billno){
	data = {};
	data["billNo"] = billno;
	$.ajax({   
		type : "GET",
		url : "unBillInfo",
		 data: "billId="+billno,
		success : function(response) {
		//alert(response);
		window.location.href = "billInfoHome";
		}
	});
} 
 
 function updateUnbillCart(billId){
		data = {};
		data["billId"] = billId;
		$.ajax({   
			type : "GET",
			url : "updateUnbillCart",
			 data: "billId="+billId,
			success : function(response) {
			console.log(response);
			window.location.href = "newBill";
			}
		});
	}
function dataClear(){
	
 $('#billNo').val("")
 $('#name').val("");
 $('#phone').val("");
 $('#billFromDate').val("");
 $('#billEndDate').val("");
 	 
}