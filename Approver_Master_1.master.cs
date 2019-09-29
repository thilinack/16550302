using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;

public partial class Approver_Master_1 : System.Web.UI.MasterPage
{

    SqlConnection con;
    Encryption enc = new Encryption();
    Outputs out1 = new Outputs();
    Inputs inpt = new Inputs();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.IsUserLogedIN();

        }

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
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
        if (Session["LoginStatus"] == null || !Convert.ToBoolean(Session["LoginStatus"]) || Convert.ToInt16(Session["SAccess_ID"]) != 7)
        {
            Response.Redirect("~/Login_1.aspx");
        }
    }
    protected void ChangePWD_Click(object sender, EventArgs e)
    {
        try
        {
            int uid = System.Convert.ToInt16(Session["User_ID"]);
            string pass = enc.GenerateSHA256Hash(TxtPWD.Text);

            con.Open();
            string qry = "select * from Users where User_Id=@User_ID and Password=@Password";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@User_ID", uid);
            cmd.Parameters.AddWithValue("@Password", pass);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                if (NewPWD.Text == NewPWD2.Text)
                {

                    bool a = out1.CheckPassword(NewPWD.Text);
                    if (a == true)
                    {
                        inpt.Change_Pwd(uid, NewPWD.Text);
                        loginalert.Attributes.Add("class", "alert alert-success");
                        LblStatus.Text = "Password Changed Successfully";
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#change_pass').modal('show'); });   </script>", false);
                        NewPWD.Enabled = false;
                        NewPWD2.Enabled = false;
                        TxtPWD.Enabled = false;
                        BtnChangePWD.Visible = false;
                    }
                    else {
                        loginalert.Attributes.Add("class", "alert alert-warning");
                        LblStatus.Text = "Password is not complex";
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#change_pass').modal('show'); });   </script>", false);
                    }

                }

                else
                {
                    loginalert.Attributes.Add("class", "alert alert-danger");
                    LblStatus.Text = "Passwords do not match";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#change_pass').modal('show'); });   </script>", false);
                }
            }

            else
            {
                loginalert.Attributes.Add("class", "alert alert-danger");
                LblStatus.Text = "Old Password is not correct. Try again..!!";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#change_pass').modal('show'); });   </script>", false);
            }

        }

        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}
