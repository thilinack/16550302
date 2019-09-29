<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_1.master" AutoEventWireup="true" CodeFile="Admin_New_User_2.aspx.cs" Inherits="New_Request_2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="row">  
    <div class="col-md-10">

        
    <asp:Panel ID="Panel2" runat="server">
        <div class="form-group">
               <label >Emp No</label>
                       <asp:TextBox ID="txtempno" runat="server" class="form-control"></asp:TextBox> 
            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
 ControlToValidate="txtempno" ErrorMessage="Value must be a whole number" />
                    </div>

    <div class="form-group">
               <label >First Name</label>
                       <asp:TextBox ID="txtfname" runat="server" class="form-control"></asp:TextBox>
                    </div>

       <div class="form-group">
               <label >Last Name</label>
                        <asp:TextBox ID="txtlname" runat="server" class="form-control"></asp:TextBox>
                    </div>

         <div class="form-group">
               <label >Other Names</label>
                        <asp:TextBox ID="txtoname" runat="server" class="form-control"></asp:TextBox>
                    </div>

        <div class="form-group">
               <label >Request Type</label>
                <asp:DropDownList ID="DrpdwnRequestType" runat="server" class="form-control">
                    <asp:ListItem>New User Creation</asp:ListItem>
                    <asp:ListItem>User Modification</asp:ListItem>
                           <asp:ListItem>User Termination</asp:ListItem>
                </asp:DropDownList>
     

         <div class="form-group">
               <label >Department</label>
                       <asp:DropDownList ID="DropDownDep" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="Dep_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Department], [Dep_ID] FROM [Departments]"></asp:SqlDataSource>
                    </div>
       
       <div class="form-group">
               <label >Application</label>
                      <asp:DropDownList ID="DropDownApplication" runat="server" class="form-control" DataSourceID="DataSourse_Applications" DataTextField="Application" DataValueField="Application_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataSourse_Applications" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Application], [Application_ID] FROM [Applications]"></asp:SqlDataSource>
                    </div>

       <div class="form-group">
               <label >Priority</label>
                       <asp:RadioButton ID="rd_low" runat="server" GroupName="priority" Text="Low" />
                    &nbsp;<asp:RadioButton ID="rd_medium" runat="server" GroupName="priority" Text="Medium" />
                    &nbsp;<asp:RadioButton ID="Rd_high" runat="server" GroupName="priority" Text="High" />
                    </div>

         <div class="form-group">
               <label >Designation</label>
                       <asp:TextBox ID="txtdesignation" class="form-control" runat="server"></asp:TextBox>
                    </div>
      
         <div class="form-group">
               <label >Descriprion</label>
                        <asp:TextBox ID="TextBox_Des" runat="server" class="autogrow form-control" Columns="5" Rows="5" TextMode="MultiLine" ></asp:TextBox>
                    </div>

        <asp:LinkButton  ID="Button2" runat="server" class="btn btn-primary btn-md" OnClick="Button2_Click"><i class="glyphicon glyphicon-send icon-white"></i>&nbsp;Submit</asp:LinkButton>
        
   
</asp:Panel>
        </div>
            </div>
        </div>
        

</asp:Content>

