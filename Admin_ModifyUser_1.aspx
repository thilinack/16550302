<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_1.master" AutoEventWireup="true" CodeFile="Admin_ModifyUser_1.aspx.cs" Inherits="Admin_ModifyUser_1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

        

    
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="scriptmgr" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
        function ShowPopup() {
            document.getElementById("demo").innerHTML = "Paragraph changed.";
            $("#btnShowPopup").click();
            
        }
    </script>

    <script>
function myFunction() {
  document.getElementById("demo").innerHTML = "Paragraph changed.";
}
</script>

    

     <div class="row">
    <div class="box col-md-9">   
    <asp:Panel ID="Panel1" runat="server" Height="359px" Width="800px" CssClass="auto-style10">
        <asp:SqlDataSource ID="AllUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [User_ID] = @original_User_ID" InsertCommand="INSERT INTO [Users] ([User_Name], [User_ID], [User_Level], [Department_ID], [Designation], [Created_By], [Created_Date], [User_Status], [Last_Login], [Deactivate_Date], [Initial_Pwd], [User_Creation_Level]) VALUES (@User_Name, @User_ID, @User_Level, @Department_ID, @Designation, @Created_By, @Created_Date, @User_Status, @Last_Login, @Deactivate_Date, @Initial_Pwd, @User_Creation_Level)" OldValuesParameterFormatString="original_{0}" OnSelecting="AllUsers_Selecting" SelectCommand="SELECT t1.[User_Name], t1.[User_ID], ChngMgt_Access.Access_Level, Departments.Department, t1.[Designation], t2.User_Name Created_by, t1.[Created_Date], t1.[User_Status], t1.[Last_Login], t1.[Deactivate_Date], t1.[Initial_Pwd], UserMgt_Access.Access 
FROM [Users] t1 
INNER JOIN Departments ON Departments.Dep_ID = t1.Department_ID INNER JOIN ChngMgt_Access ON ChngMgt_Access.Access_ID = t1.User_Level INNER JOIN UserMgt_Access ON UserMgt_Access.Access_ID = t1.User_Creation_Level LEFT JOIN Users t2 ON t1.Created_By = t2.User_ID;  


"
            UpdateCommand="UPDATE [Users] SET [User_Name] = @User_Name, [User_Level] = @User_Level, [Department_ID] = @Department_ID, [Designation] = @Designation, [Created_By] = @Created_By, [Created_Date] = @Created_Date, [User_Status] = @User_Status, [Last_Login] = @Last_Login, [Deactivate_Date] = @Deactivate_Date, [Initial_Pwd] = @Initial_Pwd, [User_Creation_Level] = @User_Creation_Level WHERE [User_ID] = @original_User_ID">
            <DeleteParameters>
                <asp:Parameter Name="original_User_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_Name" Type="String" />
                <asp:Parameter Name="User_ID" Type="Int32" />
                <asp:Parameter Name="User_Level" Type="Int32" />
                <asp:Parameter Name="Department_ID" Type="Int32" />
                <asp:Parameter Name="Designation" Type="String"></asp:Parameter>
                <asp:Parameter Name="Created_By" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Created_Date" Type="String"></asp:Parameter>
                <asp:Parameter Name="User_Status" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="Last_Login" Type="String"></asp:Parameter>
                <asp:Parameter Name="Deactivate_Date" Type="String"></asp:Parameter>
                <asp:Parameter Name="Initial_Pwd" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="User_Creation_Level" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Name" Type="String" />
                <asp:Parameter Name="User_Level" Type="Int32" />
                <asp:Parameter Name="Department_ID" Type="Int32" />
                <asp:Parameter Name="Designation" Type="String" />
                <asp:Parameter Name="Created_By" Type="Int32" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="User_Status" Type="Boolean" />
                <asp:Parameter Name="Last_Login" Type="String" />
                <asp:Parameter Name="Deactivate_Date" Type="String" />
                <asp:Parameter Name="Initial_Pwd" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="User_Creation_Level" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_User_ID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">

            <asp:GridView ID="GridView1" runat="server" DataSourceID="AllUsers" CssClass="table table-bordered table-condensed table-responsive table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_OnRowCommand">
                <Columns>

                    <asp:CommandField ShowEditButton="True"></asp:CommandField>
                    <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name"></asp:BoundField>
                    <asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" />

                    <asp:BoundField DataField="Access_Level" HeaderText="Change_Access" SortExpression="Access_Level"></asp:BoundField>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department"></asp:BoundField>
                    <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation"></asp:BoundField>

                    <asp:BoundField DataField="Created_by" HeaderText="Created_by" SortExpression="Created_by" />
                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                    <asp:CheckBoxField DataField="User_Status" HeaderText="User_Status" SortExpression="User_Status"></asp:CheckBoxField>

                    <asp:BoundField DataField="Last_Login" HeaderText="Last_Login" SortExpression="Last_Login"></asp:BoundField>
                    <asp:BoundField DataField="Deactivate_Date" HeaderText="Deactivate_Date" SortExpression="Deactivate_Date"></asp:BoundField>
                    <asp:CheckBoxField DataField="Initial_Pwd" HeaderText="Initial_Pwd" SortExpression="Initial_Pwd"></asp:CheckBoxField>
                    <asp:BoundField DataField="Access" HeaderText="Creation_Access" SortExpression="Access"></asp:BoundField>
                </Columns>
        </asp:GridView>
   </div>
          </div>
        </div>
            </div>
        <!--
         <script>
             $('.table tbody').on('click','.btn',function(){
                 var currow = $(this).closest('tr');
                 var col1 = currow.find('td:eq(0)').text;
                 $("#link").text(col1);
                 $('#myModal').modal('toggle');
             })
         </script>
                -->

        <p id="demo">A Paragraph.</p>
        <button type="button" onclick="ShowPopup()">Try it</button>
        <asp:LinkButton ID="link" runat="server" Text=""></asp:LinkButton>
       <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
                data-toggle="modal" data-target="#myModal">
                Launch demo modal
            </button>    
      <!--
          <button type="button"  id="btnShowPopup" class="btn btn-primary btn-lg"
                data-toggle="modal" data-target="#myModal" >
                Launch demo modal
            </button>
        -->
    </asp:Panel>

       </div>
         </div>    
      <hr>
   
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="True">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Change Details</h3>
                </div>
                <div class="modal-body">
                    <p>Here settings can be configured...</p>

