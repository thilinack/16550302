<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_1.master" AutoEventWireup="true" CodeFile="Admin_User_Create_2.aspx.cs" Inherits="Admin_User_Create" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="row">  
    <div class="col-md-10">

        
                    <div class="form-group">
                        <label >User ID</label>
                        <asp:TextBox ID="User_ID" runat="server" type="text" class="form-control" placeholder="User ID"></asp:TextBox>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
 ControlToValidate="User_ID" ErrorMessage="Value must be a whole number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="User_ID" ErrorMessage="Employee Number Cannot be Empty"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label >Employee Name</label>
                        <asp:TextBox ID="User_Name" runat="server" type="text" class="form-control" placeholder="Employee Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="User_Name" ErrorMessage="Employee Name Cannot be Empty"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label >E-mail</label>
                        
                        
                        <asp:TextBox ID="email" runat="server" type="email" class="form-control" placeholder="Enter email"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label >Department</label>
<asp:DropDownList ID="DropDownList_Dep" runat="server" class="form-control" DataSourceID="Departments" DataTextField="Department" DataValueField="Dep_ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="Departments" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Department], [Dep_ID] FROM [Departments] WHERE ([Status] = @Status)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Active" Name="Status" Type="String"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div class="form-group">
                        <label >Designation</label>
                        <asp:TextBox ID="Designation" runat="server" type="text" class="form-control" placeholder="Designation"></asp:TextBox>
                        
                    </div>
              
                    <div class="form-group">
                        <label for="exampleInputPassword1">Initial Password</label>
                        
                        <asp:TextBox ID="Initial_Password" type="password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Initial_Password" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </div>
                  
                    <div class="form-group">
                        <label >Access</label>
                        <div class= "form-inline">
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSourceChangeAccess" DataTextField="Access_Level" DataValueField="Access_ID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceChangeAccess" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Access_ID], [Access_Level] FROM [ChngMgt_Access]"></asp:SqlDataSource>
                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" DataSourceID="SqlDataSource_Access_Mgt" DataTextField="Access" DataValueField="Access_ID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_Access_Mgt" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Access_ID], [Access] FROM [UserMgt_Access]"></asp:SqlDataSource>
                             </div>
                        </div>

                  <asp:LinkButton ID="SubmitBtn" class="btn btn-primary btn-sm" runat="server" OnClick="SubmitBtn_Click" ><i class="glyphicon glyphicon-send icon-white"></i>&nbsp;Submit</asp:LinkButton>

                

        
   
        </div>
            </div>
        </div>
        

</asp:Content>

