<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE style PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>

</head><body>
<!-- <script type="text/javascript" src="js/jquery-1.7.min.js"></script> -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript" src="/js/CustomPagenation.js"></script> -->
<script type="text/javascript">


</script>
<script type="text/javascript">
var billId = 0;
var serviceUnitArray ={};
var data = {};
var allunBillCart = '${allunBillCart}';

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
						+ catObj.phone
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
						+ "<li class='ten-box' style='width:18%;'><a href='#'><img src='./images/copy.png' width='12' height='12'></a>"
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
function dataClear(){
	
 $('#sBillNo').val("")
 $('#sName').val("");
 $('#sMobileNo').val("");
 $('#sBillFromDate').val("");
 $('#sBillEndDate').val("");
 $('#sBillFromDate').removeClass('your-class default-class');
 /* $("#password").attr("placeholder",""); */
 document.getElementById("addsus").style.display = "none";
 document.getElementById("addfail").style.display = "none";
 document.getElementById("upsus").style.display = "none";
 document.getElementById("upfail").style.display = "none";
 document.getElementById("deleteMsgSus").style.display = "none";
 document.getElementById("deleteMsgFail").style.display = "none";
 document.getElementById("dupMessage").style.display = "none";
 
 $('#saveIds').show();
	$('#saveIds').removeAttr('disabled');
	 
}

$(document).ready(function() {
	
		showBillInfoData(allunBillCart);
});
 
$(function() {
	$("#billFromDate").datepicker({
		changeDate : true,
		changeMonth : true,
		changeYear : true,
		showButtonPanel : false,
		dateFormat : 'yy-mm-dd'
	});
});
$(function() {
	$("#billEndDate").datepicker({
		changeDate : true,
		changeMonth : true,
		changeYear : true,
		showButtonPanel : false,
		dateFormat : 'yy-mm-dd'
	});
});
</script>


<!-- SET: MAIN CONTENT -->
<section class="container">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Search Bill</h2>
        <form name="cf_form"  action="#" onsubmit="return validationequiry()">
            <div class="block-searchbill">
                <div class="block-searchbill-input">
                    <label>Bill No</label>
                    <input type="text" name="pname" id="billNo" onkeyup="unBillInfoCart();">
                </div>
                <div class="block-searchbill-input">
                    <label>Name</label>
                    <input type="text" name="pname" id="name"  onkeyup="unBillInfoCart();">
                </div> 
                <div class="block-searchbill-input">
                    <label>Mobile No</label>
                    <input type="text" name="phone" id="phone"  onkeyup="unBillInfoCart();">
                </div>
            </div>
            <div  class="block-searchbill">
             <div class="block-searchbill-input">
                    <label>Bill Date From</label>
                    <input type="text" name="pname" id="billFromDate">
                </div>
                <div class="block-searchbill-input">
                    <label>Bill Date End</label>
                    <input type="text" name="pname" id="billEndDate">
                </div>
            </div>
            <div class="block-footer">
                <aside class="block-footer-left sucessfully">Sucessfully Message</aside>
                <aside class="block-footer-right">
                    <input class="btn-cancel" name="" value="Cancel" type="button" onclick="dataClear();">
                    <input class="btn-save" name="" value="search" id="search" type="button">
                </aside>
            </div>
        </form>
    </div>
    <div class="block table-toop-space">
        <div class="head-box">
            <h2><span class="icon2">&nbsp;</span>Bill Details</h2>
        </div>
        <div class="block-box-mid block-box-last-mid">
            <ul class="table-list">
                <li class="five-box" style="width:18%;">Bill No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="nine-box" style="width:95%;">Name
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box" style="width:34%;">Mobile No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box" style="width:35%;">Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box" style="width:24%;">Amount
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                 
                <li class="five-box" style="width:21%;">Discount
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li> 
                <li class="five-box" style="width:25%;">LR No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box" style="width:30%;">LR Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box" style="width:25%;">Despatch
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box" style="width:25%;">Desp. Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                 
                <li class="ten-box" style="width:20%;">Details</li>
                <li class="eleven-box last" style="width:16%;">Duplicate</li>
            </ul>
            <div class="table-list-blk" id="billData">
                             
            </div>
        </div>
        <div class="block-footer">
            <aside class="block-footer-left"><exptotal></exptotal></aside>
            <aside class="block-footer-right">
               <!--  <input class="btn-cancel" name="" value="Cancel" type="button">
                <input class="btn-save" name="" value="Save" type="submit"> -->
            </aside>
        </div>
    </div>
</section>
<!-- END: MAIN CONTENT --> 
</body></html>
