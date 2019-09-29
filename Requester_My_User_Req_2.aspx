<%@ Page Title="" Language="C#" MasterPageFile="~/Requester_Master_2.master" AutoEventWireup="true" CodeFile="Requester_My_User_Req_2.aspx.cs" Inherits="My_User_Req_2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

        

    
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
     <div class="row">
    <div class="box col-md-10">   
   
        <asp:SqlDataSource ID="My_UserRequests" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" OldValuesParameterFormatString="original_{0}" OnSelecting="My_UserRequests_Selecting" SelectCommand="SELECT [UserReq_ID], [Req_Date],User_Request.Emp_No,CONCAT(User_Request.F_Name,' ',User_Request.L_Name) as Name, Applications.Application, User_Request.[Status], [Priority],u2.User_Name as Approved_By
FROM [User_Request] 
INNER JOIN Applications ON Applications.Application_ID = User_Request.Application_ID 
LEFT JOIN Users u1 ON u1.User_ID = User_Request.Req_By
LEFT JOIN Users u2 ON u2.User_ID = User_Request.Approved_By
LEFT JOIN Users u3 ON u3.User_ID = User_Request.Created_By
where User_Request.Req_By=@req_by">
            <SelectParameters>
                <asp:Parameter Name="req_by"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        
        <div class="container">
    <div class="row">
      <div class="col-md-10">
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="My_UserRequests" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" CssClass="table table-bordered table-condensed table-responsive table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_OnRowCommand" DataKeyNames="UserReq_ID">
                <Columns>
                    <asp:BoundField DataField="UserReq_ID" HeaderText="UserReq_ID" ReadOnly="True" InsertVisible="False" SortExpression="UserReq_ID"></asp:BoundField>
                    <asp:BoundField DataField="Req_Date" HeaderText="Req_Date" SortExpression="Req_Date"></asp:BoundField>
                    <asp:BoundField DataField="Emp_No" HeaderText="Emp_No" SortExpression="Emp_No"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Application" HeaderText="Application" SortExpression="Application"></asp:BoundField>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                    <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority"></asp:BoundField>
                    <asp:BoundField DataField="Approved_By" HeaderText="Approved_By" SortExpression="Approved_By"></asp:BoundField>
               
                    <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                <asp:LinkButton ID="btnShowPopup" runat="server" class="btn btn-primary btn-sm btn-info"
                 CausesValidation="false" CommandName="View" 
                     CommandArgument='<%# Eval("UserReq_ID") %>' > <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;View </asp:LinkButton>
                    
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
                    <h3>User Management Details</h3>
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
                            Request Date:
                                </td>
                             <td>
                            <asp:Label Text='<%# Bind("Req_Date") %>' runat="server" ID="DescriptionTextBox" /><br />
                             </td>
                             </tr>
                        <tr>
                            <td>
                            Request Type:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Req_Type") %>' runat="server" ID="Creation_DateTextBox" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                             Emp No:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Emp_No") %>' runat="server" ID="PriotityTextBox" /><br />
                            </td>
                            </tr>
                  
                         <tr>
                            <td>
                            Name:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Name") %>' runat="server" ID="StatusTextBox" /><br />
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
                  Department:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Department") %>' runat="server" ID="SummaryTextBox" /><br />
                            </td>
                            </tr>

                         <tr>
                            <td>
                  Designation:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Designation") %>' runat="server" ID="Label1" /><br />
                            </td>
                            </tr>

                         <tr>
                            <td>
                  Access Level:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Access_level") %>' runat="server" ID="Label2" /><br />
                            </td>
                            </tr>

                        
                         <tr>
                            <td>
                  Status:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Status") %>' runat="server" ID="Label3" /><br />
                            </td>
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
                  Approved By:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Approved_By") %>' runat="server" ID="Label5" /><br />
                            </td>
                            </tr>

                         <tr>
                            <td>
                  Approved Date:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Approved_Date") %>' runat="server" ID="Label6" /><br />
                            </td>
                            </tr>
                  </tbody>
                      </table>

              </ItemTemplate>
          </asp:FormView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [UserReq_ID], [Req_Date],User_Request.Req_Type,User_Request.Emp_No,CONCAT(User_Request.F_Name,' ',User_Request.L_Name) as Name,Departments.Department,User_Request.Designation,User_Request.Access_level ,Applications.Application, User_Request.[Status], [Priority],u2.User_Name as Approved_By,User_Request.Approved_Date
FROM [User_Request] 
INNER JOIN Applications ON Applications.Application_ID = User_Request.Application_ID 
Inner JOIN Departments on Departments.Dep_ID=User_Request.Department
LEFT JOIN Users u1 ON u1.User_ID = User_Request.Req_By
LEFT JOIN Users u2 ON u2.User_ID = User_Request.Approved_By
LEFT JOIN Users u3 ON u3.User_ID = User_Request.Created_By
where User_Request.UserReq_ID=@req_id"
                        OnSelecting="SqlDataSource1_Selecting">
                        <SelectParameters>
                            <asp:Parameter Name="req_id" />

              </SelectParameters>
          </asp:SqlDataSource>

                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    
                    
                </div>
            </div>
        </div>
       
    </div>


    </>
</asp:Content>