<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Change_ID">
              <EditItemTemplate>
                  <table class="table table-bordered table-striped">
                    <tbody >
                      
                        
                        <tr>
                            <td>
                             Priotity:
                                </td>
                            <td>
                            <asp:TextBox Text='<%# Bind("Priotity") %>' runat="server" ID="PriotityTextBox" /><br />
                            </td>
                            </tr>
                                           
                                    
                             </tbody>
                      </table>
                  
                  
                  
                  <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
              </EditItemTemplate>
              <InsertItemTemplate>
                  Description:
                  <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />
                  Creation_Date:
                  <asp:TextBox Text='<%# Bind("Creation_Date") %>' runat="server" ID="Creation_DateTextBox" /><br />
                  Priotity:
                  <asp:TextBox Text='<%# Bind("Priotity") %>' runat="server" ID="PriotityTextBox" /><br />
                  Status:
                  <asp:TextBox Text='<%# Bind("Status") %>' runat="server" ID="StatusTextBox" /><br />
                  Type:
                  <asp:TextBox Text='<%# Bind("Type") %>' runat="server" ID="TypeTextBox" /><br />
                  Application:
                  <asp:TextBox Text='<%# Bind("Application") %>' runat="server" ID="ApplicationTextBox" /><br />
                  Summary:
                  <asp:TextBox Text='<%# Bind("Summary") %>' runat="server" ID="SummaryTextBox" /><br />

                  <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
              </InsertItemTemplate>
              <ItemTemplate>

                  <table class="table table-bordered table-striped">
                    <tbody >
                        <tr>
                            <td>
                             Change ID:
                                </td>
                            <td>
                            <asp:Label Text='<%# Eval("Change_ID") %>' runat="server" ID="Change_IDLabel1" /><br />
                                </td>
                            </tr>
                         <tr>
                            <td>
                            Description:
                                </td>
                             <td>
                            <asp:Label Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />
                             </td>
                             </tr>
                        <tr>
                            <td>
                            Creation Date:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Creation_Date") %>' runat="server" ID="Creation_DateTextBox" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                             Priotity:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Priotity") %>' runat="server" ID="PriotityTextBox" /><br />
                            </td>
                            </tr>
                  
                         <tr>
                            <td>
                            Status:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Status") %>' runat="server" ID="StatusTextBox" /><br />
                            </td>
                            </tr>
                  
                            <tr>
                            <td>
                         Type:
                                </td>
                            <td>
                        <asp:Label Text='<%# Bind("Type") %>' runat="server" ID="TypeTextBox" /><br />
                            </td>
                            </tr>
                 
                  <tr>
                            <td>
                    Application:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Application") %>' runat="server" ID="ApplicationTextBox" /><br />
                            </td>
                            </tr>
                 
                  <tr>
                            <td>
                  Summary:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Summary") %>' runat="server" ID="SummaryTextBox" /><br />
                            </td>
                            </tr>
                  </tbody>
                      </table>

              </ItemTemplate>
          </asp:FormView>
          <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Change_ID], [Description], [Creation_Date], [Priotity], [Status], Change_Type.Type, Applications.Application, [Summary] FROM [Change] INNER JOIN Applications ON Applications.Application_ID = Change.Application INNER JOIN Change_Type ON Change_Type.ChangeType_ID = Change.Req_Type where Change.Change_ID = 2 ;" OnSelecting="SqlDataSource1_Selecting">
              <SelectParameters>
                  <asp:Parameter Name="Change_ID" />

              </SelectParameters>
          </asp:SqlDataSource>
      </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
                </div>
            </div>
        </div>
       
    </div>
       
    
    
</asp:Content>

