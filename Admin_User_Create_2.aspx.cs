using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration; // this namespace

public partial class Admin_User_Create : System.Web.UI.Page
{
    Inputs input1 = new Inputs();
    SqlConnection con;

    Encryption enc = new Encryption();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["SUser_Label_Heading"] = "User Details";
        Session["Scrumble1_Heading"] = "New User";
        
    }

    



    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Int64 uid = System.Convert.ToInt64(User_ID.Text);
            string pass = enc.GenerateSHA256Hash(Initial_Password.Text);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());

            con.Open();

            string qry = "Insert into Users (User_ID,Password,User_Name,User_Level,Department_ID,Designation,Created_Date,Created_By,User_Status,Initial_Pwd,User_Creation_Level,Email) values (@User_ID,@Password,@User_Name,@User_Level,@Department_ID,@Designation,@Creation_Date,@Created_By,@User_Status,@Intial_Pwd,@User_Creation_Level,@email)";
            string qry2 = "Select * From Users Where User_ID=@User_ID";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlCommand cmd2 = new SqlCommand(qry2, con);

            cmd2.Parameters.AddWithValue("@User_ID", uid);
            cmd.Parameters.AddWithValue("@User_ID", uid);
            cmd.Parameters.AddWithValue("@Password", pass);
            cmd.Parameters.AddWithValue("@User_Name", User_Name.Text);
            cmd.Parameters.AddWithValue("@User_Level", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@Department_ID", DropDownList_Dep.SelectedValue);
            cmd.Parameters.AddWithValue("@User_Creation_Level", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("@Designation", Designation.Text);
            cmd.Parameters.AddWithValue("@Creation_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Created_By", Convert.ToInt16(Session["User_ID"]));
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@User_Status", 1);
            cmd.Parameters.AddWithValue("@Intial_Pwd", 1);

            SqlDataReader sdr = cmd2.ExecuteReader();
            if (sdr.Read())
            {
                Response.Write("<script>alert('User ID Already Exist')</script>");
            }
            else {
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Úser Successfully added')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    
}
}
