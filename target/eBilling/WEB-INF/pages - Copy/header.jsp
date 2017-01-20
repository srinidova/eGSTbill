<!DOCTYPE html>
<html dir="ltr" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>eBilling</title>

        <!-- SET: FAVICON -->
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
        <!-- END: FAVICON -->

        <!-- SET: STYLESHEET -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all">
        <!-- END: STYLESHEET -->

        <!-- SET: SCRIPTS -->
        <script src="js/main.js"></script>
        <script type="text/javascript">
            function validationequiry(){ 
                var emailFormat = /^\w(\.?[\w-])*@\w(\.?[\w-])*\.[a-zA-Z]{2,6}(\.[a-zA-Z]{2})?$/i;
                var email = document.cf_form.email.value;
			
                if(document.cf_form.addclient.value=="")
                {
                    alert("Please Enter addclient");
                    document.cf_form.addclient.focus();
                    return false;
                }		
		
                if(document.cf_form.cname.value=="")
                {
                    alert("Please Enter Company Name");
                    document.cf_form.cname.focus();
                    return false;
                }
		
                if(document.cf_form.city.value=="")
                {
                    alert("Please Enter City");
                    document.cf_form.city.focus();
                    return false;
                }
		
                if(document.cf_form.state.value=="")
                {
                    alert("Please Enter State");
                    document.cf_form.state.focus();
                    return false;
                }
		
                if(document.cf_form.pin.value=="")
                {
                    alert("Please Enter Pin");
                    document.cf_form.pin.focus();
                    return false;
                }
		
                if(document.cf_form.phone.value=="")
                {
                    alert("Please Enter Phone");
                    document.cf_form.phone.focus();
                    return false;
                }
		
                if(document.cf_form.cperson.value=="")
                {
                    alert("Please Enter Contact Person");
                    document.cf_form.cperson.focus();
                    return false;
                }
		
                if(document.cf_form.cnumber.value=="")
                {
                    alert("Please Enter Contact Number");
                    document.cf_form.cnumber.focus();
                    return false;
                }
				
                if(document.cf_form.email.value=="")
                {
                    alert("Please Enter Email ID");
                    document.cf_form.email.focus();
                    return false;
                }
                if(email!="")
                {
                    var eres=email.search(emailFormat);
                    if(eres == -1)
                    {
                        alert("Please Enter Valid Email Id ");
                        document.cf_form.email.focus();
                        return false;
                    }
                }	
		
                if(document.cf_form.theme.value=="")
                {
                    alert("Please Enter Theme");
                    document.cf_form.theme.focus();
                    return false;
                }
		
                if(document.cf_form.address1.value=="")
                {
                    alert("Please Enter address1");
                    document.cf_form.address1.focus();
                    return false;
                }		
                if(document.cf_form.lmark.value=="")
                {
                    alert("Please Enter Land Mark");
                    document.cf_form.lmark.focus();
                    return false;
                }
				
                		
                return true;
            }
        </script>
        <!-- END: SCRIPTS -->

        <!--[if lt IE 9]>
	<script src="js/html5.js"></script>
        <![endif]-->
    </head>

    <body>

        <!-- SET: WRAPPER -->
        <div class="wrapper"> 

            <!-- SET: CONTAINER -->
            <div class="container"> 

                <!-- SET: HEADER -->
                <header id="header">
                    <%@ include file="branding.jsp" %>
                    <%@ include file="menu.jsp" %>
                </header>
                <!-- END: HEADER --> 
                <div id="page-title">
                    <ul><li><h3>Home/Department</h3></li><li><marquee behavior="scroll" direction="left">Welcome to mySalesInfo...</marquee>
                    </li></ul></div></div></div></body></html>