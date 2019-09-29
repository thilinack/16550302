<%@ Page Title="" Language="C#" MasterPageFile="~/Deployer_Master_1.master" AutoEventWireup="true" CodeFile="Deployer_Dash_1.aspx.cs" Inherits="Deployer_Dash_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">

        <div class="box col-lg-12 col-md-12 col-sm-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> <asp:Label ID="Label2" runat="server" Text="Overall Statistics"></asp:Label></h2>

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
         <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-list-alt"></i> Change Management</h2>

              
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
        url: "Deployer_Dash_1.aspx/GetChartData",
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

        
        
            
                    </div>
                </div>

        </div>
                           
            </div>

         
        </div>

</asp:Content>

