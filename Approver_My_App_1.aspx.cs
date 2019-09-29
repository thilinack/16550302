using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Approver_My_App: System.Web.UI.Page
{
    static int change_id;
    Inputs input1 = new Inputs();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["SUser_Label_Heading"] = "My Approvals";
        Session["Scrumble1_Heading"] = "My Approvals";
    }

   

    protected void DS_My_App_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16(Session["User_ID"]);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        change_id = Convert.ToInt16(GridView1.SelectedRow.Cells[1].Text);
       // ModalPopupExtender1.Show();
    }
    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        // if (e.CommandName != "SendMail") return;
        

        if (e.CommandName == "View")
        {
            change_id = Convert.ToInt16(e.CommandArgument);
            Session["id"] = change_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
            SqlDataSource1.SelectParameters["Change_ID"].DefaultValue = change_id.ToString();
            SqlDataSource_Comments.SelectParameters["Change_ID"].DefaultValue = change_id.ToString();
            fileselect.SelectParameters["Change_ID"].DefaultValue = change_id.ToString();
        }

        else if (e.CommandName == "Approve")
        {
            change_id = Convert.ToInt16(e.CommandArgument);
            Session["id"] = change_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal2').modal('show'); });   </script>", false);

        }

        else if (e.CommandName == "Reject")
        {
            change_id = Convert.ToInt16(e.CommandArgument);
            Session["id"] = change_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal3').modal('show'); });   </script>", false);

        }

        else
        {
            return;
        }
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
        if (CheckBoxPrivate.Checked)
        {
            input1.AddComment(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), Commenttxt.Text, true);
        }
        else
        {
            input1.AddComment(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), Commenttxt.Text, false);
        }
        Commenttxt.Text = "";
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
        SqlDataSource1.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
        SqlDataSource_Comments.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
        DataList1.DataBind();
    }


    protected void Dev_Click(object sender, EventArgs e)
    {
       // input1.BAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "BA_Qualified", Convert.ToInt16(DropDownList1.SelectedValue));
        change_id = Convert.ToInt16(Session["id"]);

        if (FileUpload1.HasFile)
        {
            HttpFileCollection hfc = Request.Files;


            string time1 = DateTime.Now.ToString();
            string directoryPath = Server.MapPath(string.Format("~/File_Uploads/" + change_id + "/"));
            if (!System.IO.Directory.Exists(directoryPath))
            {
                System.IO.Directory.CreateDirectory(@directoryPath);
            }
            else
            {
            }

            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    string file_name = hpf.FileName;
                    hpf.SaveAs(directoryPath + "\\" + file_name);


                    string full_path = directoryPath + file_name;


                    input1.InsertFile(full_path, change_id, file_name);
                }

            }
        }



        Response.Redirect("~/Dev_My_Dev_1.aspx");

    }


    protected void Reject_Click(object sender, EventArgs e)
    {
        input1.RejectChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Rejected");
        Response.Redirect("~/Dev_My_Dev_1.aspx");

    }

   
    }