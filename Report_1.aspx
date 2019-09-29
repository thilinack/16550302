<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_1.aspx.cs" Inherits="Report_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 145px;
        }
        .auto-style3 {
            width: 114px;
        }
        .auto-style4 {
            width: 145px;
            height: 25px;
        }
        .auto-style5 {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/download.jpg" />
        <br />
        <br />
        <br />
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Change Request Form" Font-Size="X-Large" Font-Underline="True"></asp:Label>
            </div>
        <br />
        <table class="auto-style1" style="border: thin solid #000000; border-spacing: inherit;">
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Change ID</td>
                <td>
                    <asp:Label ID="lblchangeID" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Priority</td>
                <td>
                    <asp:Label ID="lblpriority" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Appication</td>
                <td>
                    <asp:Label ID="lblapplication" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Requet Type</td>
                <td>
                    <asp:Label ID="lblreqtype" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Request Details:"></asp:Label>
        <table border="1" class="auto-style1" style="border-style: solid; border-width: thin">
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Requested By</td>
                <td>
                    <asp:Label ID="lblreqby" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Requested Date</td>
                <td>
                    <asp:Label ID="lblreqdate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Department</td>
                <td>
                    <asp:Label ID="lbldep" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Designation</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Authorized By</td>
                <td>
                    <asp:Label ID="lblauthby" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Authorized Date</td>
                <td>
                    <asp:Label ID="lblauthdate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Designation</td>
                <td>
                    <asp:Label ID="lblauthdesig" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">&nbsp;</td>
                <td>
                    <asp:Label ID="lblreqdate4" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Change Details:"></asp:Label>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Summary</td>
                <td>
                    <asp:Label ID="lblsummery" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Description</td>
                <td rowspan="3">
                    <asp:Label ID="lbldes" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Business Analysis &amp; Development"></asp:Label>
        
        <table border="1" class="auto-style1" style="border-style: solid; border-width: thin">
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Analyzed By:</td>
                <td>
                    <asp:Label ID="lblbaby" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Analyze Completed Date:</td>
                <td>
                    <asp:Label ID="lblbadate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Analyzer Comment:</td>
                <td colspan="3">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceBAComments" Width="221px">
                        <ItemTemplate>
                            
                            <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            <br />
                            
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceBAComments" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Comment], [Date] FROM [Change_Comment] where Change_ID=@change_id and UserID =@userid;">
                        <SelectParameters>
                            <asp:Parameter Name="change_id" />
                            <asp:Parameter Name="userid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Developed By:</td>
                <td>
                    <asp:Label ID="lbldevby" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Developed Date</td>
                <td>
                    <asp:Label ID="lbldevdate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Developer Comments:</td>
                <td colspan="3">
                    <asp:DataList ID="DataListDevCmnt" runat="server" DataSourceID="SqlDataSourceDevComments" Width="322px">
                        <ItemTemplate>
                            
                            <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            <br />
                            
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceDevComments" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Comment], [Date] FROM [Change_Comment] where Change_ID=@change_id and UserID =@userid;">
                        <SelectParameters>
                            <asp:Parameter Name="change_id" />
                            <asp:Parameter Name="userid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" Text="Testing"></asp:Label>
        <br />
        <table border="1" class="auto-style1" style="border-style: solid; border-width: thin">
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">QA By:</td>
                <td>
                    <asp:Label ID="lblqaby" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">QA Completed Date:</td>
                <td>
                    <asp:Label ID="lblqadate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" style="background-color: #C0C0C0">QA Comment:</td>
                <td colspan="3" class="auto-style5">
                    <asp:DataList ID="DataListQACmnt" runat="server" DataSourceID="SqlDataSourceQAComments" Width="322px">
                        <ItemTemplate>
                            
                            <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            <br />
                            
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceQAComments" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Comment], [Date] FROM [Change_Comment] where Change_ID=@change_id and UserID =@userid;">
                        <SelectParameters>
                            <asp:Parameter Name="change_id" />
                            <asp:Parameter Name="userid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">UAT By:</td>
                <td>
                    <asp:Label ID="lbluatby" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">UAT Date</td>
                <td>
                    <asp:Label ID="lbluatdate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">UAT Comments:</td>
                <td colspan="3">
                    <asp:DataList ID="DataListUATCmnt" runat="server" DataSourceID="SqlDataSourceUATComments" Width="344px">
                        <ItemTemplate>
                            
                            <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            <br />
                            
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceUATComments" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Comment], [Date] FROM [Change_Comment] where Change_ID=@change_id and UserID =@userid;">
                        <SelectParameters>
                            <asp:Parameter Name="change_id" />
                            <asp:Parameter Name="userid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" Text="Approval &amp; Live Migration"></asp:Label>
        <br />
        <table border="1" class="auto-style1" style="border-style: solid; border-width: thin">
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Approved By:</td>
                <td>
                    <asp:Label ID="lblappby" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Approved Date:</td>
                <td>
                    <asp:Label ID="lblappdate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Approver Comment:</td>
                <td colspan="3">
                    <asp:DataList ID="DataListAppCmnt" runat="server" DataSourceID="SqlDataSourceBAComments">
                        <ItemTemplate>
                            
                            <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            <br />
                           
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceAppComments" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Comment], [Date] FROM [Change_Comment] where Change_ID=@change_id and UserID =@userid;">
                        <SelectParameters>
                            <asp:Parameter Name="change_id" />
                            <asp:Parameter Name="userid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Deployed By:</td>
                <td>
                    <asp:Label ID="lbldepby" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #C0C0C0">Deployed Date</td>
                <td>
                    <asp:Label ID="lbldepdate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color: #C0C0C0">Deployer Comments:</td>
                <td colspan="3">
                    <asp:DataList ID="DataListDeployCmnt" runat="server" DataSourceID="SqlDataSourceDeployComments">
                        <ItemTemplate>
                            
                            <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            <br />
                            
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceDeployComments" runat="server" ConnectionString="<%$ ConnectionStrings:ChngMgtConnectionString %>" SelectCommand="SELECT [Comment], [Date] FROM [Change_Comment] where Change_ID=@change_id and UserID =@userid;">
                        <SelectParameters>
                            <asp:Parameter Name="change_id" />
                            <asp:Parameter Name="userid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
