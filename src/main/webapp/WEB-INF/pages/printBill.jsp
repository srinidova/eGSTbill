<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE >
<html>
<head>
<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>
</head>
<body>
<c:out value="${printInfo}"></c:out>
<c:out value="${email}"></c:out>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		
	
	var printBill= '${sessionScope.allPrintBill}';
	
	$(document).ready(function() {
		
		showPrintData(printBill);
	});
	
	
	
	function showPrintData(response){
		$("#userData ul").remove();
		$("#userData ul li").remove();
		serviceUnitArray = {};
		response = jQuery.parseJSON(response);
		if(response != undefined && response.length >0){
		$.each(response,function(i, catObj) {
			//alert('catObj.billId=='+catObj.billId);
			$('#billNo').text(catObj.billNo);
			$('#billDate').text(catObj.billDate);
			 $('#lrNo').text(catObj.lrNo);
			 $('#lrDate').text(catObj.lrDate);
			 $('#orderNo').text(catObj.orderNo);
			 $('#orderDate').text(catObj.orderDate);
			 $('#dispatchedBy').text(catObj.dispatchedBy);
			 $('#noOfPacks').text(catObj.noOfPacks);
			 $('#orderBy').text(catObj.orderBy);
			 $('#packSlipNo').text(catObj.packSlipNo);
			 $('#termsOfPayment').text(catObj.termOfPayment);
			 $('#terms').text(catObj.terms);
			 $('#name').text(catObj.name);
			 $('#totalAmount').text(catObj.totalAmount);
			 $('#totalMrp').text(catObj.totalMrp);
			 $('#totalQuantity').text(catObj.totalQuantity);
			 $('#totalRate').text(catObj.totalRate);
			 $('#discount').text(catObj.discount);
			 
			 /* 
			 $('#phone').val(catObj.phone);
			 $('#address').val(catObj.address);
			 $('#dispatchedDate').val(catObj.dispatchedDate);
			 $('#lrDate').val(catObj.lrDate); */
		});
		}
	}
	
	
	</script>

	<section class="container">
		<div style="">
			<table width="100%">
				<tr>
					<td style="width: 15%;"><img src="images/ganesh.png"
						width="100" height="100" alt=""></td>
					<td style="width: 85%;">
						<div style="text-align: center; font-size: 25px;">GOUTHAMI
							HANDLOOMS</div>
						<div style="text-align: center; font-size: 15px;">KUKATAPALLY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HYDERABAD</div>
						<div style="text-align: center; font-size: 15px;">gouthamihandlooms@gmail.com
						</div>
						<div style="text-align: center; font-size: 15px;">Contact:123456789
						</div>
						<div style="text-align: center; font-size: 15px;">TIN:123456789
						</div>
					</td>
				</tr>
				<tr>
					<td style="" colspan="2">
						<table border="" rowspan="0" colspan="0" width="100%">
							<tr>
								<td style="width: 30%;">
									<div>M/s Gouthami HANDLOOMS</div>
									<div>M.I.G-183,BharatNagar Colony</div>
									<div>Moosapet</div>
									<div>PH NO:123456789</div>

								</td>
								<td style="width: 70%;">
									<table border="" rowspan="0" colspan="0" width="100%">
										<tr>
											<td>INVOICE NO:</td>
											<td><div id="billNo"></div></td>
											<td >DATE:</td>
											<td><div id="billDate"></div></td>
										</tr>
										<tr>
											<td>LR NO:</td>
											<td><div id="lrNo"></div></td>
											<td >DATE:</td>
											<td><div id="lrDate"></div></td>
										</tr>
										<tr>
											<td>ORDER NO:</td>
											<td><div id="orderNo"></div></td>
											<td>ORDER DATE:</td>
											<td><div id="orderDate"></div></td>
										</tr>
										<tr>
											<td>DISPATCHED BY:</td>
											<td><div id="dispatchedBy"></div></td>
											<td>NO OF PACKS:</td>
											<td><div id="noOfPacks"></div></td>
										</tr>
										<tr>
											<td>ORDERED BY:</td>
											<td><div id="orderBy"></div></td>
											<td>PACK SLIP NO:</td>
											<td><div id="packSlipNo"></div></td>
										</tr>
										<tr>
											<td>Terms of Payment:</td>
											<td><div id="termsOfPayment"></div></td>
											<td>TERMS</td>
											<td><div id="terms"></div></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="margin: 5px;" colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td style="margin: 5px;" colspan="2">
						<ul class="table-list">
							<li class="five-box">S.No</li>
							<li id="bil-prod-box"><b><div id="name"></div></b></li>
							<li class="five-box"><b><div id="totalMrp"></div></b></li>
                            <li class="five-box"><b><div id="totalQuantity"></div></b></li>
                            <li class="five-box"><b><div id="totalRate"></div></b></li>
                            <li class="five-box"><b><div id="totalAmount"></div></b></li>
							
						</ul>
					</td>
				</tr>
				<!-- <div>
					<table border="" bordercolor="red" rowspan="0" colspan="0"
						width="100%">
						<tr>
							<td style="margin: 5px;" colspan="3">
								<ul class="table-list">
									<li class="five-box">S.No</li>
									<li id="bil-prod-box">Description</li>
									<li class="five-box">MRP</li>
									<li class="five-box">Total Qty</li>
									<li class="five-box">Total</li>
									<li class="five-box">Discount</li>
								</ul>
							</td>
						</tr>
					</table>
				</div> -->

			</table>
		</div>

	</section>

</body>
</html>



