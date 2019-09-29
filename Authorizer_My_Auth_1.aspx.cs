using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;

public partial class Authorizer_My_Auth_1 : System.Web.UI.Page
{
    int change_id;
    SqlDataReader reader;
    Outputs out1 = new Outputs();
    Inputs int1 = new Inputs();

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Scrumble1_Heading"] = "My Authorizations";
        Session["SUser_Label_Heading"] = "Authorizations";
       
    }

    protected void My_Auth_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16(Session["User_ID"]);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        change_id = Convert.ToInt16(GridView1.SelectedRow.Cells[0].Text);

        //ModalPopupExtender1.Show();
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            change_id = Convert.ToInt16(e.CommandArgument);
            Session["id"] = change_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
            SqlDataSource1.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
            SqlDataSource_Comments.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
            fileselect.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
        }
        else return;

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16(Session["id"]);
    }

    protected void SqlDataSource_Comments_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16(Session["id"]);
    }

    protected void File_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16(Session["id"]);
    }

    protected void BtnAddComnt_Click(object sender, EventArgs e)
    {
        int1.AddComment(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), Commenttxt.Text,false);

        Commenttxt.Text = "";
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
        SqlDataSource1.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
        SqlDataSource_Comments.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
        DataList1.DataBind();
    }
}