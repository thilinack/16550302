using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Creater_Master_2 : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.IsUserLogedIN();

        }

        Label_User.Text = Session["SUser_Name"].ToString();
        lblEmpNo.Text = Session["User_ID"].ToString();
        lblEmployee.Text = Session["SUser_Name"].ToString();
        lblDep.Text = Session["SDepartment"].ToString();
        lblDesignation.Text = Session["SDesignation"].ToString();
        Label_Heading.Text = Session["SUser_Label_Heading"].ToString();
        crumble1.Text = Session["Scrumble1_Heading"].ToString();
    }

    private void IsUserLogedIN()
    {
        if (Session["LoginStatus"] == null || !Convert.ToBoolean(Session["LoginStatus"]) || Convert.ToInt16(Session["SUAccess_ID"]) != 4)
        {
            Response.Redirect("~/Login_1.aspx");
        }
    }
}
