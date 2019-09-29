using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;
using System.Data;

public partial class Admin_AllUsers_1 : System.Web.UI.Page
{
    int user_id;
    SqlDataReader reader;
    Outputs out1 = new Outputs();
    Inputs input1 = new Inputs();

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Scrumble1_Heading"] = "All Users";
        Session["SUser_Label_Heading"] = "All Users";

        /*      ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());

                String query2 = "SELECT [Change_ID], [Description], [Creation_Date], [Priotity], [Status], Change_Type.Type, Applications.Application, [Summary] FROM [Change] INNER JOIN Applications ON Applications.Application_ID = Change.Application INNER JOIN Change_Type ON Change_Type.ChangeType_ID = Change.Req_Type where Change.Req_ID = @User_ID ;";
                SqlCommand cmd = new SqlCommand(query2, con);
                try
                {

                    con.Open();

                    cmd.Parameters.AddWithValue("@User_ID", Global.User_ID);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    rptTable.DataSource = ds;
                    rptTable.DataBind();


                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                */

    }

    protected void AllUsers_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
       // e.Command.Parameters[0].Value =Convert.ToInt16(Session["User_ID"]);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        user_id = Convert.ToInt16(GridView1.SelectedRow.Cells[0].Text);
        
         //ModalPopupExtender1.Show();
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "reset")
        {
            user_id = Convert.ToInt16(e.CommandArgument);
            Session["User_ID"] = user_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>  $(document).ready(function () { $('#reset_pass').modal('show'); });   </script>", false);

        }

       else if (e.CommandName == "change")
        {
            user_id = Convert.ToInt16(e.CommandArgument);
            Session["User_ID"] = user_id.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>  $(document).ready(function () { $('#myModal').modal('show'); });   </script>", false);
            SqlDataSource1.SelectParameters["user_id"].DefaultValue = Session["User_ID"].ToString();
        }
        else return;
    }

    protected void BtnView_Click(object sender, EventArgs e)
    {
      //  change_id =Convert.ToInt16(changetable.Rows[1].ToString)
    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
     //   e.Command.Parameters[0].Value = Convert.ToInt16(Session["User_ID"]);
    }

    protected void ResetPWD_Click(object sender, EventArgs e)
    {
        input1.Reset_Pwd(Convert.ToInt16(Session["User_ID"]), TxtRstPWD.Text);
      
    }

    protected void UserSave_Click(object sender, EventArgs e)
    {
        
        TextBox txb1 = FormView1.FindControl("UserNameTextBox") as TextBox;
        TextBox txb2 = FormView1.FindControl("TxtBoxDesignation") as TextBox;
        DropDownList dl1 = FormView1.FindControl("DropDownListDep") as DropDownList;
        DropDownList dl2 = FormView1.FindControl("ChngeMgtAccessDropBox") as DropDownList;
        DropDownList dl3 = FormView1.FindControl("UserMgtAccessDrop") as DropDownList;
        CheckBox cb1 = FormView1.FindControl("ChckBoxStatus") as CheckBox;
        
        try
        {
           // Int64 uid = System.Convert.ToInt64(User_IDLabel1.Text);
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());

            con.Open();

            string qry = "Update Users Set User_Name=@User_Name,User_Level=@User_Level,Department_ID=@Department_ID,Designation=@Designation,User_Status=@User_Status,User_Creation_Level=@User_Creation_Level,Deactivate_Date=@Deactivate_Date where User_ID =@User_ID";
           
            SqlCommand cmd = new SqlCommand(qry, con);
          

            cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt16(Session["User_ID"]));
            
            
            cmd.Parameters.AddWithValue("@User_Name", txb1.Text);
            cmd.Parameters.AddWithValue("@User_Level", dl2.SelectedValue);
            cmd.Parameters.AddWithValue("@Department_ID", dl1.SelectedValue);
            cmd.Parameters.AddWithValue("@User_Creation_Level", dl3.SelectedValue);
            cmd.Parameters.AddWithValue("@Designation", txb2.Text);

            if (cb1.Checked)
            {
                cmd.Parameters.AddWithValue("@User_Status", 1);
                cmd.Parameters.AddWithValue("@Deactivate_Date", DBNull.Value);

            }
            else
            {
                cmd.Parameters.AddWithValue("@User_Status", 0);
                
                cmd.Parameters.AddWithValue("@Deactivate_Date", DateTime.Now);
            }
            
           

           
                cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin_AllUsers_1.aspx");
        }
        
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }

}
    
