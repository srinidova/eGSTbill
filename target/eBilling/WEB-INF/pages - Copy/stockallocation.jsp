<%@ include file="header.jsp" %>
<!-- SET: MAIN CONTENT -->
<div class="main_content">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Stock Allocation</h2>
        <form name="cf_form" method="post" id="contact-form" class="form-horizontal" action="#" onsubmit="return validationequiry()">
            <div class="block-box-small">
                <div class="block-input">
                    <label>Client Name</label>
                    <select id="addclient" name="addclient">
                    </select> 
                </div>
            </div>
            <div class="block-footer">
                <aside class="block-footer-left sucessfully">Sucessfully Message</aside>
                <aside class="block-footer-right">
                    <!--input class="btn-cancel" name="" value="Cancel" type="button">
                    <input class="btn-save" name="" value="Save" type="submit"-->
                </aside>
            </div>
        </form>
    </div>
    <div class="block table-toop-space">
        <div class="head-box"><h2><span class="icon2">&nbsp;</span>Current Stock</h2><aside class="search-box">        
                <input class="search-bnt" name="" value="Search" type="button">
                <input class="search-input" name="" type="text">
            </aside></div>
        <div class="block-box-big block-box-last-big">
            <ul class="table-list">
                <li class="stock-pcode-box">Product Code
                    <ul>
                        <li><astock class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="stock-product-box">Product</li>
                <li class="stock-alloc-brnch-box">In Stock - MRP</li>
                <li class="stock-alloc-brnch-box">KPHB - MRP</li>
                <li class="stock-alloc-brnch-box last">ECIL - MRP</li>
            </ul>
            <div id="stock-alloca" class="table-list-blk data-grid-big">
                <ul>
                    <li class="stock-pcode-box">Product Code1</li>
                    <li class="stock-product-box"><a href="#">Product1</a></li>
                    <li class="stock-alloc-brnch-box"><input type="text"><input type="text"></li>
                    <li class="stock-alloc-brnch-box"><input type="text"><input type="text"></li>
                    <li class="stock-alloc-brnch-box last"><input type="text"><input type="text"></li>
                </ul>
                <ul>
                    <li class="stock-pcode-box">Product Code1</li>
                    <li class="stock-product-box"><a href="#">Product1</a></li>
                    <li class="stock-alloc-brnch-box"><input type="text"><input type="text"></li>
                    <li class="stock-alloc-brnch-box"><input type="text"><input type="text"></li>
                    <li class="stock-alloc-brnch-box last"><input type="text"><input type="text"></li>
                </ul>                
            </div>
        </div>
        <div class="block-footer">
            <aside class="block-footer-left"></aside>
            <aside class="block-footer-right">
                <input class="btn-cancel" name="" value="Cancel" type="button">
                <input class="btn-save" name="" value="Save" type="submit">
            </aside>
        </div>
    </div>
</div>
<!-- END: MAIN CONTENT --> 
<%@ include file="footer.jsp" %>
