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
var allSearchBill = '${sessionScope.allSearchBill}';

function searchBill(){
	data = {};//VALUE RAVATEM LETHU GA avi anni input values levu undala AVASARAM LETHU ASALU RAVALI GA BILL IDbill id tisukona
	var billno = $("#billNo").val();
	data["billNo"] = $("#billNo").val();
	data["name"] = $("#name").val();
	data["phone"] = $("#phone").val();
	$.ajax({   
		type : "POST",
		url : "searchBillInfo.json",
		 data: "jsondata= "+JSON.stringify(data),
		success : function(response) {
			//alert(response);
			showBillInfoData(response);
		
		}
	});
}

function showBillInfoData(response){
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	$("#billData ul").remove();
	$("#billData ul li").remove();
	
	if(response != undefined && response.length >0){
	$.each(response,function(i, catObj) {
			serviceUnitArray[catObj.billId] = catObj;
				var tblRow = "<ul class=''>"
						+ "<li class='five-box'>"
						+ catObj.billNo
						+ "</li>"
						+ "<li class='nine-box'>"
						+ catObj.name
						+ "</li>"
						+ "<li class='five-box'>"
						+ catObj.phone
						+ "</li>"
						+ "<li class='five-box'>"
						+ catObj.billDate
						+ "</li>"
						+ "<li class='five-box'>"
						+ catObj.totalAmount
						+ "</li>"
						+ "<li class='five-box'>"
						+ catObj.discount
						+ "</li>"
						+ "<li class='five-box'>"
						+ catObj.lrNo
						+ "</li>"
						+ "<li class='five-box'>"
						+ catObj.lrDate
						+ "</li>"
						+ "<li class='five-box'>"
						+ catObj.dispatchedBy
						+ "</li>"
						+ "<li class='five-box'>"
						+ catObj.dispatchedDate
						+ "</li>"
						+ "<li class='ten-box'><a href='newBill' id='"+catObj.billId+"' onclick='test(this.id)'><img src='./images/icon2.jpg'></a>"
						+"</li>"
						+ "<li class='ten-box'><a href='#'><img src='./images/copy.png' width='12' height='12'></a>"
						+"</li>"
						 +"</ul>"
				$(tblRow).appendTo("#billData");
			});
	//paginationTable(7);
	}
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
	
		showBillInfoData(allSearchBill);
		/* $("#billFromDate").datepicker(); */
   
/*  $("#biillNo").keyup(function() {   controll ki vellu
	 var billNo = $('#billNo').val("")

    $("#billData ul").find("li").each(function(index) {
        if (index === 0) return;
        var billNo = $(this).find("li").first().text();
        $(this).toggle(id.indexOf(billNo) !== -1);
    });
});  */
//$('#attached_docs [value=""]').find ... .remove();


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
<div class="main_content">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Search Bill</h2>
        <form name="cf_form" class="form-horizontal" action="#" onsubmit="return validationequiry()">
            <div class="block-bill-search">
                <div class="block-input">
                    <label>Bill No</label>
                    <input type="text" name="pname" id="billNo" onkeyup="searchBill();">
                </div>
                <div class="block-input">
                    <label>Name</label>
                    <input type="text" name="pname" id="name"  onkeyup="searchBill();">
                </div> 
                <div class="block-input">
                    <label>Mobile No</label>
                    <input type="text" name="phone" id="phone"  onkeyup="searchBill();">
                </div>
            </div>
            <div  class="block-bill-search">
             <div class="block-input">
                    <label>Bill Date From</label>
                    <input type="text" name="pname" id="billFromDate">
                </div>
                <div class="block-input last">
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
                <li class="five-box">Bill No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="nine-box">Name
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box">Mobile No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box">Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box">Amount
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                 
                <li class="five-box">Discount
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li> 
                <li class="five-box">LR No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box">LR Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box">Despatch
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box">Desp. Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                 
                <li class="ten-box">Details</li>
                <li class="eleven-box last">Duplicate</li>
            </ul>
            <div class="table-list-blk" id="billData">
                             
            </div>
        </div>
        <div class="block-footer">
            <aside class="block-footer-left"><exptotal></exptotal></aside>
            <aside class="block-footer-right">
                <input class="btn-cancel" name="" value="Cancel" type="button">
                <input class="btn-save" name="" value="Save" type="submit">
            </aside>
        </div>
    </div>
</div>
<!-- END: MAIN CONTENT --> 
</body></html>
