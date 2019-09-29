<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_1.master" AutoEventWireup="true" CodeFile="Admin_AllUsers_1.aspx.cs" Inherits="Admin_AllUsers_1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

        

    
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="scriptmgr" runat="server"></asp:ScriptManager>
    


    
   
        <asp:SqlDataSource ID="AllUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>"  OnSelecting="AllUsers_Selecting" SelectCommand="SELECT t1.[User_Name], t1.[User_ID], ChngMgt_Access.Access_Level, Departments.Department, t1.[Designation], t2.User_Name Created_by, t1.[Created_Date], t1.[User_Status], t1.[Last_Login], t1.[Deactivate_Date], t1.[Initial_Pwd], UserMgt_Access.Access 
FROM [Users] t1 
INNER JOIN Departments ON Departments.Dep_ID = t1.Department_ID INNER JOIN ChngMgt_Access ON ChngMgt_Access.Access_ID = t1.User_Level INNER JOIN UserMgt_Access ON UserMgt_Access.Access_ID = t1.User_Creation_Level LEFT JOIN Users t2 ON t1.Created_By = t2.User_ID;
">
        </asp:SqlDataSource>
    
        <br />
        <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-9 col-lg-9">
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="AllUsers" CssClass="table table-bordered table-condensed table-responsive table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_OnRowCommand">
                <Columns>

                    
                    <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name"></asp:BoundField>
                    <asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" />

                    <asp:BoundField DataField="Access_Level" HeaderText="Change_Access" SortExpression="Access_Level"></asp:BoundField>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department"></asp:BoundField>
                    <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation"></asp:BoundField>

                    <asp:BoundField DataField="Created_by" HeaderText="Created_by" SortExpression="Created_by" />
                    
                    <asp:CheckBoxField DataField="User_Status" HeaderText="User_Status" SortExpression="User_Status"></asp:CheckBoxField>

                    <asp:BoundField DataField="Last_Login" HeaderText="Last_Login" SortExpression="Last_Login"></asp:BoundField>
                   
                    <asp:CheckBoxField DataField="Initial_Pwd" HeaderText="Initial_Pwd" SortExpression="Initial_Pwd"></asp:CheckBoxField>
                    <asp:BoundField DataField="Access" HeaderText="Creation_Access" SortExpression="Access"></asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                <asp:LinkButton ID="btnShowPopup" runat="server" class="btn btn-primary btn-sm"
                 CausesValidation="false" CommandName="reset"
                     CommandArgument='<%# Eval("User_ID") %>' >&nbsp;Reset </asp:LinkButton>
                 <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-sm"
                 CausesValidation="false" CommandName="change"
                     CommandArgument='<%# Eval("User_ID") %>' > <i class="glyphicon glyphicon-pencil icon-white"></i>&nbsp;Edit </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

                </Columns>
        </asp:GridView>
   </div>
          </div>
        </div>
            </div>
        
      

        
     

  
      <hr>

    <div class="modal fade" id="myModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="True">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>User Details</h3>
                </div>
                <div class="modal-body">
                    <p></p>
