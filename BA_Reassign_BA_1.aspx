<%@ Page Title="" Language="C#" MasterPageFile="~/BA_Master_1.master" AutoEventWireup="true" CodeFile="BA_Reassign_BA_1.aspx.cs" Inherits="BA_Reassign_BA" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="box col-md-9">
                <asp:Panel ID="Panel1" runat="server" Height="490px">
                    <asp:SqlDataSource ID="DS_Req_To_BA" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" OnSelecting="DS_Req_To_BA_Selecting" SelectCommand="SELECT [Change_ID], [Summary] , [Creation_Date], [Priotity], Change.[Status], Change_Type.Type, Applications.Application,u1.User_Name Requested_By,u2.User_Name Authorized_By 
FROM [Change] 
INNER JOIN Applications ON Applications.Application_ID = Change.Application 
INNER JOIN Change_Type ON Change_Type.ChangeType_ID = Change.Req_Type
Left JOIN  Users u1 ON Change.Req_ID =  u1.User_ID 
Left JOIN  Users u2 ON Change.Auth_ID = u2.User_ID 
where  Change.BA_ID IS NULL and Change.Auth_ID IS NOT NULL and Change.Status='Authorized' and Change.Reassign=1;"></asp:SqlDataSource>

                    <div class="container">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" DataSourceID="DS_Req_To_BA" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" CssClass="table table-bordered table-condensed table-responsive table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_OnRowCommand" DataKeyNames="Change_ID">
                                        <Columns>
                                            <asp:BoundField DataField="Change_ID" HeaderText="Change_ID" ReadOnly="True" InsertVisible="False" SortExpression="Change_ID"></asp:BoundField>
                                            <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary"></asp:BoundField>
                                            <asp:BoundField DataField="Creation_Date" HeaderText="Creation  Date" SortExpression="Creation_Date"></asp:BoundField>
                                            <asp:BoundField DataField="Priotity" HeaderText="Priotity" SortExpression="Priotity"></asp:BoundField>
                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"></asp:BoundField>
                                            <asp:BoundField DataField="Application" HeaderText="Application" SortExpression="Application"></asp:BoundField>
                                            <asp:BoundField DataField="Requested_By" HeaderText="Requested By" SortExpression="Requested_By"></asp:BoundField>
                                            <asp:BoundField DataField="Authorized_By" HeaderText="Authorized By" SortExpression="Authorized_By"></asp:BoundField>

                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnShowPopup" runat="server" class="btn btn-primary btn-sm"
                                                        CausesValidation="false" CommandName="View"
                                                        CommandArgument='<%# Eval("Change_ID") %>'> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;View </asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-round btn-default btn-sm btn-danger"
                                                        CausesValidation="false" CommandName="Reject"
                                                        CommandArgument='<%# Eval("Change_ID") %>'> <i class="glyphicon glyphicon-remove icon-white"></i> </asp:LinkButton>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

    <!-- Model Starts here -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="True">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Change Details</h3>
                </div>
                <div class="modal-body">
                    <p></p>

                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Change_ID">
                        <EditItemTemplate>
                            <table class="table table-bordered table-striped">
                                <tbody>


                                    <tr>
                                        <td>Priotity:
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
                                <tbody>
                                    <tr>
                                        <td>Change ID:
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Change_ID") %>' runat="server" ID="Change_IDLabel1" /><br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Summary:
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Summary") %>' runat="server" ID="SummaryTextBox" /><br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Description:
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Creation Date:
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Creation_Date") %>' runat="server" ID="Creation_DateTextBox" /><br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Priotity:
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Priotity") %>' runat="server" ID="PriotityTextBox" /><br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Status:
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Status") %>' runat="server" ID="StatusTextBox" /><br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Type:
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Type") %>' runat="server" ID="TypeTextBox" /><br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Application:
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Application") %>' runat="server" ID="ApplicationTextBox" /><br />
                                        </td>
                                    </tr>


                                </tbody>
                            </table>

                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Change_ID], [Description], [Creation_Date], [Priotity], Change.[Status], Change_Type.Type, Applications.Application, [Summary] FROM [Change] INNER JOIN Applications ON Applications.Application_ID = Change.Application INNER JOIN Change_Type ON Change_Type.ChangeType_ID = Change.Req_Type where Change.Change_ID = @Change_ID ;" OnSelecting="SqlDataSource1_Selecting">
                        <SelectParameters>
                            <asp:Parameter Name="Change_ID" />

                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:DataList ID="fileuploads" runat="server" DataSourceID="fileselect">
                        <ItemTemplate>




                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("File_URL") %>' Target='_blank'><%# Eval("File_Name") %></asp:HyperLink>



                            <br />
                        </ItemTemplate>
                    </asp:DataList>

                    <asp:SqlDataSource runat="server" ID="fileselect" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [File_URL], [File_Name] FROM [File_Upload] WHERE ([Change_ID] = @Change_ID)" OnSelecting="File_Selecting">
                        <SelectParameters>
                            <asp:Parameter Name="Change_ID" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:FileUpload ID="FileUpload1" multiple="True" runat="server" />

                    <h5>Comments:</h5>
                    <div style="height: 100px; width: 400px; overflow: Auto">
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource_Comments" CssClass="SlidingBox" class="form-control" DataKeyField="Comment_ID">
                            <ItemTemplate>
                                Comment ID:
                            <asp:Label Text='<%# Eval("Comment_ID") %>' runat="server" ID="Comment_IDLabel" /><br />
                                Commented By:
                            <asp:Label Text='<%# Eval("User_Name") %>' runat="server" ID="User_NameLabel" /><br />
                                Date:
                            <asp:Label Text='<%# Eval("Date") %>' runat="server" ID="DateLabel" /><br />
                                Comment:
                            <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /><br />
                                <br />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:label visible="<%#bool.Parse((DataList1.Items.Count==0).ToString())%>" xmlns:asp="#unknown" runat="server" id="lblNoRecord" text="No Record Found"></asp:label>
                            </FooterTemplate>

                        </asp:DataList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource_Comments" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="Select Change_Comment.Comment_ID, Users.User_Name, Change_Comment.Date,Change_Comment.Comment from Change_Comment inner join Users on Users.User_ID = Change_Comment.UserID where Change_Comment.Change_ID =@change_ID Order by Change_Comment.Comment_ID " OnSelecting="SqlDataSource_Comments_Selecting">
                        <SelectParameters>
                            <asp:Parameter Name="change_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>



                    <h5>Add Comment:</h5>
                    <asp:TextBox ID="Commenttxt" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:CheckBox ID="CheckBoxPrivate" runat="server" Text="Authorized Users Only" /></br>
                    <asp:Button ID="addcmnts" class="btn btn-primary" runat="server" CausesValidation="false" Text="Add Comment" OnClick="BtnAddComnt_Click" />

                    <h5>Assign to:</h5>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource_Developer" DataTextField="User_Name" DataValueField="User_ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource_Developer" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [User_ID], [User_Name] FROM [Users] WHERE User_Level ='5'"></asp:SqlDataSource>

                    <h5>Schedule Date:</h5>

                    <asp:TextBox ID="TxtBoxSchdule" runat="server" ReadOnly="True"></asp:TextBox>

                    <ajaxToolkit:CalendarExtender runat="server" BehaviorID="TxtBoxSchdule_CalendarExtender" TargetControlID="TxtBoxSchdule" ID="TxtBoxSchdule_CalendarExtender"></ajaxToolkit:CalendarExtender>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button4" runat="server" class="btn btn-danger" Text="Reject" data-toggle="modal" OnClientClick="return false;" data-target="#myModal3" />
                    <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Confirm" data-toggle="modal" OnClientClick="return false;" data-target="#myModal2" />
                    
                    
                </div>
            </div>
        </div>
       
    </div>

    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Warning</h3>
                </div>
                <div class="modal-body">
                    <p>Do you want to confirm the business analysis of this Request? </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Yes" onclick="BA_Click"/>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Warning</h3>
                </div>
                <div class="modal-body">
                    <p>Do you want to Reject this Request? </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Yes" onclick="Reject_Click"/>
                    
                </div>
            </div>
        </div>
    </div>



</asp:Content>

