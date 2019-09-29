using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;
using System.Data;

public partial class Admin_All_Changes: System.Web.UI.Page
{
    static int change_id;
    Inputs input1 = new Inputs();
    Outputs out1 = new Outputs();
    DateTime dt = DateTime.Now;
    protected void Page_Load(object sender, EventArgs e)
    {
        //SqlDataSourceChange.SelectParameters["ïd"].DefaultValue = "0";
        Session["SUser_Label_Heading"] = "All Changes";
        Session["Scrumble1_Heading"] = "All Changes";
    }

   

    protected void DS_My_App_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
       // e.Command.Parameters[0].Value = Convert.ToInt16(Session["User_ID"]);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        change_id = Convert.ToInt16(GridView1.SelectedRow.Cells[1].Text);
       // ModalPopupExtender1.Show();
    }
    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        // if (e.CommandName != "SendMail") return;
        string status;
        BtnAuth.Visible = true;
        BtnBA.Visible = true;
        BtnDev.Visible = true;
        BtnQA.Visible = true;
        BtnUAT.Visible = true;
        BtnApp.Visible = true;
        BtnDep.Visible = true;
        if (e.CommandName == "View")
        {
            change_id = Convert.ToInt16(e.CommandArgument);
            Session["id"] = change_id.ToString();
            out1.get_change_status(out status, Convert.ToInt16(Session["id"]));
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
            if (status == "Authorized")
            {
                BtnAuth.Visible = false;
            }
            else if (status == "BA_Qualified")
            {
                BtnAuth.Visible = false;
                BtnBA.Visible = false;
            }
            else if (status == "Developed")
            {
                BtnAuth.Visible = false;
                BtnBA.Visible = false;
                BtnDev.Visible = false;
            }

            else if (status == "QA Checked")
            {
                BtnAuth.Visible = false;
                BtnBA.Visible = false;
                BtnDev.Visible = false;
                BtnQA.Visible = false;
            }

            else if (status == "UAT Confirmed")
            {
                BtnAuth.Visible = false;
                BtnBA.Visible = false;
                BtnDev.Visible = false;
                BtnQA.Visible = false;
                BtnUAT.Visible = false;
            }

            else if (status == "Approved")
            {
                BtnAuth.Visible = false;
                BtnBA.Visible = false;
                BtnDev.Visible = false;
                BtnQA.Visible = false;
                BtnUAT.Visible = false;
                BtnApp.Visible = false;
            }
            else if (status == "Change Deployed")
            {
                BtnAuth.Visible = false;
                BtnBA.Visible = false;
                BtnDev.Visible = false;
                BtnUAT.Visible = false;
                BtnQA.Visible = false;
                BtnApp.Visible = false;
                BtnDep.Visible = false;
            }

            else

            {
                BtnAuth.Visible = true;
                BtnBA.Visible = true;
                BtnDev.Visible = true;
                BtnQA.Visible = true;
                BtnUAT.Visible = true;
                BtnApp.Visible = true;
                BtnDep.Visible = true;
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
            SqlDataSource1.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
            SqlDataSource_Comments.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
           fileselect.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
        }

        else if (e.CommandName == "Report")
        {
            change_id = Convert.ToInt16(e.CommandArgument);
            Session["id"] = change_id.ToString();
           // Response.Redirect("~/Reports.aspx");
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('Report_1.aspx','_newtab');", true);
            //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal2').modal('show'); });   </script>", false);

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

    protected void dropdownselectchange(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 11)//All
        {
            SearchTxt2.Visible = true;
            SearchTxt3.Visible = true;
            SearchTxt.Visible = false;
        }
        if (DropDownList1.SelectedIndex == 12)//All
        {
            SearchTxt2.Visible = false;
            SearchTxt3.Visible = false;
            SearchTxt.Visible = false;
        }
        else
        {
            SearchTxt.Visible = true;
            SearchTxt2.Visible = false;
            SearchTxt3.Visible = false;
        }
        
    }

    protected void BtnAddFile_Click(object sender, EventArgs e)
    {
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


        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
        SqlDataSource1.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
        fileselect.SelectParameters["Change_ID"].DefaultValue = Session["id"].ToString();
        fileuploads.DataBind();
    }


    protected void Auth_Click(object sender, EventArgs e)
    {
        input1.AuthorizeChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized");
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



        Response.Redirect("~/Admin_All_Changes_1.aspx");

    }


    protected void BA_Click(object sender, EventArgs e)
    {
        DateTime schedule = DateTime.ParseExact(Request.Form[TxtBoxSchdule.UniqueID],
    "M/d/yyyy",
    System.Globalization.CultureInfo.InvariantCulture);
        input1.AuthorizeChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized");
        input1.BAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "BA_Qualified", Convert.ToInt16(DropDownList2.SelectedValue), schedule);
        //input1.BAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized" );
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



        Response.Redirect("~/Admin_All_Changes_1.aspx");

    }

    protected void Dev_Click(object sender, EventArgs e)
    {
        input1.AuthorizeChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized");
        input1.BAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized", Convert.ToInt16(Session["User_ID"]),dt);
        input1.DevelopChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Developed");
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



        Response.Redirect("~/Admin_All_Changes_1.aspx");

    }

    protected void QA_Click(object sender, EventArgs e)
    {
        input1.AuthorizeChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized");
        input1.BAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized", Convert.ToInt16(Session["User_ID"]),dt);
        input1.DevelopChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Developed");
        input1.QAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "QA Checked");
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



        Response.Redirect("~/Admin_All_Changes_1.aspx");

    }

    protected void UAT_Click(object sender, EventArgs e)
    {
        input1.AuthorizeChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized");
        input1.BAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized", Convert.ToInt16(Session["User_ID"]),dt);
        input1.DevelopChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Developed");
        input1.QAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "QA Checked");
        input1.UATChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "UAT Confirmed");
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



        Response.Redirect("~/Admin_All_Changes_1.aspx");

    }

    protected void App_Click(object sender, EventArgs e)
    {
//        DateTime schedule = DateTime.ParseExact(Request.Form[TxtBoxSchdule.UniqueID],
//   "M/d/yyyy",
//   System.Globalization.CultureInfo.InvariantCulture);
        
        input1.AuthorizeChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized");
       
        input1.BAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized", Convert.ToInt16(Session["User_ID"]),dt);
        input1.DevelopChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Developed");
        input1.QAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "QA Checked");
        input1.UATChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "UAT Confirmed");
        input1.ApproveChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Approved");
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



        Response.Redirect("~/Admin_All_Changes_1.aspx");

    }

    protected void Dep_Click(object sender, EventArgs e)
    {
        input1.AuthorizeChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized");
        input1.BAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Authorized", Convert.ToInt16(Session["User_ID"]),dt);
        input1.DevelopChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Developed");
        input1.QAChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "QA Checked");
        input1.UATChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "UAT Confirmed");
        input1.ApproveChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Approved");
        input1.DeployChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Change Deployed");
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



        Response.Redirect("~/Admin_All_Changes_1.aspx");

    }
    protected void Reject_Click(object sender, EventArgs e)
    {
        input1.RejectChange2(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Rejected");
        Response.Redirect("~/Admin_All_Changes_1.aspx");

    }

    protected void Search_Click(object sender, EventArgs e)
    {
        // string a = "";
        // a = SearchTxt.Text;
        if (DropDownList1.SelectedIndex == 0 && SearchTxt.Text != "")
        {
            SqlDataSourceChange.SelectParameters["id"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceChange.ID;
            GridView1.DataBind();
        }

       else if (DropDownList1.SelectedIndex == 1 && SearchTxt.Text != "")
        {
            SqlDataSourceStatus.SelectParameters["status"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceStatus.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 2 && SearchTxt.Text != "")
        {
            SqlDataSourcePriority.SelectParameters["priority"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourcePriority.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 3 && SearchTxt.Text != "")
        {
            SqlDataSourceApp.SelectParameters["app"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceApp.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 4 && SearchTxt.Text != "")
        {
            SqlDataSourceType.SelectParameters["type"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceType.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 5 && SearchTxt.Text != "")
        {
            SqlDataSourceReqby.SelectParameters["ReqBy"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceReqby.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 6 && SearchTxt.Text != "")
        {
            SqlDataSourceAuthby.SelectParameters["AuthBy"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceAuthby.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 7 && SearchTxt.Text != "")
        {
            SqlDataSourceAnalyzeby.SelectParameters["ba"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceAnalyzeby.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 8 && SearchTxt.Text != "")
        {
            SqlDataSourceDevby.SelectParameters["dev"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceDevby.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 9 && SearchTxt.Text != "")
        {
            SqlDataSourceQAby.SelectParameters["qa"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceQAby.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 10 && SearchTxt.Text != "")
        {
            SqlDataSourceAppby.SelectParameters["appby"].DefaultValue = SearchTxt.Text;
            GridView1.DataSourceID = SqlDataSourceAppby.ID;
            GridView1.DataBind();
        }

        else if (DropDownList1.SelectedIndex == 11 && SearchTxt3.Text != "" && SearchTxt2.Text != "")
        {
            
        }

        else if (DropDownList1.SelectedIndex == 12)
        {
            
            GridView1.DataSourceID = SqlDataSourceDelay.ID;
            GridView1.DataBind();
        }
    }


}