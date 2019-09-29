using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;
using System.Web.Security;


public partial class Login_1 : System.Web.UI.Page
{
    SqlConnection con;
    Encryption enc = new Encryption();
    Outputs out1 = new Outputs();
    Inputs inpt = new Inputs();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Session["LoginStatus"] = false;
        }
       
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());

    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        //ModalPopupExtender1.Show();
        try
        {
            Int64 uid = System.Convert.ToInt64(TxtUserName.Text);
            string pass = enc.GenerateSHA256Hash(TxtPWD.Text);

            con.Open();
            string qry = "select * from Users where User_Id=@User_ID and Password=@Password and User_Status = 'TRUE'";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@User_ID", uid);
            cmd.Parameters.AddWithValue("@Password", pass);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {

                
                Session["User_ID"]  = uid;
        
                out1.userdetails();
                string a = Session["SInitial_Pwd"].ToString();

                if (Session["SInitial_Pwd"].ToString() == "True")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#change_pass').modal('show'); });   </script>", false);

                }
                else {
                    inpt.Last_Login(Convert.ToInt16(uid));
                    LoginStatus.Text = "Login Sucess......!!";
                    Session["LoginStatus"] = "True";
                    string ab = Session["LoginStatus"].ToString();
                    if (Convert.ToInt16(Session["SAccess_ID"]) == 1 && Convert.ToInt16(Session["SUAccess_ID"]) == 1)
                    {
                        Session["LoginStatus"] = "True";
                        FormsAuthentication.RedirectFromLoginPage(Session["User_ID"].ToString(), false);
                        Response.Redirect("~/Admin_Dash_1.aspx");
                        

                    }
                    else {
                        Session["LoginStatus"] = "True";
                        FormsAuthentication.RedirectFromLoginPage(Session["User_ID"].ToString(), false);
                        Response.Redirect("~/Home.aspx");
                        
                    }

                }

            }
            else
            {
                loginalert.Attributes.Add("class", "alert alert-danger");
                LoginStatus.Text = "User Id & Password Is not correct Try again..!!";
                
                   
           
            }
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void ChangePWD_Click(object sender, EventArgs e)
    {
        try
        {
            int uid = System.Convert.ToInt16(Session["User_ID"]);
            string pass = enc.GenerateSHA256Hash(TextBox1.Text);

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
                    bool a= out1.CheckPassword(NewPWD.Text);
                    if (a == true)
                    {
                        inpt.Change_Pwd(uid, NewPWD.Text);
                        loginalert.Attributes.Add("class", "alert alert-success");
                        LblStatus.Text = "Password Changed Successfully";
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#change_pass').modal('show'); });   </script>", false);
                    }
                    else {
                        loginalert.Attributes.Add("class", "alert alert-warning");
                        LblStatus.Text = "Password is not complex";
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
                LblStatus.Attributes.Add("class", "alert alert-danger");
                LblStatus.Text = "Old Password is not correct. Try again..!!";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>    $(document).ready(function () { $('#change_pass').modal('show'); });   </script>", false);
            }

        }

        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void TxtUserName_TextChanged(object sender, EventArgs e)
    {

    }
}