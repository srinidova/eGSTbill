<%@ include file="header.jsp" %>
<!-- SET: MAIN CONTENT -->
<div class="main_content">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Add New Expenses</h2>
        <form name="cf_form" method="post" id="contact-form" class="form-horizontal" action="#" onsubmit="return validationequiry()">
            <div class="block-box-exp">
                <div class="block-input">
                    <label>Branch</label>
                    <select id="addclient" name="addclient">
                        <option value="">Select...</option>
                        <option value="1">Client1</option>
                        <option value="2">Client2</option>
                        <option value="3">Client3</option>
                        <option value="4">Client4</option>
                        <option value="5">Client5</option>
                    </select>
                </div> 
                <div class="block-input">
                    <label>Description</label>
                    <input type="text" name="lmark" id="lmark">
                </div>                 
                <div class="block-input  last">
                    <label>Amount</label>
                    <input type="text" name="lmark" id="lmark">
                </div>
                <div class="block-input">
                    <label>Bill No</label>
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
        <div class="head-box"><h2><span class="icon2">&nbsp;</span>Current Expenses </h2><aside class="search-box">        
                <input class="search-bnt" name="" value="Search" type="button">
                <input class="search-input" name="" type="text">
            </aside></div>
        <div class="block-box-mid block-box-last-mid">
            <ul class="table-list">
                <li class="five-box">Bill No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="exp-desc-box">Description
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="nine-box">Amount
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="ten-box">Delete</li>
                <li class="eleven-box last">Edit</li>
            </ul>
            <div class="table-list-blk data-grid-mid">
                <ul>
                    <li class="five-box">11</li>
                    <li class="exp-desc-box">Transport</li>
                    <li class="nine-box">1000</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
            </div>
        </div>
        <div class="block-footer">
            <aside class="block-footer-left"><exptotal>Total Expenses: 1000.00</exptotal></aside>
            <aside class="block-footer-right">
                <input class="btn-cancel" name="" value="Cancel" type="button">
                <input class="btn-save" name="" value="Save" type="submit">
            </aside>
        </div>
    </div>
</div>
<!-- END: MAIN CONTENT --> 
<%@ include file="footer.jsp" %>
