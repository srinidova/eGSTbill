<%@ include file="header.jsp" %>
<!-- SET: MAIN CONTENT -->
<div class="main_content">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Add New Department</h2>
        <form name="cf_form" method="post" id="contact-form" class="form-horizontal" action="#" onsubmit="return validationequiry()">
            <div class="block-box-small">
                <div class="block-input">
                    <label>Department</label>
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
        <div class="head-box"><h2><span class="icon2">&nbsp;</span>Current Departments </h2><aside class="search-box">        
                <input class="search-bnt" name="" value="Search" type="button">
                <input class="search-input" name="" type="text">
            </aside></div>
        <div class="block-box-big block-box-last-big">
            <ul class="table-list">
                <li class="dept-box">Department Name
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="ten-box">Delete</li>
                <li class="eleven-box last">Edit</li>
            </ul>
            <div class="table-list-blk data-grid-big">
                <ul>
                    <li class="dept-box">Department1</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="dept-box">Department2</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="dept-box">Department3</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="dept-box">Department4</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>  
                <ul>
                    <li class="dept-box">Department5</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="dept-box">Department6</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="dept-box">Department7</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="dept-box">Department8</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="dept-box">Department9</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box last"><a href="#">Edit</a></li>
                </ul>
                <ul>
                    <li class="dept-box">Department10</li>
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
