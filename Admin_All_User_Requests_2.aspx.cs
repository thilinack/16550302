using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;

public partial class All_User_Req_2 : System.Web.UI.Page
{
    int Req_id;
    SqlDataReader reader;
    Outputs out1 = new Outputs();
    Inputs input1 = new Inputs();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        Session["Scrumble1_Heading"] = "All Requests";
        Session["SUser_Label_Heading"] = "All User Requests";
        
    }

    protected void My_Auth_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //e.Command.Parameters[0].Value = Convert.ToInt16(Session["User_ID"]);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Req_id = Convert.ToInt16(GridView1.SelectedRow.Cells[0].Text);

        //ModalPopupExtender1.Show();
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        string status;
        BtnAuth.Visible = true;
        BtnCreate.Visible = true;
        BtnReject.Visible = true;
        if (e.CommandName == "View")
        {
            Req_id = Convert.ToInt16(e.CommandArgument);
            Session["uid"] = Req_id.ToString();
            out1.get_user_request_status(out status, Convert.ToInt16(Session["uid"]));
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>  $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
            SqlDataSource1.SelectParameters["req_id"].DefaultValue = Req_id.ToString();
            if (status == "New_Request") {
                BtnAuth.Visible = true;
                BtnCreate.Visible = true;
                BtnReject.Visible = true;
            }

            else if (status == "Authorized")
            {
                BtnAuth.Visible = false;
                BtnCreate.Visible = true;
                BtnReject.Visible = true;
            }

            else if (status == "Created")
            {
                BtnAuth.Visible = false;
                BtnCreate.Visible = false;
                BtnReject.Visible = false;
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>  $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
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



    protected void AuthReq_Click(object sender, EventArgs e)
    {
      //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal2').modal('show'); });   </script>", false);

    }

    protected void Auth_Click(object sender, EventArgs e)
    {
        input1.AuthorizeUserCreation(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["uid"]), "Authorized");
        Response.Redirect("~/Admin_All_User_Requests_2.aspx");

    }

    protected void Create_Click(object sender, EventArgs e)
    {
        input1.AuthorizeUserCreation(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["uid"]), "Authorized");
        input1.UserCreation(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["uid"]), "Created");
        Response.Redirect("~/Admin_All_User_Requests_2.aspx");

    }

    protected void Reject_Click(object sender, EventArgs e)
    {
        input1.RejectUserCreation(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["uid"]), "Rejected");
        Response.Redirect("~/Admin_All_User_Requests_2.aspx");

    }



}