<div style="height: 400px; width: 400px;  overflow: Auto">
<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" CssClass="SlidingBox" DataKeyNames="User_ID">
              
              
              <ItemTemplate>

                  <table class="table table-bordered table-striped">
                    <tbody >
                        <tr>
                            <td>
                             User ID:
                                </td>
                            <td>
                            <asp:Label Text='<%# Eval("User_ID") %>' runat="server" ID="User_IDLabel1" /><br />
                                </td>
                            </tr>

                          <tr>
                            <td>
                  User Name:
                                </td>
                            <td>
                  
                                <asp:TextBox ID="UserNameTextBox" Text='<%# Bind("User_Name") %>' runat="server"></asp:TextBox><br />
                                
                            </td>
                            </tr>

                         <tr>
                            <td>
                            Department:
                                </td>
                             <td>
                                 <asp:DropDownList ID="DropDownListDep" runat="server" DataSourceID="SqlDataSourceDep" DataTextField="Department" DataValueField="Dep_ID" SelectedValue='<%# Bind("Department_ID") %>'></asp:DropDownList></br>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceDep" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Dep_ID], [Department] FROM [Departments] where Status='Active'"></asp:SqlDataSource>
                                
                            
                             </td>
                             </tr>
                        <tr>
                            <td>
                            Creation Date:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Created_Date") %>' runat="server" ID="Creation_DateTextBox" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                             Created By:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Created_by") %>' runat="server" ID="PriotityTextBox" /><br />
                            </td>
                            </tr>
                  
                         <tr>
                            <td>
                            Last Login:
                                </td>
                            <td>
                            <asp:Label Text='<%# Bind("Last_Login") %>' runat="server" ID="LastLoginTextBox" /><br />
                            </td>
                            </tr>
                  
                           
                 
                  <tr>
                            <td>
                    Change Management Access:
                                </td>
                            <td>
                                <asp:DropDownList ID="ChngeMgtAccessDropBox" runat="server" DataSourceID="SqlDataSourceChngrMgtAccss" DataTextField="Access_Level" DataValueField="Access_ID" SelectedValue='<%# Bind("User_Level") %>'></asp:DropDownList></br>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceChngrMgtAccss" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Access_ID], [Access_Level] FROM [ChngMgt_Access]"></asp:SqlDataSource>
                                
                            </td>
                            </tr>

                        <tr>
                            <td>
                    User Managemtn Access:
                                </td>
                            <td>
                                <asp:DropDownList ID="UserMgtAccessDrop" runat="server" DataSourceID="SqlDataSourceUsrMgtAccss" DataTextField="Access" DataValueField="Access_ID" SelectedValue='<%# Bind("User_Creation_Level") %>'></asp:DropDownList></br>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceUsrMgtAccss" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT [Access_ID], [Access] FROM [UserMgt_Access]"></asp:SqlDataSource>
                                
                            </td>
                            </tr>

                        <tr>
                            <td>
                    User Status:
                                </td>
                            <td>
                                <asp:CheckBox ID="ChckBoxStatus" runat="server" Checked='<%# Bind("User_Status") %>' />
                
                            </td>
                            </tr>

                        <tr>
                            <td>
                    Deactivated Date:
                                </td>
                            <td>
                  <asp:Label Text='<%# Bind("Deactivate_Date") %>' runat="server" ID="Label3" /><br />
                            </td>
                            </tr>

                        <tr>
                            <td>
                   Designation:
                                </td>
                            <td>
                <asp:TextBox ID="TxtBoxDesignation" Text='<%# Bind("Designation") %>' runat="server"></asp:TextBox><br />
                  
                            </td>
                            </tr>

                       

                      

                      
                 
                
                  </tbody>
                      </table>

              </ItemTemplate>
          </asp:FormView>
    

    </div>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ChngMgtConnectionString %>' SelectCommand="SELECT t1.[User_Name], t1.[User_ID], t1.User_Level, t1.Department_ID, t1.[Designation], t2.User_Name Created_by, t1.[Created_Date], t1.[User_Status], t1.[Last_Login], t1.[Deactivate_Date], t1.[Initial_Pwd], t1.User_Creation_Level 
FROM [Users] t1 
INNER JOIN Departments ON Departments.Dep_ID = t1.Department_ID INNER JOIN ChngMgt_Access ON ChngMgt_Access.Access_ID = t1.User_Level INNER JOIN UserMgt_Access ON UserMgt_Access.Access_ID = t1.User_Creation_Level LEFT JOIN Users t2 ON t1.Created_By = t2.User_ID where t1.User_ID = @user_id;  "
                        OnSelecting="SqlDataSource1_Selecting">
                        <SelectParameters>
                            <asp:Parameter Name="user_id" />

              </SelectParameters>
          </asp:SqlDataSource>
</br>
                    

         
                     </div>
                <div class="modal-footer">
                   
                   
                     
                     <asp:Button ID="Button4" runat="server" class="btn btn-primary" Text="Save" data-toggle="modal" OnClientClick="return false;" data-target="#myModal4" />
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    
                    
                </div>
            </div>
        </div>
       
    </div>
   
  <div class="modal fade" id="reset_pass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
           
               
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3>Reset Password</h3>
                    </div>
                    <div class="modal-body">
                        <div class="box-content">
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>New Password
                        </td>
                                    <td>
                        <asp:TextBox runat="server" ID="TxtRstPWD" type="password" class="form-control" placeholder="New Password"/>

                                        
                                    </td>
                                </tr>


                               
                         

                    </table>
                            <div id ="loginalert" runat ="server" class="alert alert-info">
                            <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
                                </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                   
                    <asp:Button ID="ResetPWD" runat="server" class="btn btn-success" Text="Reset Password" data-toggle="modal" OnClientClick="return false;" data-target="#myModal2" />
                </div>
            </div>
        </div>
         
    </div>
       
  <div class="modal fade" id="myModal2" tabindex="0" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                   <div class="alert alert-warning">
                  
                    <h5>Warning</h5> 
                </div>
                    
                </div>
                <div class="modal-body">
                    <p>Do you want to reset password? </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Yes" onclick="ResetPWD_Click"/>
                    
                </div>
            </div>
        </div>
    </div>  

  <div class="modal fade" id="myModal4" tabindex="3" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                   <div class="alert alert-warning">
                  
                    <h5>Warning</h5> 
                </div>
                    
                </div>
                <div class="modal-body">
                    <p>Do you want to save changes? </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Yes" onclick="UserSave_Click"/>
                    
                </div>
            </div>
        </div>
    </div>

  
    
</asp:Content>

