<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_1.master" AutoEventWireup="true" CodeFile="Admin_New_Change_1.aspx.cs" Inherits="New_Change_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:Panel ID="Panel2" runat="server" Height="552px"  Width="819px" >
    <table class="auto-style40">
        <tr>
            <td class="auto-style38">Request Type</td>
            <td class="auto-style39">
                <asp:DropDownList ID="DropDownReqType" runat="server" DataSourceID="SqlDataSource_ReqType" DataTextField="Type" DataValueField="ChangeType_ID" Height="26px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_ReqType" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Type], [ChangeType_ID] FROM [Change_Type] WHERE ([Type_Status] = @Type_Status)" OnSelecting="SqlDataSource_ReqType_Selecting">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Active" Name="Type_Status" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style31">Application</td>
            <td class="auto-style21">
                <asp:DropDownList ID="DropDownApplication" runat="server" DataSourceID="DataSourse_Applications" DataTextField="Application" DataValueField="Application_ID" Height="25px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataSourse_Applications" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Application], [Application_ID] FROM [Applications] WHERE ([Status] = @Status)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Active" Name="Status" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style31">Priority</td>
            <td class="auto-style21">
                <asp:RadioButton ID="rd_low" runat="server" GroupName="priority" Text="Low" />
                    &nbsp;<asp:RadioButton ID="rd_medium" runat="server" GroupName="priority" Text="Medium" />
                    &nbsp;<asp:RadioButton ID="Rd_high" runat="server" GroupName="priority" Text="High" />
            </td>
        </tr>
        <tr>
            <td class="auto-style31">Summary</td>
            <td class="auto-style21">
                <asp:TextBox ID="TextBoxSummary" runat="server" Width="441px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style31">Descriprion</td>
            <td class="auto-style21">
                <asp:TextBox ID="TextBox_Des" runat="server" Columns="5" Rows="5" TextMode="MultiLine" Width="444px" Height="111px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style31">Attach File</td>
            <td class="auto-style21">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style21">
           
             </td>
         

        </tr>
        <tr>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style21">
                <asp:Button  ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" style="height: 26px" />
            </td>
        </tr>
    </table>
</asp:Panel>
        </div>

</asp:Content>

