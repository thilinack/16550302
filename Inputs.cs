using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;

/// <summary>
/// Summary description for Inputs
/// </summary>
public class Inputs
{
    SqlConnection con;
    Outputs out2 = new Outputs();
    public Inputs()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int InsertChange(string Description, String priority, string status, string summary, int application, int req_type)
    {
        
        String query2 = "Insert into Change (Description,Creation_Date,Priotity,Req_ID,Status,Summary,Application,Req_Type) output INSERTED.Change_ID values (@Description,@Creation_Date,@Priotity,@Req_ID,@Status,@Summary,@Application,@req_type) ";

       try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query2, con);
            
            cmd.Parameters.AddWithValue("@Description", Description);
            cmd.Parameters.AddWithValue("@Creation_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Priotity", priority);
            cmd.Parameters.AddWithValue("@Req_ID",Convert.ToInt16(HttpContext.Current.Session["User_ID"]));
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@Summary", summary);
            cmd.Parameters.AddWithValue("@Application", application);
            cmd.Parameters.AddWithValue("@req_type", req_type);

            int id = (int)cmd.ExecuteScalar();
            if (con.State == System.Data.ConnectionState.Open)
                con.Close();
            return id;



            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

            catch (Exception ex)
            {
                Console.Write(ex.Message);
            return 0;
            }
        }

    public void AuthorizeChange(int Auth_ID, int change_ID, string status)
    {
        String query3 = "update change set Auth_ID = @user_ID,Auth_Date = @Auth_Date,Status =@Status,Reassign=@Reassign where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", Auth_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@Auth_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@Reassign", 0);


            cmd.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }


    public void RejectChange(int Auth_ID, int change_ID, string status)
    {
        String query3 = "update change set Rejected_By = @user_ID,Reject_Date = @Auth_Date,Status =@Status where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", Auth_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@Auth_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }



    public void ApproveRejectChange(int App_ID, int change_ID, string status)
    {
        String query3 = "update change set App_ID = @user_ID,Auth_Date = @App_Date,Status =@Status where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", App_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@Auth_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }


    public void ReassignChange(int User_ID, int change_ID, int Level,string assign)
    {
        int? dev_id, ba_id,dev_assign;
        string dev_date, ba_date;
        Outputs out1 = new Outputs();
        out1.changedetails_2(out dev_id, out dev_date, out  ba_id, out ba_date,out dev_assign, change_ID);

        String query3 = "Insert INTO Reassign_Changes (Change_ID,User_ID,Reassign_Date,Reassign_Level,Dev_ID,Dev_Date,BA_ID,BA_Date,assignment) Values (@change_id,@user_id,@date,@level,@dev_id,@dev_date,@ba_id,@ba_date,@assign)";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_id", User_ID);
            cmd.Parameters.AddWithValue("@change_id", change_ID);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@level", Level);
            cmd.Parameters.AddWithValue("@dev_id", dev_id);
            cmd.Parameters.AddWithValue("@dev_date", dev_date);
            cmd.Parameters.AddWithValue("@ba_id", ba_id);
            cmd.Parameters.AddWithValue("@ba_date", ba_date);
            cmd.Parameters.AddWithValue("@assign", assign);


            cmd.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }




    public void InsertFile(string path, int change_id, string file_name)
    {

        String query2 = "Insert into File_Upload (File_URL,Change_ID,File_Name) values (@path,@change_id,@file_name) ";

        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query2, con);

            cmd.Parameters.AddWithValue("@path", path);
            cmd.Parameters.AddWithValue("@change_id", change_id);
            cmd.Parameters.AddWithValue("@file_name", file_name);


            cmd.ExecuteNonQuery();

            if (con.State == System.Data.ConnectionState.Open) con.Close();
            



            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
            
        }
    }



    public void BAChange(int BA_ID, int change_ID, string status, int Dev_Assign, DateTime? schedule)
    {
        String query3 = "update change set BA_ID = @user_ID,BA_Date = @BA_Date,Status =@Status, Dev_Assign=@Dev_Assign,Dev_Assign_Date =@BA_Date,Reassign=@Reassign,Schedule_Release=@Schedule_Release where Change_ID = @change_ID";
       // String query4 = "insert into Change_Comment (Change_ID,UserID,Comment,Date) VALUES (@change_ID,@user_ID,@comment,@BA_Date)";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);
           // SqlCommand cmd2 = new SqlCommand(query4, con);

            cmd.Parameters.AddWithValue("@user_ID", BA_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@BA_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@Dev_Assign", Dev_Assign);
            cmd.Parameters.AddWithValue("@Reassign", 0);
            if (schedule == null)
            {
                cmd.Parameters.AddWithValue("@Schedule_Release", DBNull.Value);
            }
            else {
                cmd.Parameters.AddWithValue("@Schedule_Release", schedule);
            }
            //     cmd2.Parameters.AddWithValue("@user_ID", BA_ID);
            //    cmd2.Parameters.AddWithValue("@change_ID", change_ID);
            //    cmd2.Parameters.AddWithValue("@BA_Date", DateTime.Now);



            cmd.ExecuteNonQuery();
        //    cmd2.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }


    }

    // This will reasign the change to BA Completed state
    public void DevChange_Reassign(int change_ID)
    {
        String query3 = "update change set Dev_ID = @user_ID,Dev_Date = @Dev_Date,Status =@Status,Reassign=@Reassign where Change_ID = @change_ID";

        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);
            
            string st = "BA_Qualified";
            cmd.Parameters.AddWithValue("@user_ID", DBNull.Value);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@Dev_Date", DBNull.Value);
            cmd.Parameters.AddWithValue("@Status", st);
            cmd.Parameters.AddWithValue("@Reassign", 1);

            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }


    // This will reasign the change to Authorized state
    public void BAChange_Reassign(int change_ID)
    {
        String query3 = "update change set Dev_ID = @Dev_ID,Dev_Date = @Dev_Date, BA_ID = @BA_ID,BA_Date = @BA_Date,Dev_Assign=@Dev_Assign,Dev_Assign_Date =@Dev_Assign_Date,Status =@Status,Reassign=@Reassign where Change_ID = @change_ID";

        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);
            // SqlCommand cmd2 = new SqlCommand(query4, con);
            string st = "Authorized";
            cmd.Parameters.AddWithValue("@Dev_ID", DBNull.Value);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@Dev_Date", DBNull.Value);
            cmd.Parameters.AddWithValue("@Status", st);
            cmd.Parameters.AddWithValue("@BA_ID", DBNull.Value);
            cmd.Parameters.AddWithValue("@BA_Date", DBNull.Value);
            cmd.Parameters.AddWithValue("@Dev_Assign", DBNull.Value);
            cmd.Parameters.AddWithValue("@Dev_Assign_Date", DBNull.Value);
            cmd.Parameters.AddWithValue("@Reassign", 1);

            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }

    public void AddComment(int BA_ID, int change_ID, string comment,Boolean flag)
    {
        
        String query4 = "insert into Change_Comment (Change_ID,UserID,Comment,Date,Private) VALUES (@change_ID,@user_ID,@comment,@BA_Date,@Private)";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            
            SqlCommand cmd2 = new SqlCommand(query4, con);

        
            cmd2.Parameters.AddWithValue("@user_ID", BA_ID);
            cmd2.Parameters.AddWithValue("@change_ID", change_ID);
            cmd2.Parameters.AddWithValue("@BA_Date", DateTime.Now);
            cmd2.Parameters.AddWithValue("@Comment", comment);
            cmd2.Parameters.AddWithValue("@Private", flag);

            cmd2.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }


    }



    public void AddQADetails(int change_ID,int user_id, Boolean chk1, Boolean chk2, Boolean chk3, Boolean chk4, Boolean chk5)
    {

        String query4 = "insert into QA_Check (Change_ID,QA_ID,User_Req,Test_Data,Test_Case,Roll_Back,No_Sys_Impact,QA_Check_Date) VALUES (@Change_ID,@QA_ID,@User_Req,@Test_Data,@Test_Case,@Roll_Back,@No_Sys_Impact,@QA_Check_Date)";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();

            SqlCommand cmd2 = new SqlCommand(query4, con);


            cmd2.Parameters.AddWithValue("@QA_ID", user_id);
            cmd2.Parameters.AddWithValue("@Change_ID", change_ID);
            cmd2.Parameters.AddWithValue("@QA_Check_Date", DateTime.Now);
            cmd2.Parameters.AddWithValue("@User_Req", chk1);
            cmd2.Parameters.AddWithValue("@Test_Data", chk2);
            cmd2.Parameters.AddWithValue("@Test_Case", chk3);
            cmd2.Parameters.AddWithValue("@Roll_Back", chk4);
            cmd2.Parameters.AddWithValue("@No_Sys_Impact", chk5);

            cmd2.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }


    }

    public void DevelopChange(int Dev_ID, int change_ID, string status)
    {
        String query3 = "update change set Dev_ID = @user_ID,Dev_Date = @Dev_Date,Status =@Status,Reassign=@Reassign where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", Dev_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@Dev_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@Reassign", 0);

            cmd.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }


    }


    public void QAChange(int QA_ID, int change_ID, string status)
    {
        String query3 = "update change set QA_ID = @user_ID,QA_Date = @QA_Date,Status =@Status where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", QA_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@QA_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();




            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }


    }

    public void UATChange(int UAT_ID, int change_ID, string status)
    {
        String query3 = "update change set UAT_ID = @UAT_ID,UAT_Date = @UAT_Date,Status =@Status where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@UAT_ID", UAT_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@UAT_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }



    public void ApproveChange(int App_ID, int change_ID, string status)
    {
        String query3 = "update change set App_ID = @App_ID,App_Date = @App_Date,Status =@Status where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@App_ID", App_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@App_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }


    public void DeployChange(int Deploy_ID, int change_ID, string status)
    {
        String query3 = "update change set Deploy_ID = @Deploy_ID,Deploy_Date = @Deploy_Date,Status =@Status where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@Deploy_ID", Deploy_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@Deploy_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }


    }

    public void RejectChange2(int User_ID, int change_ID, string status)
    {
        String query3 = "update change set Rejected_By = @User_ID,Reject_Date = @Reject_Date,Status =@Status where Change_ID = @change_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@User_ID", User_ID);
            cmd.Parameters.AddWithValue("@change_ID", change_ID);
            cmd.Parameters.AddWithValue("@Reject_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }


    }

    public void Change_Pwd(int User_ID,String Pwd)
    {
        Encryption enc = new Encryption();
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            string pass = enc.GenerateSHA256Hash(Pwd);

            con.Open();

            string qry = "Update Users set Password=@Password,Initial_Pwd=@Intial_Pwd where User_ID=@User_ID";
            SqlCommand cmd = new SqlCommand(qry, con);

           
            cmd.Parameters.AddWithValue("@Password", pass);
            cmd.Parameters.AddWithValue("@Intial_Pwd", 0);
            cmd.Parameters.AddWithValue("@User_ID", User_ID);
            cmd.ExecuteNonQuery();
//            Global.Initial_Pwd = false;
            HttpContext.Current.Session["Initial_Pwd"] = false;
            /*
             SqlDataReader sdr = cmd.ExecuteReader();
             if (sdr.Read())
             {
                 LoginStatus.Text = "Login Sucess......!!";
                 Response.Redirect("~/Home.aspx");
             }
             else
             {
                 LoginStatus.Text = "UserId & Password Is not correct Try again..!!";

             }
             con.Close();
             */
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }


    public void Reset_Pwd(int User_ID, String Pwd)
    {
        Encryption enc = new Encryption();
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            string pass = enc.GenerateSHA256Hash(Pwd);

            con.Open();

            string qry = "Update Users set Password=@Password,Initial_Pwd=@Intial_Pwd where User_ID=@User_ID";
            SqlCommand cmd = new SqlCommand(qry, con);


            cmd.Parameters.AddWithValue("@Password", pass);
            cmd.Parameters.AddWithValue("@Intial_Pwd", 1);
            cmd.Parameters.AddWithValue("@User_ID", User_ID);
            cmd.ExecuteNonQuery();
            //            Global.Initial_Pwd = false;
         //   HttpContext.Current.Session["Initial_Pwd"] = false;
            /*
             SqlDataRinsereader sdr = cmd.ExecuteReader();
             if (sdr.Read())
             {
                 LoginStatus.Text = "Login Sucess......!!";
                 Response.Redirect("~/Home.aspx");
             }
             else
             {
                 LoginStatus.Text = "UserId & Password Is not correct Try again..!!";

             }
             con.Close();
             */
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }

    public void Last_Login(int User_ID)
    {
        
        try
        {
            int uid = System.Convert.ToInt16(User_ID);
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());

            con.Open();

            string qry = "Update Users set Last_Login = @last_login where User_ID=@User_ID";
            SqlCommand cmd = new SqlCommand(qry, con);


            cmd.Parameters.AddWithValue("@last_login", DateTime.Now);
            cmd.Parameters.AddWithValue("@User_ID", User_ID);
            cmd.ExecuteNonQuery();
            
           
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }


    public int InsertUserCreation(string Description, string priority, string status, int application, int Department, string f_name,string l_name,string other_names,int emp_no, string Designation, string req_type)
    {

        String query2 = "Insert into User_Request (Access_level,Req_Date,Priority,Req_By,Status,Application_ID,Department,Emp_No,F_Name,L_Name,Other_Names,Designation,Req_Type) output INSERTED.UserReq_ID values (@Description,@Creation_Date,@Priotity,@Req_ID,@Status,@Application,@Department,@Emp_No,@F_Name,@L_Name,@Other_Names,@Designation,@req_type)";

        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query2, con);

            cmd.Parameters.AddWithValue("@Description", Description);
            cmd.Parameters.AddWithValue("@Creation_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Priotity", priority);
            cmd.Parameters.AddWithValue("@Req_ID", Convert.ToInt16(HttpContext.Current.Session["User_ID"]));
            cmd.Parameters.AddWithValue("@Status", status);
            
            cmd.Parameters.AddWithValue("@Application", application);
            cmd.Parameters.AddWithValue("@Department", Department);
            cmd.Parameters.AddWithValue("@Emp_No", emp_no);
            cmd.Parameters.AddWithValue("@F_Name", f_name);
            cmd.Parameters.AddWithValue("@L_Name", l_name);
            cmd.Parameters.AddWithValue("@Other_Names", other_names);
            cmd.Parameters.AddWithValue("@Designation", Designation);
            cmd.Parameters.AddWithValue("@req_type", req_type);


            int id = (int)cmd.ExecuteScalar();
            if (con.State == System.Data.ConnectionState.Open)
                con.Close();
            return id;



            //Response.Write("<script>alert('Úser Successfully added')</script>");

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
            return 0;
        }
    }


    public void AuthorizeUserCreation(int Auth_ID, int Req_ID, string status)
    {
        String query3 = "update User_Request set Approved_By = @user_ID,Approved_Date = @Auth_Date,Status =@Status where UserReq_ID = @Req_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", Auth_ID);
            cmd.Parameters.AddWithValue("@Req_ID", Req_ID);
            cmd.Parameters.AddWithValue("@Auth_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }



    public void RejectUserCreation(int Auth_ID, int Req_ID, string status)
    {
        String query3 = "update User_Request set Rejected_By = @user_ID,Rejected_Date = @Auth_Date,Status =@Status where UserReq_ID = @Req_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", Auth_ID);
            cmd.Parameters.AddWithValue("@Req_ID", Req_ID);
            cmd.Parameters.AddWithValue("@Auth_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);

            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }



    public void UserCreation(int Creater_ID, int Req_ID, string status)
    {
        String query3 = "update User_Request set Created_By = @user_ID,Created_Date = @Created_Date,Status =@Status where UserReq_ID = @Req_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", Creater_ID);
            cmd.Parameters.AddWithValue("@Req_ID", Req_ID);
            cmd.Parameters.AddWithValue("@Created_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }


    public void SecondOpinion(int Creater_ID, int Req_ID, string status)
    {
        String query3 = "update User_Request set Created_By = @user_ID,Created_Date = @Created_Date,Status =@Status where UserReq_ID = @Req_ID";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            cmd.Parameters.AddWithValue("@user_ID", Creater_ID);
            cmd.Parameters.AddWithValue("@Req_ID", Req_ID);
            cmd.Parameters.AddWithValue("@Created_Date", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", status);


            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }


    public void Add_Application(string application)
    {
        String query3 = "insert into Applications (Application,Added_Date,Status) values (@application,@date,@status)";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);

            
            cmd.Parameters.AddWithValue("@application", application);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@status", "Active");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }

    public void Inactive_Application(int app_id)
    {
        String query3 = "Update Applications set Status=@status where Application_ID = @app_id";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);


            cmd.Parameters.AddWithValue("@app_id", app_id);
            
            cmd.Parameters.AddWithValue("@status", "Inactive");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }

    public void Active_Application(int app_id)
    {
        String query3 = "Update Applications set Status=@status where Application_ID = @app_id";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);


            cmd.Parameters.AddWithValue("@app_id", app_id);

            cmd.Parameters.AddWithValue("@status", "Active");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }


    public void Add_Department(string department, string location)
    {
        String query3 = "insert into Departments (Department,Location,Status) values (@application,@location,@status)";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);


            cmd.Parameters.AddWithValue("@application", department);
            cmd.Parameters.AddWithValue("@location", location);
            cmd.Parameters.AddWithValue("@status", "Active");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }

    public void Inactive_Department(int dep_id)
    {
        String query3 = "Update Departments set Status=@status where Dep_ID = @dep_id";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);


            cmd.Parameters.AddWithValue("@dep_id", dep_id);

            cmd.Parameters.AddWithValue("@status", "Inactive");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }

    public void Activate_Department(int dep_id)
    {
        String query3 = "Update Departments set Status=@status where Dep_ID = @dep_id";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);


            cmd.Parameters.AddWithValue("@dep_id", dep_id);

            cmd.Parameters.AddWithValue("@status", "Active");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }


    public void Inactive_ChangeType(int change_type)
    {
        String query3 = "Update Change_Type set Type_Status=@status where ChangeType_ID = @type_id";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);


            cmd.Parameters.AddWithValue("@type_id", change_type);

            cmd.Parameters.AddWithValue("@status", "Inactive");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }

    public void Activate_ChangeType(int change_type)
    {
        String query3 = "Update Change_Type set Type_Status=@status where ChangeType_ID = @type_id";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);


            cmd.Parameters.AddWithValue("@type_id", change_type);

            cmd.Parameters.AddWithValue("@status", "Active");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }

    public void Add_ChangeType(string type)
    {
        String query3 = "insert into Change_Type (Type,Type_Status) values (@type,@status)";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query3, con);


            cmd.Parameters.AddWithValue("@Type", type);
            cmd.Parameters.AddWithValue("@status", "Active");



            cmd.ExecuteNonQuery();

        }

        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }

}

