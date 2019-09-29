using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;
using System.Data;

public partial class Admin_ModifyUser_1 : System.Web.UI.Page
{
    int change_id;
    SqlDataReader reader;
    Outputs out1 = new Outputs();

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
        change_id = Convert.ToInt16(GridView1.SelectedRow.Cells[0].Text);
        
         //ModalPopupExtender1.Show();
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "View") return;
        change_id = Convert.ToInt16(e.CommandArgument);
        ClientScript.RegisterStartupScript(this.GetType(), "pop", "ShowPopup();", true);
        
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        //do something
    }

    protected void BtnView_Click(object sender, EventArgs e)
    {
      //  change_id =Convert.ToInt16(changetable.Rows[1].ToString)
    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Convert.ToInt16('4');
    }



    
}