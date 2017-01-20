<%@ include file="header.jsp" %>
<!-- SET: MAIN CONTENT -->
<div class="main_content">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Add New Stock</h2>
        <form name="cf_form" method="post" id="contact-form" class="form-horizontal" action="#" onsubmit="return validationequiry()">
            <div class="block-box-mid-stock">
                <div class="block-input">
                    <label>Product</label>
                    <select id="addclient" name="addclient">
                    </select>  
                </div> 
                <div class="block-input">
                    <label>Quantity</label>
                    <input type="text" name="lmark" id="lmark">
                </div>                 
                <div class="block-input last">
                    <label>Existing Quantity</label>
                    <input type="text" name="lmark" id="lmark">
                </div>                 
                <div class="block-input">
                    <label>Mfg / Purchase Cost</label>
                    <input type="text" name="lmark" id="lmark">
                </div>
                <div class="block-input">
                    <label>MRP</label>
                    <input type="text" name="lmark" id="lmark">                   
                </div> 
                <div class="block-input last">
                    <label>Discount</label>
                    <input type="text" name="lmark" id="lmark">                   
                </div> 
                <div class="block-input">
                    <label>VAT</label>
                    <input type="text" name="lmark" id="lmark">                   
                </div>                
            </div>
            <div class="block-footer">
                <aside class="block-footer-left sucessfully">Sucessfully Message</aside>
                <aside class="block-footer-right">
                    <input class="btn-cancel" name="" value="Cancel" type="button">
                    <input class="btn-save" name="" value="Save" type="submit">
                </aside>
            </div>
        </form>
    </div>
    <div class="block table-toop-space">
        <div class="head-box"><h2><span class="icon2">&nbsp;</span>Current Stock </h2><aside class="search-box">        
                <input class="search-bnt" name="" value="Search" type="button">
                <input class="search-input" name="" type="text">
            </aside>
        </div>
        <div class="block-box-stock block-box-last-stock">
            <ul class="table-list">
                <li class="stock-pcode-box">Product Code
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="bil-desc-box">Product
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
                <li class="five-box">Cost
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
                <li class="five-box">Discount
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li> 
                <li class="five-box">VAT
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="ten-box">Delete</li>
                <li class="eleven-box last">Edit</li>
            </ul>
            <div class="table-list-blk data-grid-stock">
                <ul>
                    <li class="stock-pcode-box">Product Code1</li>
                    <li class="bil-desc-box">Silk Saree</li>
                    <li class="five-box">10</li>
                    <li class="five-box">1000</li>
                    <li class="five-box">1200</li>
                    <li class="five-box">100</li>
                    <li class="five-box">50</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="stock-pcode-box">Product Code2</li>
                    <li class="bil-desc-box">Silk Saree</li>
                    <li class="five-box">10</li>
                    <li class="five-box">1000</li>
                    <li class="five-box">1200</li>
                    <li class="five-box">100</li>
                    <li class="five-box">50</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul> 
                <ul>
                    <li class="stock-pcode-box">Product Code3</li>
                    <li class="bil-desc-box">Silk Saree</li>
                    <li class="five-box">10</li>
                    <li class="five-box">1000</li>
                    <li class="five-box">1200</li>
                    <li class="five-box">100</li>
                    <li class="five-box">50</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul> 
                <ul>
                    <li class="stock-pcode-box">Product Code4</li>
                    <li class="bil-desc-box">Silk Saree</li>
                    <li class="five-box">10</li>
                    <li class="five-box">1000</li>
                    <li class="five-box">1200</li>
                    <li class="five-box">100</li>
                    <li class="five-box">50</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>                 
            </div>
        </div>
        <div class="block-footer">
            <aside class="block-footer-left">Showing 1 to 10 of 57 entries</aside>
            <aside class="block-footer-right">
                <ul class="pagenation">
                    <li><a href="#">Next</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">2</a></li>
                    <li><a class="active" href="#">1</a></li>
                    <li><a href="#">Previous</a></li>
                </ul>
            </aside>
        </div>
    </div>
</div>
<!-- END: MAIN CONTENT --> 
<%@ include file="footer.jsp" %>
