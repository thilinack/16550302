<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login_1.aspx.cs" Inherits="Login_1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
    <title>Melstacorp</title>
    </head>
    

    <head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <meta name="author" content="Thilina Kelaniyage">

    <!-- The styles -->
    <link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">
    
    <link href="css/charisma-app.css" rel="stylesheet">
    <link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <link href='css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="bower_components/jquery/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/Melsta_1.png">

</head>

<body>

    <form id="form1" runat="server" class="form-horizontal"  method="post">
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Melstacorp/Images/bbbaab (1).png" Height="56px" Width="267px" />
        </div>
        <!--/span-->
    </div><!--/row-->
        
    <div class="row">
        <div class="well col-md-5 center login-box">
            <div id ="loginalert" runat ="server" class="alert alert-info">
    <asp:Label ID="LoginStatus" runat="server" Text="Please login with your Username and Password."></asp:Label>
                
            </div>
            



                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <asp:TextBox ID="TxtUserName" runat="server" type="text" class="form-control" placeholder="User Name" OnTextChanged="TxtUserName_TextChanged"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        
                        <asp:TextBox runat="server" ID="TxtPWD" type="password" class="form-control" placeholder="Password"/>
                       
                    </div>
                    <div class="clearfix"></div>

                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" id="remember"> Remember me</label>
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">
                       
                        <asp:Button ID="BtnLogin" runat="server" class="btn btn-primary" OnClick="BtnLogin_Click" Text="Login" />
                    </p>
                </fieldset>
            
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->



    <div class="modal fade" id="change_pass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
        
               
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3>Change Password</h3>
                    </div>
                    <div class="modal-body">
                        <div class="box-content">
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>Old Password
                        </td>
                                    <td>
                        <asp:TextBox runat="server" ID="TextBox1" type="password" class="form-control" placeholder="Old Password"/>

                                        
                                    </td>
                                </tr>


                                <tr>
                                    <td>New Password
                        </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="NewPWD" type="password" class="form-control" placeholder="New Password"/>

                                        
                                    </td>
                    </tr>
                                <tr>
                                    <td>Re-Type New Password
                        </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="NewPWD2" type="password" class="form-control" placeholder="New Password"/>


                                     
                                    </td>
                    </tr>

                    </table>
                            <div id ="Div1" runat ="server" class="alert alert-info">
                            <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
                                </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Save Password " onclick="ChangePWD_Click"/>
                    
                </div>
            </div>
        </div>
         
    </div>


</form>


<!-- external javascript -->

<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='bower_components/moment/min/moment.min.js'></script>
<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>


</body>
</html>

