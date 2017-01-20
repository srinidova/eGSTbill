<%@ include file="header.jsp" %>
<!-- SET: MAIN CONTENT -->
<div class="main_content">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Select Client</h2>
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
        <div class="head-box"><h2><span class="icon2">&nbsp;</span>Permissions</h2><aside class="search-box">        
                <input class="search-bnt" name="" value="Search" type="button">
                <input class="search-input" name="" type="text">
            </aside></div>
        <div class="block-box-big block-box-last-big">
            <ul class="table-list">
                <li class="user-fname-box">Users
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="six-box">Role</li>
                <li class="six-box">KPHB</li>
                <li class="six-box">ECIL</li>
                <li class="eleven-box last">All</li>
            </ul>
            <div class="table-list-blk data-grid-big">
                <ul>
                    <li class="user-fname-box">cottonadmin</li>
                    <li class="six-box"><a href="#">cottonadmin</a></li>
                    <li class="six-box"><input type="checkbox"></li>
                    <li class="six-box"><input type="checkbox"></li>
                    <li class="eleven-box last"><input type="checkbox"></li>
                </ul>
                <ul>
                    <li class="user-fname-box">cottonsup</li>
                    <li class="six-box"><a href="#">cottonsup</a></li>
                    <li class="six-box"><input type="checkbox"></li>
                    <li class="six-box"><input type="checkbox"></li>
                    <li class="eleven-box last"><input type="checkbox"></li>
                </ul>
                <ul>
                    <li class="user-fname-box">cottonsale1</li>
                    <li class="six-box"><a href="#">cottonsale1</a></li>
                    <li class="six-box"><input type="checkbox"></li>
                    <li class="six-box"><input type="checkbox"></li>
                    <li class="eleven-box last"><input type="checkbox"></li>
                </ul>
                <ul>
                    <li class="user-fname-box">cottonsale2</li>
                    <li class="six-box"><a href="#">cottonsale2</a></li>
                    <li class="six-box"><input type="checkbox"></li>
                    <li class="six-box"><input type="checkbox"></li>
                    <li class="eleven-box last"><input type="checkbox"></li>
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
