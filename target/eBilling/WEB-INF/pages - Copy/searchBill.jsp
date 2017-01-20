<<!DOCTYPE style PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>

<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>

</head><body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="/js/CustomPagenation.js"></script> -->
<script type="text/javascript">


</script>
<script type="text/javascript">
var billId = 0;
var serviceUnitArray ={};
var data = {};


function showBillInfoData(response){
	$("#userdata ul").remove();
	$("#userdata ul li").remove();
	serviceUnitArray = {};
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.billId] = catObj;
				var tblRow =" <div class='table-list-blk data-grid-mid' id='userData'>"
					    +"<ul class=''>"
						+ "<li class='exp-desc-box'  title='"+catObj.sBillNo+"'>"
						+ catObj.sBillNo
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.sName+"'>"
						+ catObj.sName
						+ "</li>"
						+ "<li class='nine-box'  title='"+catObj.sMobileNo+"'>"
						+ catObj.sMobileNo
						+ "</li>"
						+ "<li class='nine-box'  title='"+catObj.sBillFromDate+"'>"
						+ catObj.sBillFromDate
						+ "</li>"
						+ "<li class='nine-box'  title='"+catObj.sBillEndDate+"'>"
						+ catObj.sBillEndDate
						+ "</li>"
						
						+ "<li class='eleven-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billId
						+ "' onclick='editPack(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billId
						+ "' onclick='forDelete(this.id)' id='delId' class='delRec' href='#'>DeleteDelete</a>"
						+ '</li>'
						
						/* + "<li class='three-box'>"
						 + "<a href='javascript:void(0)' id='"
						+ catObj.id
						+ "' onclick='forDelete(this.id)' class='ico del'>Delete</a>" 
						+ '</li>' */
						 + "</li>"
						 +"</ul>"
						 +"</div>"
				$(tblRow).appendTo("#itemcontainer");
			});
	paginationTable(7);
}
function productSearch() {
	
	$.ajax({
		type : "POST",
		url : "datebetweenSearch.json",
		dataType : "json",
		data : {
			startdate : startdate,
			enddate : enddate,
		},
		success : function(response) {
			showBillInfoData(JSON.parse(response));
			//displayTable(response);
			if(response == null || response =="" ){
				$("#itemContainer ul li").remove();
				$("#itemContainer ul").remove();
			}
		
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

function editPack(id)
{		 		
	billId = serviceUnitArray[id].billId;
	$('#sBillNo').val( serviceUnitArray[id].sBillNo);
	$('#sName').val( serviceUnitArray[id].sName);
	$('#sMobileNo').val( serviceUnitArray[id].sMobileNo);
	$('#sBillFromDate').val( serviceUnitArray[id].sBillFromDate);
	$('#sBillEndDate').val( serviceUnitArray[id].sBillEndDate);
}
function forDelete(id) {
	var count = 0;
	
	 //jConfirm('Do You Want to Delete ?', 'Alert Box',
		//	 function(r)
		//	 
	//f (r == true) 
		if(confirm('Do You Want to Delete?')){
			
		}
		//var deleteId = $("#productId").val();
		$.ajax({
					type : "POST",
					url : "deleteBillInfo.json",
					data : "id=" + id,
					dataType : "json",
					success : function(list) {
						document.getElementById("upsus").style.display = "none";
						document.getElementById("addsus").style.display = "none";
						document.getElementById("deleteMsgSus").style.display = "block"; 
						//showData(list);
						
						showBillInfoData(JSON.parse(list));
						
					}
				});
}

function saveSearchBill() {
	 data = {};
	data["sBillFromDate"] = $("#sBillFromDate").val();
	data["sBillNo"] = $("#sBillNo").val();
	data["sMobileNo"] = $("#sMobileNo").val();
	data["sName"] = $("#sName").val();
	data["sBillEndDate"] = $("#sBillEndDate").val();
	if(billId != 0){
		data["billId"] = billId;
		update();
	}else{
		save();
	}
	$("#btn-save").prop("disabled", true);
  
}

function save(){
	$.ajax({
             type: "POST",
             url: "saveBillInfo.htm",
             data: data,
             success: function (response) {
                 $("#btn-save").prop("disabled", false);
                 if(response != null ){
                	 showBillInfoData(JSON.parse(response));
  					//showProductData(JSON.parse(res));
  					document.getElementById("upsus").style.display = "none";
  					document.getElementById("addsus").style.display = "block";
  					document.getElementById("deleteMsgSus").style.display = "none";
  					$("#sBillNo").val("");
  					$("#sName").val("");
  					$("#sMobileNo").val(0);
  					$("#sBillFromDate").val("");
  					$("#sBillEndDate").val("");
                 }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
                 //...
             }

	}); 
}
function update(){
	$.ajax({
             type: "POST",
             url: "updateBillInfo.htm",
             data: "jsondata= "+JSON.stringify(data),
             time:1000,
             success: function (response) {

            	 if(response != null ){
            		 showBillInfoData(JSON.parse(response));
  					//showProductData(JSON.parse(res));
  					document.getElementById("upsus").style.display = "none";
  					document.getElementById("addsus").style.display = "block";
  					document.getElementById("deleteMsgSus").style.display = "none";
  					$("#sBillNo").val("");
  					$("#sName").val("");
  					$("#sMobileNo").val(0);
  					$("#sBillFromDate").val(0);
  					$("#sBillEndDate").val(0);
                 }
                 
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
                 //...
             }

	}); 
}
//$(delRec).closest("tr").remove();
</script>
<script type="text/javascript">
function DeleteRow(delRec) {
$.get('../ProtocolSummary/DeleteRowATList?id2=' + delRec, function(data, status){
    if(status=="active")
    {
       $.get('../ProtocolSummary/BindRowATList',function(data){
         alert("Data had bind to the grid");
       });                                             
    }
 $(delRec).closest("tr").remove();
});

}
</script>










<!-- SET: MAIN CONTENT -->
<div class="main_content">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Search Bill</h2>
        <form name="cf_form" class="form-horizontal" action="#" onsubmit="return validationequiry()">
            <div class="block-bill-search">
                <div class="block-input">
                    <label>Bill No</label>
                    <input type="text" name="pname" id="sBillNo">
                </div>
                <div class="block-input">
                    <label>Name</label>
                    <input type="text" name="pname" id="sName">
                </div> 
                <div class="block-input last">
                    <label>Mobile No</label>
                    <input type="text" name="prate" id="sMobileNo">
                </div>
                <div class="block-input">
                    <label>Bill Date From</label>
                    <input type="text" name="pname" id="sBillFromDate">
                </div>
                <div class="block-input">
                    <label>Bill Date End</label>
                    <input type="text" name="pname" id="sBillEndDate">
                </div> 
            </div>
            <div class="block-footer">
                <aside class="block-footer-left sucessfully">Sucessfully Message</aside>
                <aside class="block-footer-right">
                    <input class="btn-cancel" name="" value="Cancel" type="button" onclick="dataClear();">
                    <input class="btn-save" name="" value="Save" id="saveIds" type="button" onclick="saveSearchBill();">
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
            <div class="table-list-blk">
                <ul>
                    <li class="five-box">1</li>
                    <li class="nine-box">Rama Rao</li>
                    <li class="five-box">9876543210</li>
                    <li class="five-box">01/02/2016</li>
                    <li class="five-box">1,20,000</li>
                    <li class="five-box">5,000</li>
                    <li class="five-box">aaa23</li>
                    <li class="five-box">01/02/2016</li>
                    <li class="five-box">52</li>
                    <li class="five-box">01/02/2016</li>                      
                    <li class="ten-box"><a href="#"><img src="./images/icon2.jpg"></a></li>
                    <li class="eleven-box last"><a href="#"><img src="./images/copy.png" width="12" height="12"></a></li>
                </ul>
                <ul>
                    <li class="five-box">1</li>
                    <li class="nine-box">Rama Rao</li>
                    <li class="five-box">9876543210</li>
                    <li class="five-box">01/02/2016</li>
                    <li class="five-box">1,20,000</li>
                    <li class="five-box">5,000</li>
                    <li class="five-box">aaa23</li>
                    <li class="five-box">01/02/2016</li>
                    <li class="five-box">52</li>
                    <li class="five-box">01/02/2016</li>                      
                    <li class="ten-box"><a href="#"><img src="./images/icon2.jpg"></a></li>
                    <li class="eleven-box last"><a href="#"><img src="./images/copy.png" width="12" height="12"></a></li>
                </ul>              
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
