<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_1.master" AutoEventWireup="true" CodeFile="Admin_Dash_1.aspx.cs" Inherits="Admin_Dash_1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">

        <div class="box col-lg-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> <asp:Label ID="Label2" runat="server" Text="Change Management Overall Statistics"></asp:Label></h2>

                <div class="box-icon">
                    
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div>
            </div>

            <div class="box-content row">
                <div class="col-lg-12 col-md-12">


        <!--- Donut -->
         <div class="box col-md-6">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-list-alt"></i> Progress Chart</h2>

              
            </div>
            <div class="box-content">
                <!-- chart goes here -->
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
google.load("visualization", "1", { packages: ["corechart"] });
google.setOnLoadCallback(drawChart);
function drawChart() {
    var options = {
        title: 'Distribution'
       
    };

    $.ajax({
        type: "POST",
        url: "Admin_Dash_1.aspx/GetChartData",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            var data = google.visualization.arrayToDataTable(r.d);
            var chart = new google.visualization.PieChart($("#chart")[0]);
            chart.draw(data, options);
        },
        failure: function (r) {
            alert(r.d);
        },
        error: function (r) {
            alert(r.d);
        }
    });
}
</script>
                
  <div class="box-content">          
<div id="chart">
    </div>
</div>
               
                    


            </div>
        </div>
    </div>

         <div class="box col-md-6">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-list"></i> Data</h2>

                
            </div>
            <div class="box-content">
           <ul class="dashboard-list">
                    <li>
                        <a href="#">
                            
                            <span class="green">
                                <asp:Label ID="Dash_New_Req" runat="server" Text="Label"></asp:Label></span>
                            New Requests
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="red">
                                <asp:Label ID="Dash_Auth_Req" runat="server" Text="Label"></asp:Label></span>
                            Authorized Requests
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="blue">
                                <asp:Label ID="Dash_BA_Req" runat="server" Text="Label"></asp:Label></span>
                            BA Qualified Requests
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="yellow">
                                <asp:Label ID="Dash_Dev_Req" runat="server" Text="Label"></asp:Label></span>
                            Developed Requests 
                        </a>
                    </li>
                    <li>
                        <a href="#">
                           
                            <span class="green">
                                <asp:Label ID="Dash_QA_Req" runat="server" Text="Label"></asp:Label></span>
                            QA Verified
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="red">
                                <asp:Label ID="Dash_UAT_Req" runat="server" Text="Label"></asp:Label></span>
                            UAT Confirmed
                        </a>
                    </li>
                    <li>
                        <a href="#">
                           
                            <span class="blue">
                                <asp:Label ID="Dash_App_Req" runat="server" Text="Label"></asp:Label></span>
                            Approved For Migration
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="yellow">
                                <asp:Label ID="Dash_Complete_Req" runat="server" Text="Label"></asp:Label></span>
                            Completed
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="red">
                                <asp:Label ID="Dash_Reject_Req" runat="server" Text="Label"></asp:Label></span>
                            Rejected
                        </a>
                    </li>

                </ul>     
            </div>
        </div>
    </div>

        </div>
                            </div>



            </div>
            </div>
        </div>

    <!-- User Management dash-->
    <div class="row">

        <div class="box col-lg-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> <asp:Label ID="Label1" runat="server" Text="User Management Overall Statistics"></asp:Label></h2>

                <div class="box-icon">
                    
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div>
            </div>

            <div class="box-content row">
                <div class="col-lg-12 col-md-12">


        <!--- Donut -->
         <div class="box col-md-6">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-list-alt"></i> Progress Chart</h2>

              
            </div>
            <div class="box-content">
              <!-- Chart goess here -->
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
google.load("visualization", "1", { packages: ["corechart"] });
google.setOnLoadCallback(drawChart2);
function drawChart2() {
    var options = {
        title: 'Distribution'
       
    };

    $.ajax({
        type: "POST",
        url: "Admin_Dash_1.aspx/GetChartData2",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            var data = google.visualization.arrayToDataTable(r.d);
            var chart = new google.visualization.PieChart($("#chart2")[0]);
            chart.draw(data, options);
        },
        failure: function (r) {
            alert(r.d);
        },
        error: function (r) {
            alert(r.d);
        }
    });
}
</script>
                
  <div class="box-content">          
