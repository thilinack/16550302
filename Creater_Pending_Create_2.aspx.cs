using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;

public partial class Creater_Pending_Create_2 : System.Web.UI.Page
{
    int Req_id;
    SqlDataReader reader;
    Outputs out1 = new Outputs();
    Inputs input1 = new Inputs();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        Session["Scrumble1_Heading"] = "Pending Requests";
        Session["SUser_Label_Heading"] = "Pending Requests";
        
    }

    protected void Pending_Create_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Req_id = Convert.ToInt16(GridView1.SelectedRow.Cells[0].Text);

        //ModalPopupExtender1.Show();
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            Req_id = Convert.ToInt16(e.CommandArgument);
            Session["uid"] = Req_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
            SqlDataSource1.SelectParameters["req_id"].DefaultValue = Req_id.ToString();
            
        }

        else if (e.CommandName == "Approve")
        {
            Req_id = Convert.ToInt16(e.CommandArgument);
            Session["uid"] =Req_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal2').modal('show'); });   </script>", false);

        }

        else if (e.CommandName == "Reject")
        {
            Req_id = Convert.ToInt16(e.CommandArgument);
            Session["uid"] = Req_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal3').modal('show'); });   </script>", false);

        }
        else
        {
            return;
        }
    }


    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16(Session["uid"]);
    }

    protected void SqlDataSource_Comments_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16(Session["uid"]);
    }

    protected void File_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16(Session["uid"]);
    }



 

    protected void Create_Click(object sender, EventArgs e)
    {
        input1.UserCreation(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["uid"]), "Created");
        Response.Redirect("~/Creater_Pending_Create_2.aspx");

    }

    protected void Reject_Click(object sender, EventArgs e)
    {
        input1.RejectUserCreation(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["uid"]), "Rejected");
        Response.Redirect("~/Authorizer_Pending_Auth_2.aspx");

    }



}