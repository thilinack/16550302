<%@ Page Title="" Language="C#" MasterPageFile="~/Deployer_Master_1.master" AutoEventWireup="true" CodeFile="Deployer_My_Dep_1.aspx.cs" Inherits="Deployer_My_App" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container">
    <div class="row">
    <div class="box col-md-9">  
      <asp:Panel ID="Panel1" runat="server" Height="490px">
          <asp:SqlDataSource ID="DS_My_App" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" OnSelecting="DS_My_App_Selecting" SelectCommand="SELECT [Change_ID], [Summary] , [Creation_Date], [Priotity], Change.[Status], Change_Type.Type, Applications.Application,u1.User_Name Requested_By,u2.User_Name Authorized_By 
FROM [Change] 
INNER JOIN Applications ON Applications.Application_ID = Change.Application 
INNER JOIN Change_Type ON Change_Type.ChangeType_ID = Change.Req_Type
Left JOIN  Users u1 ON Change.Req_ID =  u1.User_ID 
Left JOIN  Users u2 ON Change.Auth_ID = u2.User_ID 
where  Change.Deploy_ID = @user_id;">
              <SelectParameters>
                  <asp:Parameter Name="user_id"></asp:Parameter>
              </SelectParameters>
          </asp:SqlDataSource>
    
             <div class="container">
    <div class="row">
      <div class="col-md-10 col-lg-10">
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="DS_My_App" CssClass="table table-bordered table-condensed table-responsive table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_OnRowCommand" DataKeyNames="Change_ID">
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
                     CommandArgument='<%# Eval("Change_ID") %>' > <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;View </asp:LinkButton>
                 
                      

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
<div style="height: 400px; overflow: Auto">
<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Change_ID" CssClass="SlidingBox">
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
                  Summary:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Summary") %>' runat="server" ID="SummaryTextBox" /><br />
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
                    Requested By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Requested_By") %>' runat="server" ID="Label1" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                    Authorized By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Authorized_By") %>' runat="server" ID="Label2" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                    Analyzed By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Analyzed_By") %>' runat="server" ID="Label3" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                    Developed By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Developed_By") %>' runat="server" ID="Label4" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                    QA By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("QA_By") %>' runat="server" ID="Label5" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                    UAT By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("UAT_By") %>' runat="server" ID="Label6" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                    Approved By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Approve_By") %>' runat="server" ID="Label7" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                    Deployed By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Deploy_By") %>' runat="server" ID="Label8" /><br />
                            </td>
                            </tr>
                 
                
                  </tbody>
                      </table>

              </ItemTemplate>
          </asp:FormView>
    </div>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Change_ID], [Summary] , [Creation_Date], [Priotity], Change.[Status], Change_Type.Type, Applications.Application,u1.User_Name Requested_By,u2.User_Name Authorized_By,u3.User_Name Analyzed_By,u4.User_Name Developed_By,u5.User_Name QA_By,u6.User_Name UAT_By,u7.User_Name Approve_By,u8.User_Name Deploy_By,[Description]
FROM [Change] 
INNER JOIN Applications ON Applications.Application_ID = Change.Application 
INNER JOIN Change_Type ON Change_Type.ChangeType_ID = Change.Req_Type
Left JOIN  Users u1 ON Change.Req_ID =  u1.User_ID 
Left JOIN  Users u2 ON Change.Auth_ID = u2.User_ID 
Left JOIN  Users u3 ON Change.BA_ID = u3.User_ID 
Left JOIN  Users u4 ON Change.Dev_ID =  u4.User_ID 
Left JOIN  Users u5 ON Change.QA_ID = u5.User_ID 
Left JOIN  Users u6 ON Change.UAT_ID = u6.User_ID 
Left JOIN  Users u7 ON Change.App_ID = u7.User_ID 
Left JOIN  Users u8 ON Change.Deploy_ID = u8.User_ID 
where Change.Change_ID = @Change_ID; ;"
                        OnSelecting="SqlDataSource1_Selecting">
                        <SelectParameters>
                            <asp:Parameter Name="Change_ID" />

              </SelectParameters>
          </asp:SqlDataSource>
                    </br>
                     <asp:DataList ID="fileuploads" runat="server" DataSourceID="fileselect">
                        <ItemTemplate>
                            
                           
                         
                            
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("File_URL") %>' target='_blank' ><%# Eval("File_Name") %></asp:HyperLink>

                            
                             
                            <br />
                        </ItemTemplate>
                    </asp:DataList>

                    <asp:SqlDataSource runat="server" ID="fileselect" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [File_URL], [File_Name] FROM [File_Upload] WHERE ([Change_ID] = @Change_ID)"  OnSelecting="File_Selecting">
                        <SelectParameters>
                            <asp:Parameter Name="Change_ID" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:FileUpload ID="FileUpload1" multiple ="True" runat="server" />

      <h5>Comments:</h5>
                     <div style="height: 100px; width: 400px;  overflow: Auto">
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
                        <footertemplate>
                            <asp:label visible="<%#bool.Parse((DataList1.Items.Count==0).ToString())%>" xmlns:asp="#unknown" runat="server" ID="lblNoRecord" Text="No Record Found"></asp:label>
                        </footertemplate>

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

                    <asp:Button ID="addcmnts" class="btn btn-primary" runat="server" CausesValidation="false" Text="Add Comment" onclick="BtnAddComnt_Click" />
                    
                  
                     </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    
                    
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
                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Yes" onclick="Dev_Click"/>
                    
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

