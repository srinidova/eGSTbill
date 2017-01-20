<%@ include file="header.jsp" %>
<!-- SET: MAIN CONTENT -->
<div class="main_content">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Add New User</h2>
        <form name="cf_form" method="post" id="contact-form" class="form-horizontal" action="#" onsubmit="return validationequiry()">
            <div class="block-box">
                <div class="block-input">
                    <label>Client Name</label>
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
                    <label>Role</label>
                    <select id="addclient" name="addclient">
                        <option value="">Select...</option>
                        <option value="1">Client1</option>
                        <option value="2">Client2</option>
                        <option value="3">Client3</option>
                        <option value="4">Client4</option>
                        <option value="5">Client5</option>
                    </select>
                </div>
                <div class="block-input last">
                    <label>Contact No</label>
                    <input type="text" name="city" id="city">
                </div>
                <div class="block-input">
                    <label>First Name</label>
                    <input type="text" name="state" id="state">
                </div>
                <div class="block-input">
                    <label>Last Name</label>
                    <input type="text" name="pin" id="pin">
                </div>
                <div class="block-input last">
                    <label>Email</label>
                    <input type="text" name="phone" id="phone">
                </div>
                <div class="block-input">
                    <label>User Name</label>
                    <input type="text" name="cperson" id="cperson">
                </div>
                <div class="block-input">
                    <label>Password</label>
                    <input type="text" name="cnumber" id="cnumber">
                </div>
                <div class="block-input last">
                    <label>Confirm Password</label>
                    <input type="text" name="email" id="email">
                </div>
                <div class="block-input">
                    <label>Hint Question</label>
                    <input type="text" name="theme" id="theme">
                </div>
                <div class="block-input">
                    <label>Hint Answer</label>
                    <input type="text" name="theme" id="theme">
                </div>
                <div class="block-input last">
                    <label>Address</label>
                    <textarea name="address2" id="address2" rows="3"></textarea>
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
        <div class="head-box"><h2><span class="icon2">&nbsp;</span>Current Users </h2><aside class="search-box">        
                <input class="search-bnt" name="" value="Search" type="button">
                <input class="search-input" name="" type="text">
            </aside></div>
        <div class="block-box block-box-last">
            <ul class="table-list">
                <li class="user-fname-box">First Name
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="user-fname-box">Last Name
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="user-fname-box">User Name
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="six-box">Role
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="seven-box">Contact No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="nine-box">Email
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="ten-box">Delete</li>
                <li class="eleven-box">Edit</li>
                <li class="four-box last">Status</li>                
            </ul>
            <div class="table-list-blk">
                <ul>
                    <li class="user-fname-box">Pradip Kumar</li>
                    <li class="user-fname-box">Sharma</li>
                    <li class="user-fname-box">bommanaadmin</li>
                    <li class="six-box">Admin</li>                    
                    <li class="seven-box">8977802373</li>
                    <li class="nine-box">pradipsharma1986@gmail.com</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box"><a href="#">Edit</a></li>
                    <li class="eleven-box last"><input type="checkbox"></li>                                  
                </ul>
                <ul>
                    <li class="user-fname-box">Pradip Kumar</li>
                    <li class="user-fname-box">Sharma</li>
                    <li class="user-fname-box">bommanaadmin</li>
                    <li class="six-box">Admin</li>                    
                    <li class="seven-box">8977802373</li>
                    <li class="nine-box">pradipsharma1986@gmail.com</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box"><a href="#">Edit</a></li>
                    <li class="eleven-box last"><input type="checkbox"></li>                                  
                </ul> 
                <ul>
                    <li class="user-fname-box">Pradip Kumar</li>
                    <li class="user-fname-box">Sharma</li>
                    <li class="user-fname-box">bommanaadmin</li>
                    <li class="six-box">Admin</li>                    
                    <li class="seven-box">8977802373</li>
                    <li class="nine-box">pradipsharma1986@gmail.com</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box"><a href="#">Edit</a></li>
                    <li class="eleven-box last"><input type="checkbox"></li>                                  
                </ul>
                <ul>
                    <li class="user-fname-box">Pradip Kumar</li>
                    <li class="user-fname-box">Sharma</li>
                    <li class="user-fname-box">bommanaadmin</li>
                    <li class="six-box">Admin</li>                    
                    <li class="seven-box">8977802373</li>
                    <li class="nine-box">pradipsharma1986@gmail.com</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box"><a href="#">Edit</a></li>
                    <li class="eleven-box last"><input type="checkbox"></li>                                  
                </ul>  
                <ul>
                    <li class="user-fname-box">Pradip Kumar</li>
                    <li class="user-fname-box">Sharma</li>
                    <li class="user-fname-box">bommanaadmin</li>
                    <li class="six-box">Admin</li>                    
                    <li class="seven-box">8977802373</li>
                    <li class="nine-box">pradipsharma1986@gmail.com</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box"><a href="#">Edit</a></li>
                    <li class="eleven-box last"><input type="checkbox"></li>                                  
                </ul>
                <ul>
                    <li class="user-fname-box">Pradip Kumar</li>
                    <li class="user-fname-box">Sharma</li>
                    <li class="user-fname-box">bommanaadmin</li>
                    <li class="six-box">Admin</li>                    
                    <li class="seven-box">8977802373</li>
                    <li class="nine-box">pradipsharma1986@gmail.com</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box"><a href="#">Edit</a></li>
                    <li class="eleven-box last"><input type="checkbox"></li>                                  
                </ul>  
                <ul>
                    <li class="user-fname-box">Pradip Kumar</li>
                    <li class="user-fname-box">Sharma</li>
                    <li class="user-fname-box">bommanaadmin</li>
                    <li class="six-box">Admin</li>                    
                    <li class="seven-box">8977802373</li>
                    <li class="nine-box">pradipsharma1986@gmail.com</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box"><a href="#">Edit</a></li>
                    <li class="eleven-box last"><input type="checkbox"></li>                                  
                </ul>
                <ul>
                    <li class="user-fname-box">Pradip Kumar</li>
                    <li class="user-fname-box">Sharma</li>
                    <li class="user-fname-box">bommanaadmin</li>
                    <li class="six-box">Admin</li>                    
                    <li class="seven-box">8977802373</li>
                    <li class="nine-box">pradipsharma1986@gmail.com</li>
                    <li class="ten-box"><a href="#">Delete</a></li>
                    <li class="eleven-box"><a href="#">Edit</a></li>
                    <li class="eleven-box last"><input type="checkbox"></li>                                  
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