<div id="chart2">
    </div>
</div>
               
                    


           

            </div>
        </div>
    </div>

         <div class="box col-md-6">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-list"></i> Data</h2>

                
            </div>
            <div class="box-content">
              <ul class="dashboard-list">
                    <li>
                        <a href="#">
                            
                            <span class="green">
                                <asp:Label ID="User_New_Req" runat="server" Text="Label"></asp:Label></span>
                            New Requests
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="red">
                                <asp:Label ID="User_Auth_Req" runat="server" Text="Label"></asp:Label></span>
                            Authorized Requests
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="blue">
                                <asp:Label ID="User_Complete_Req" runat="server" Text="Label"></asp:Label></span>
                            Completed Requests
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            
                            <span class="yellow">
                                <asp:Label ID="User_Reject_Req" runat="server" Text="Label"></asp:Label></span>
                            Rejected Requests 
                        </a>
                    </li>
                
                </ul>  
            </div>
        </div>
    </div>

        </div>
                            </div>



            </div>
            </div>
        </div>


    <!-- Other Operations Dash-->
    <div class="row">

        <div class="box col-lg-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> <asp:Label ID="Label3" runat="server" Text="Other Operations"></asp:Label></h2>

                <div class="box-icon">
                    
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div>
            </div>

            <div class="box-content row">
                <div class="col-lg-12 col-md-12">


      
         <div class="box col-md-4">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-list-alt"></i> Applications</h2>

              
            </div>
            <div class="box-content">
             
                
  <div class="box-content">          
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Application], [Added_Date], [Application_ID], [Status] FROM [Applications]"></asp:SqlDataSource>
       <div class="container">
    <div class="row">
            <div class="col-md-3 col-sm-3">
      <div class="table-responsive">
      <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed table-responsive table-striped" AutoGenerateColumns="False" DataKeyNames="Application_ID" OnRowCommand="GridView1_OnRowCommand" DataSourceID="SqlDataSource1">
          <Columns>
              <asp:BoundField DataField="Application" HeaderText="Application" SortExpression="Application"></asp:BoundField>
             
              <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
          <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
               
                 <asp:LinkButton ID="Remove" runat="server" class="btn btn-danger btn-sm"
                 CausesValidation="false" CommandName="Remove"
                     CommandArgument='<%# Eval("Application_ID") %>' > <i class="glyphicon glyphicon-minus icon-white"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-success btn-sm"
                 CausesValidation="false" CommandName="Active"
                     CommandArgument='<%# Eval("Application_ID") %>' > <i class="glyphicon glyphicon-plus icon-white"></i></asp:LinkButton>
                      

            </ItemTemplate>
        </asp:TemplateField>
              
               </Columns>
      </asp:GridView>
     </div>
           </div>
        </div>
           </div>
            </br>
           
       <a href="#myModal3" data-toggle="modal" data-target="#myModal3">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span class="green">
                               Add Application</span>
                            
                        </a>
</div>
               
                    


           

            </div>
        </div>
    </div>

         <div class="box col-md-4">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-list"></i> Departments</h2>

                
            </div>
            <div class="box-content">
                
                 <div class="box-content">          
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Department], [Location], [Status], [Dep_ID] FROM [Departments]"></asp:SqlDataSource>
       <div class="container">
    <div class="row">
            <div class="col-md-3 col-sm-3">
      <div class="table-responsive">
      <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-condensed table-responsive table-striped" AutoGenerateColumns="False" DataKeyNames="Dep_ID" OnRowCommand="GridView2_OnRowCommand" DataSourceID="SqlDataSource2">
          <Columns>
              <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department"></asp:BoundField>
             <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location"></asp:BoundField>
              <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
          <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
               
                 <asp:LinkButton ID="Remove" runat="server" class="btn btn-danger btn-sm"
                 CausesValidation="false" CommandName="Remove"
                     CommandArgument='<%# Eval("Dep_ID") %>' > <i class="glyphicon glyphicon-minus icon-white"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-success btn-sm"
                 CausesValidation="false" CommandName="Active"
                     CommandArgument='<%# Eval("Dep_ID") %>' > <i class="glyphicon glyphicon-plus icon-white"></i></asp:LinkButton>
                      

            </ItemTemplate>
        </asp:TemplateField>
              
               </Columns>
      </asp:GridView>
     </div>
           </div>
        </div>
           </div>
            </br>
           
       <a href="#myModal4" data-toggle="modal" data-target="#myModal4">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span class="green">
                               Add Department</span>
                            
                        </a>
