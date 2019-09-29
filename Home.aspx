<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Melstacorp</title>
    <style type="text/css">
        .auto-style3 {
            height: 89px;
            width: 35px;
        }
        .auto-style5 {
            height: 89px;
            width: 386px;
        }
        .auto-style7 {
            height: 89px;
            width: 371px;
        }
        .auto-style1 {
            height: 89px;
        }
        .auto-style4 {
            height: 264px;
            width: 35px;
        }
        .auto-style6 {
            height: 264px;
            width: 386px;
        }
        .auto-style8 {
            height: 264px;
            width: 371px;
        }
        .auto-style2 {
            height: 264px;
        }
    </style>


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
    <form id="form1" runat="server">
    <div>
    
     <table style="height: 100px; width: 920px">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5"></td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style6">
                    <asp:ImageButton ID="ImageButton1" runat="server" BorderStyle="Solid" Height="255px" ImageUrl="~/Melstacorp/Images/Change-Management-as-a-Service.png"  Width="413px" OnClick="ImageButton1_Click1" />
                </td>
                <td class="auto-style8">
                    <asp:ImageButton ID="ImageButton2" runat="server" BorderStyle="Solid" Height="257px" ImageUrl="~/Melstacorp/Images/user-management.png" Width="395px" OnClick="ImageButton2_Click" />
                </td>
                <td class="auto-style2"></td>
            </tr>
           
        </table>
    
    </div>



            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Warning</h3>
                </div>
                <div class="modal-body">
                    <p>You don't have privileges to access this module. Please contact system admin  </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    
                    
                </div>
            </div>
        </div>
    </div>



    </form>
</body>
</html>
