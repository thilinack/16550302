using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home1 : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["LoginStatus"] as string))
        {
            Response.Redirect("~/Login_1.aspx");

        }
    }





    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        if (Convert.ToInt16(Session["SAccess_ID"]) == 1)
        {
            Response.Redirect("~/Admin_Dash_1.aspx");
        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 2)
        {
            Response.Redirect("~/User_Dash_1.aspx");
        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 3)
        {
            Response.Redirect("~/Authorizer_Dash_1.aspx");
        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 4)
        {
            Response.Redirect("~/BA_Dash_1.aspx");
        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 5)
        {
            Response.Redirect("~/Dev_Dash_1.aspx");
        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 6)
        {
            Response.Redirect("~/QA_Dash_1.aspx");
        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 7)
        {
            Response.Redirect("~/Approver_Dash_1.aspx");
        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 8)
        {
            Response.Redirect("~/Deployer_Dash_1.aspx");
        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 9)
        {
            Response.Redirect("~/UserAuth_Dash_1.aspx");

        }

        else if (Convert.ToInt16(Session["SAccess_ID"]) == 0)

        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (Convert.ToInt16(Session["SUAccess_ID"]) == 1)
        {
            Response.Redirect("~/Requester_New_User_2.aspx");
        }

        else if (Convert.ToInt16(Session["SUAccess_ID"]) == 2)
        {
            Response.Redirect("~/Requester_New_User_2.aspx");
        }

        else if (Convert.ToInt16(Session["SUAccess_ID"]) == 3)
        {
            Response.Redirect("~/Authorizer_Pending_Auth_2.aspx");
        }

        else if (Convert.ToInt16(Session["SUAccess_ID"]) == 4)
        {
            Response.Redirect("~/Creater_Pending_Create_2.aspx");
        }

        else if (Global.GUAccess_ID == 5)
        {
            Response.Redirect("~/Access/Dev/Req_To_Dev.aspx");
        }

    }
}