</div>

            </div>
        </div>
    </div>

        <div class="box col-md-4">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-list"></i> Change Request Types</h2>

                
            </div>
            <div class="box-content">
                
                 <div class="box-content">          
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Type], [Type_Status], [ChangeType_ID] FROM [Change_Type]"></asp:SqlDataSource>
       <div class="container">
    <div class="row">
            <div class="col-md-3 col-sm-3">
      <div class="table-responsive">
      <asp:GridView ID="GridView3" runat="server" CssClass="table table-bordered table-condensed table-responsive table-striped" AutoGenerateColumns="False" DataKeyNames="ChangeType_ID" OnRowCommand="GridView3_OnRowCommand" DataSourceID="SqlDataSource3">
          <Columns>
              <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"></asp:BoundField>
             <asp:BoundField DataField="Type_Status" HeaderText="Status" SortExpression="Type_Status"></asp:BoundField>
              
          <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
               
                 <asp:LinkButton ID="Remove" runat="server" class="btn btn-danger btn-sm"
                 CausesValidation="false" CommandName="Remove"
                     CommandArgument='<%# Eval("ChangeType_ID") %>' > <i class="glyphicon glyphicon-minus icon-white"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-success btn-sm"
                 CausesValidation="false" CommandName="Active"
                     CommandArgument='<%# Eval("ChangeType_ID") %>' > <i class="glyphicon glyphicon-plus icon-white"></i></asp:LinkButton>
                      

            </ItemTemplate>
        </asp:TemplateField>
              
               </Columns>
      </asp:GridView>
     </div>
           </div>
        </div>
           </div>
            </br>
           
       <a href="#myModal4" data-toggle="modal" data-target="#myModal5">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span class="green">
                               Add Type</span>
                            
                        </a>
</div>

            </div>
        </div>
    </div>

        </div>
                            </div>



            </div>
            </div>
        </div>

    <!-- chart libraries start -->
<script src="bower_components/flot/excanvas.min.js"></script>
<script src="bower_components/flot/jquery.flot.js"></script>
<script src="bower_components/flot/jquery.flot.pie.js"></script>
<script src="bower_components/flot/jquery.flot.stack.js"></script>
<script src="bower_components/flot/jquery.flot.resize.js"></script>
<!-- chart libraries end -->
<script src="js/init-chart.js"></script>


    <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Add Application</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <td>Application</td>
                            <td>
                                <asp:TextBox ID="Txt_App" runat="server" class="form-control" placeholder="Application"></asp:TextBox></td>
                        </tr>
                        </table>
                    
                </div>
                <div class="modal-footer"> 
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Add" onclick="Add_Application"/>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Add Department</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <td>Department</td>
                            <td>
                                <asp:TextBox ID="TxtDep" runat="server" class="form-control" placeholder="Department"></asp:TextBox></td>
                        </tr>
                         <tr>
                            <td>Location</td>
                            <td>
                                <asp:TextBox ID="TxtLoc" runat="server" class="form-control" placeholder="Location"></asp:TextBox></td>
                        </tr>
                        </table>
                    
                </div>
                <div class="modal-footer"> 
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Add" onclick="Add_Department"/>
                    
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Add Department</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <td>Change Type</td>
                            <td>
                                <asp:TextBox ID="TxtType" runat="server" class="form-control" placeholder="Change Type"></asp:TextBox></td>
                        </tr>
                         
                        </table>
                    
                </div>
                <div class="modal-footer"> 
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Add" onclick="Add_ChangeType"/>
                    
                </div>
            </div>
        </div>
    </div>

</asp:Content>

