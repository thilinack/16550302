﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Creater_Master_2.master" AutoEventWireup="true" CodeFile="Creater_Pending_Create_2.aspx.cs" Inherits="Creater_Pending_Create_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <div class="row">
    <div class="box col-md-10">   
   
        <asp:SqlDataSource ID="Pending_Create" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" OnSelecting="Pending_Create_Selecting" SelectCommand="SELECT [UserReq_ID], [Req_Date],User_Request.Req_Type,User_Request.Emp_No,CONCAT(User_Request.F_Name,' ',User_Request.L_Name) as Name,Departments.Department,User_Request.Designation,User_Request.Access_level ,Applications.Application, User_Request.[Status], [Priority],u2.User_Name as Approved_By,u1.User_Name as Request_By,User_Request.Approved_Date
FROM [User_Request] 
INNER JOIN Applications ON Applications.Application_ID = User_Request.Application_ID 
Inner JOIN Departments on Departments.Dep_ID=User_Request.Department
LEFT JOIN Users u1 ON u1.User_ID = User_Request.Req_By
LEFT JOIN Users u2 ON u2.User_ID = User_Request.Approved_By
LEFT JOIN Users u3 ON u3.User_ID = User_Request.Created_By
where User_Request.Approved_By IS NOT NULL and User_Request.Status ='Authorized';">
        </asp:SqlDataSource>
        <br />
        
        <div class="container">
    <div class="row">
      <div class="col-md-10">
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="Pending_Create" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" CssClass="table table-bordered table-condensed table-responsive table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_OnRowCommand" DataKeyNames="UserReq_ID">
                <Columns>
                    <asp:BoundField DataField="UserReq_ID" HeaderText="UserReq_ID" ReadOnly="True" InsertVisible="False" SortExpression="UserReq_ID"></asp:BoundField>

                    <asp:BoundField DataField="Req_Date" HeaderText="Req_Date" SortExpression="Req_Date"></asp:BoundField>
                    <asp:BoundField DataField="Req_Type" HeaderText="Req_Type" SortExpression="Req_Type"></asp:BoundField>
                   
                    <asp:BoundField DataField="Request_By" HeaderText="Request By" ReadOnly="True" SortExpression="Name"></asp:BoundField>
                    
                    <asp:BoundField DataField="Name" HeaderText="Request For" SortExpression="Name" ReadOnly="True"></asp:BoundField>
                    
                    <asp:BoundField DataField="Application" HeaderText="Application" SortExpression="Application"></asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                <asp:LinkButton ID="btnShowPopup" runat="server" class="btn btn-primary btn-sm"
                 CausesValidation="false" CommandName="View"
                     CommandArgument='<%# Eval("UserReq_ID") %>' > <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;View </asp:LinkButton>
                 <asp:LinkButton ID="ApproveButton" runat="server" class="btn btn-round btn-default btn-sm btn-success"
                 CausesValidation="false" CommandName="Approve"
                     CommandArgument='<%# Eval("UserReq_ID") %>' > <i class="glyphicon glyphicon-ok icon-white"></i> </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-round btn-default btn-sm btn-danger"
                 CausesValidation="false" CommandName="Reject"
                     CommandArgument='<%# Eval("UserReq_ID") %>' > <i class="glyphicon glyphicon-remove icon-white"></i> </asp:LinkButton>   

            </ItemTemplate>
        </asp:TemplateField>

                </Columns>
            </asp:GridView>
   </div>
          </div>
        </div>
            </div>
        
        
    

       </div>
         </div>   
        
      <hr>

    

   
     
    <asp:ScriptManager ID="scriptmgr" runat="server"></asp:ScriptManager>
    
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

