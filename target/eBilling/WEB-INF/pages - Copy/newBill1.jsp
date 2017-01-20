<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE section PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html><head></head><body>
		 <script type="text/javascript" src="js/newBill.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			var lstOrders ='${allProducts}';
			displayTable(lstOrders);
		});
		
		
		function displayTable(response){
			$("#userData ul").remove();
			$("#userData ul li").remove();
			serviceUnitArray = {};
			$.each(response,function(i, catObj) {
				
					serviceUnitArray[catObj.billDetailsId] = catObj;
						var tblRow ="<ul class=''>"
								/* + "<li class='five-box'  title='"+catObj.billDetailsId+"'>"
								+ catObj.billDetailsId */
								+ "<li class='bil-prod-box'  title='"+catObj.productName+"'>"
								+ catObj.productName
								+ "</li>"
								+ "<li class='five-box'  title='"+catObj.mrp+"'>"
								+ catObj.mrp
								+ "</li>" 
								+ "<li class='five-box'  title='"+catObj.rateId+"'>"
								+ catObj.rateId
								+ "</li>"
								+ "<li class='five-box'  title='"+catObj.quantityId+"'>"
								+ catObj.quantityId
								+ "</li>"
								+ "<li class='five-box'  title='"+catObj.amount+"'>"
								+ catObj.amount
								+ "</li>"
								
								
								+ "<li class='ten-box'>"
								+ "<a href='javascript:void(0)' id='"
								+ catObj.billDetailsId
								+ "' onclick='editPack(this.id)' id='editId class='ico del' href='#'>Edit</a>"
								+ '</li>'
								
								+ "<li class='ten-box'>"
								+ "<a href='javascript:void(0)' id='"
								+ catObj.billDetailsId
								+ "' onclick='forDelete(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
								+ '</li>'
								+ "</li>"
								+"</ul>";
						$(tblRow).appendTo("#userData");
					});
			//paginationTable(3);
		}
		
		
		
		function editBill(id)
		{	
			alert('edit');
			//billDetailsId = serviceUnitArray[id].billDetailsId;
			//$('#billDetailsId').val(id);
			//$('#productName').val( serviceUnitArray[id].productName);
			//$('#productType').val( serviceUnitArray[id].productType);
			$('#mrp').val( serviceUnitArray[id].mrp);
		}
		
		
	function onSelect(){
		//var billDetailsId=$("#billDetailsId").val();
		var productName = $("#productName").val();
		$.ajax({
			type: "POST",
            url: "selectProduct",
            data:"productName=" + productName,
            success: function (response){
            	response = JSON.parse(response);
            	$('#rateId').val(response[0].mrp);
            	
				//displayTable(response);
			
			}
		});
		
	}
		
	
	</script>
		<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>New Bill</h2>
				<form:form name="cf_form" method="post" id="contact-form" commandName="productCmd" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
					<div class="block-searchbill">
						<div class="block-searchbill-input">
							<label>Product Name</label>
							<!-- <select id="productType" name="ptype"    tabindex="2"  />
                                                            <option value="0">Saree</option>
                                                            <option value="1">Blouse</option>
                                                        </select> -->
                         <form:select path="productName" id="productName" onchange="onSelect();"  tabindex="3">
											<form:option value="">--Select--</form:option>
											<form:options value="${}" onclick="editBill()" items="${productSelectName}"></form:options>	
											
												
						 </form:select>
						</div>
						<div class="block-searchbill-input">
							<label>Quantity</label>
							<input  type="text" name="pname" id="quantityId" />
							<input type="hidden" id="billDetailsId">
							<input type="hidden" id="billId">
							<input type="hidden" id="productId">
							<input type="hidden" id="mrp">
							<input type="hidden" id="rate">
						</div> 
						<div class="block-searchbill-input">
							<label>Rate</label>
							<form:input path="mrp" type="text" name="prate" id="rateId"></form:input>
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully">Sucessfully Message</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Cancel" type="button">
							<input class="btn-save" name="" value="Save" type="submit">
						</aside>
					</div>
				</form:form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Bill Products</h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
                                    <ul class="table-list">
                                        <li class="five-box">S.No
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                
                                        <li id="bil-prod-box">Description
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>
                                        <li class="five-box">MRP
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                                         
                                        <li class="five-box">Quantity
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>
                                        <li class="five-box">Rate
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
                                        <li class="ten-box">Delete</li>
                                        <li class="eleven-box last">Edit</li>
                                    </ul>
					<div class="table-list-blk">
						<!-- <ul>
							<li class="five-box">1</li>
							<li class="bil-prod-box">Saree</li>
							<li class="five-box">1200</li>                                                        
							<li class="five-box">2</li>
							<li class="five-box">1000</li>
							<li class="five-box">2,000</li>                  
							<li class="ten-box"><a href="#">Edit</a></li>
							<li class="eleven-box last"><a href="#">Delete</a></li>
						</ul>
						<ul>
							<li class="five-box">2</li>
							<li class="bil-prod-box">Blouse</li>
							<li class="five-box">220</li>                                                        
							<li class="five-box">5</li>
							<li class="five-box">200</li>
							<li class="five-box">2,000</li>                  
							<li class="ten-box"><a href="#">Edit</a></li>
							<li class="eleven-box last"><a href="#">Delete</a></li>
						</ul> -->
                                                <ul>
                                                    <div class="block-box-exp">
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Payment Type</label>
                                                                <select id="addclient" name="addclient">
                                                                    <option value="1">Cash</option>
                                                                    <option value="2">Card</option>
                                                                    <option value="3">Cheque</option>
                                                                </select> 
                                                            </div> 
                                                            <div class="block-input">
                                                                <label>Discount</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>                 
                                                            <div class="block-input  last">
                                                                <label><b>Total Amount</b></label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Name</label>
                                                                <input type="text" name="lmark" id="lmark">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>Mobile No</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>Address</label>
                                                                <textarea name="address1" id="address1" rows="3"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>LR No</label>
                                                                <input type="text" name="lmark" id="lmark">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>LR Date</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Order No</label>
                                                                <input type="text" name="lmark" id="lmark">                  
                                                            </div>                                                        
                                                            <div class="block-input">
                                                                <label>Order Date</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>Ordered By</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Despatched By</label>
                                                                <input type="text" name="lmark" id="lmark">                  
                                                            </div>
                                                            <div class="block-input">
                                                                <label>Despatched Date</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>No of Packages</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Pack Slip No</label>
                                                                <input type="text" name="lmark" id="lmark">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>Terms of Payment</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>Terms</label>
                                                                <input type="text" name="lmark" id="lmark">
                                                            </div>
                                                        </div>
                                                    </div>
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
		</section>
		
		</body></html>