<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="UserReq_ID">
              
           
              <ItemTemplate>

                  <table class="table table-bordered table-striped">
                    <tbody >
                        <tr>
                            <td>
                             Request ID:
                                </td>
                            <td>
                            <asp:Label Text='<%# Eval("UserReq_ID") %>' runat="server" ID="Change_IDLabel1" /><br />
                                </td>
                            </tr>

                          <tr>
                            <td>
                  Request By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Request_By") %>' runat="server" ID="SummaryTextBox" /><br />
                            </td>
                            </tr>

                         <tr>
                            <td>
                            Request Date:
                                </td>
                             <td>
                            <asp:Label Text='<%# Bind("Req_Date") %>' runat="server" ID="DescriptionTextBox" /><br />
                             </td>
                             </tr>

                        
   <tr>
                            <td>
                            Approved By:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Approved_By") %>' runat="server" ID="Label6" /><br />
                            </td>
                            </tr>
                        <tr>
                            <td>
                            Approved Date:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Approved_Date") %>' runat="server" ID="Creation_DateTextBox" /><br />
                            </td>
                            </tr>

                              </tr>
                        <tr>
                            <td>
                            Request For:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Name") %>' runat="server" ID="Label1" /><br />
                            </td>
                            </tr>

                              </tr>
                        <tr>
                            <td>
                            Emp_No:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Emp_No") %>' runat="server" ID="Label2" /><br />
                            </td>
                            </tr>

                              </tr>
                        <tr>
                            <td>
                            Request Type:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Req_Type") %>' runat="server" ID="Label3" /><br />
                            </td>
                            </tr>

                              </tr>
                        <tr>
                            <td>
                            Priority:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Priority") %>' runat="server" ID="Label4" /><br />
                            </td>
                            </tr>

                         <tr>
                            <td>
                            Status:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Status") %>' runat="server" ID="Label5" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                             Created By:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Created_By") %>' runat="server" ID="PriotityTextBox" /><br />
                            </td>
                            </tr>
                  
                         <tr>
                            <td>
                            Created Date:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Created_Date") %>' runat="server" ID="StatusTextBox" /><br />
                            </td>
                            </tr>
                  
                            <tr>
                            <td>
                         Application:
                                </td>
                            <td>
                        <asp:Label Text='<%# Bind("Application") %>' runat="server" ID="TypeTextBox" /><br />
                            </td>
                            </tr>
                 
                  <tr>
                            <td>
                    Access Level:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Access_level") %>' runat="server" ID="ApplicationTextBox" /><br />
                            </td>
                            </tr>
                 
                
                  </tbody>
                      </table>

              </ItemTemplate>
          </asp:FormView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [UserReq_ID],[Req_Date],User_Request.Req_Type,User_Request.Created_Date,User_Request.Emp_No,CONCAT(User_Request.F_Name,' ',User_Request.L_Name) as Name,Departments.Department,User_Request.Designation,User_Request.Access_level ,Applications.Application, User_Request.[Status], [Priority],u2.User_Name as Approved_By,u1.User_Name as Request_By,User_Request.Approved_Date,u3.User_Name as Created_By
FROM [User_Request] 
INNER JOIN Applications ON Applications.Application_ID = User_Request.Application_ID 
Inner JOIN Departments on Departments.Dep_ID=User_Request.Department
LEFT JOIN Users u1 ON u1.User_ID = User_Request.Req_By
LEFT JOIN Users u2 ON u1.User_ID = User_Request.Approved_By
LEFT JOIN Users u3 ON u1.User_ID = User_Request.Created_By
where UserReq_ID = @req_id ;"
                        OnSelecting="SqlDataSource1_Selecting">
                        <SelectParameters>
                            <asp:Parameter Name="req_id" />

              </SelectParameters>
          </asp:SqlDataSource>

                        </div>
             
                   
                    
                    
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button4" runat="server" class="btn btn-danger" Text="Re-Check" data-toggle="modal" OnClientClick="return false;" data-target="#myModal3" />
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
                    <p>Do you want to confirm this Request? </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Yes" onclick="Create_Click"/>
                    
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
                    <p>Do you want to have a second opinion on this request? </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Yes" onclick="Reject_Click"/>
                    
                </div>
            </div>
        </div>
    </div>

    </>
</asp:Content>

