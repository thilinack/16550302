using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for Outputs
/// </summary>
public class Outputs
{
    SqlConnection con;
    public Outputs()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void userdetails()
    {

        String query2 = "Select Users.USER_NAME,Departments.Department,Users.Department_ID,Users.designation,Users.User_Level,Users.Initial_Pwd, Users.User_Creation_Level from Users Inner join Departments on Users.Department_ID = Departments.Dep_ID where Users.User_ID = @User_ID";

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
        using (var cmd = new SqlCommand(query2, con))
        {
            // command.Parameters.Add("RoomID", SqlDbType.Char).Value = RoomID;
            cmd.Parameters.AddWithValue("@User_ID", HttpContext.Current.Session["User_ID"]);
            try
            {
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        // Note that reader[x] has the equivalent type to the type
                        // of the returned column, converted using
                        // http://msdn.microsoft.com/en-us/library/cc716729.aspx
                        // .ToString() if the item isn't null is always ok
                        while (reader.Read())
                        {
                            HttpContext.Current.Session["SUser_Name"] = reader["User_Name"].ToString();

                            HttpContext.Current.Session["SDepartment"] = reader["Department"].ToString();
                            HttpContext.Current.Session["SDepID"] = Convert.ToInt16(reader["Department_ID"]);
                            HttpContext.Current.Session["SDesignation"] = reader["designation"].ToString();
                            HttpContext.Current.Session["SAccess_ID"] = Convert.ToInt16(reader["User_Level"]);
                            int test = Convert.ToInt16(HttpContext.Current.Session["SAccess_ID"]);
                            HttpContext.Current.Session["SInitial_Pwd"] = Convert.ToBoolean(reader["Initial_Pwd"]);
                            HttpContext.Current.Session["SUAccess_ID"] = Convert.ToInt16(reader["User_Creation_Level"]);

                        }


                        if (reader.Read())
                        {
                            throw new Exception("Too many rows");
                        }
                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }


    /*
       public Boolean IsFirstLogin(int User_ID)

        {

        String query1= "Select Initial_Pwd from Users Where User_ID =@User_ID";
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());

        try
        {
            SQLCON = new SqlConnection(connectionString);
            SQLCON.Open();
            SQLCommand = new SqlC Command();
            SQLCommand.CommandType = CommandType.Text;
            SQLCommand.Parameters.Add("USUsername", SqlDbType.VarChar).Value = CUSER;
            SQLCommand.CommandText = "SELECT USRole FROM  WHERE USUsername = @USUsername";
            Int32 USRole = (Int32)SQLCommand.ExecuteScalar();

            return USRole;

        }
        catch (Exception)
        {
            HttpContext.Current.Response.Redirect("~/ErrorRedirect.aspx", false);
            return 0;
        }


    }
    
    */



    public void changedetails()
    {

        String query2 = "SELECT [Change_ID], [Description], [Creation_Date], [Priotity], [Status], Change_Type.Type, Applications.Application, [Summary] FROM [Change] INNER JOIN Applications ON Applications.Application_ID = Change.Application INNER JOIN Change_Type ON Change_Type.ChangeType_ID = Change.Req_Type where Change.Req_ID = @User_ID ;";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query2, con);
            cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt16(HttpContext.Current.Session["User_ID"]));
            SqlDataReader result = cmd.ExecuteReader();


        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }



    public void changedetails_2(out int? dev_id, out string dev_date, out int? qa_id, out string qa_date, out int? dev_assign, int change_id)
    {

        dev_id = null;
        dev_date = null;
        qa_id = null;
        qa_date = null;
        dev_assign = null;

        String query2 = "SELECT [Dev_ID], [Dev_Date], [BA_ID], [BA_Date],[Dev_Assign]  From Change  where Change_ID = @Change_ID ;";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query2, con);
            cmd.Parameters.AddWithValue("@Change_ID", change_id);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        dev_id = Convert.ToInt16(reader["Dev_ID"]);
                        dev_date = reader["Dev_Date"].ToString();
                        qa_id = Convert.ToInt16(reader["BA_ID"]);
                        qa_date = reader["BA_Date"].ToString();
                        dev_assign = Convert.ToInt16(reader["Dev_Assign"]);
                    }

                }
                else
                {
                    throw new Exception("No rows");
                }
            }


        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }


    public void getallchangedetails(out string Summary, out string Creation_Date, out string Priotity, out string Status, out string Type, out string Application, out string Requested_By, out string Authorized_By, out string Analyzed_By, out string Developed_By, out string QA_By, out string UAT_By, out string Approve_By, out string Deploy_By, out string Description, out string ba_date, out string dev_date, out string qa_date, out string uat_date, out string dep_date, out string app_date, out string auth_date, out int? ba_id, out int? dev_id, out int? qa_id, out int? uat_id, out int? app_id, out int? dep_id, int change_id)
    {

        Summary = null;
        Creation_Date = null;
        Priotity = null;
        Status = null;
        Type = null;
        Application = null;
        Requested_By = null;
        Authorized_By = null;
        Analyzed_By = null;
        Developed_By = null;
        QA_By = null;
        UAT_By = null;
        Approve_By = null;
        Deploy_By = null;
        Description = null;
        dev_date = null;
        ba_date = null;
        qa_date = null;
        uat_date = null;
        app_date = null;
        dep_date = null;
        auth_date = null;
        ba_id = null;
        dev_id = null;
        qa_id = null;
        uat_id = null;
        app_id = null;
        dep_id = null;

        String query2 = "SELECT [Change_ID], [Summary] ,BA_ID, Dev_ID, QA_ID, UAT_ID,App_ID,Deploy_ID, [Creation_Date], [Priotity], Change.Status, Change_Type.Type, Applications.Application,u1.User_Name Requested_By,u2.User_Name Authorized_By,u3.User_Name Analyzed_By,u4.User_Name Developed_By,u5.User_Name QA_By,u6.User_Name UAT_By,u7.User_Name Approve_By,u8.User_Name Deploy_By,[Description],Dev_Date,BA_Date,QA_Date,UAT_Date,App_Date,Deploy_Date,Auth_Date FROM[Change] INNER JOIN Applications ON Applications.Application_ID = Change.Application INNER JOIN Change_Type ON Change_Type.ChangeType_ID = Change.Req_Type Left JOIN  Users u1 ON Change.Req_ID = u1.User_ID Left JOIN  Users u2 ON Change.Auth_ID = u2.User_ID Left JOIN  Users u3 ON Change.BA_ID = u3.User_ID Left JOIN  Users u4 ON Change.Dev_ID = u4.User_ID Left JOIN  Users u5 ON Change.QA_ID = u5.User_ID Left JOIN  Users u6 ON Change.UAT_ID = u6.User_ID Left JOIN  Users u7 ON Change.App_ID = u7.User_ID Left JOIN  Users u8 ON Change.Deploy_ID = u8.User_ID where Change.Change_ID = @Change_ID;";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query2, con);
            cmd.Parameters.AddWithValue("@Change_ID", change_id);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        Summary= reader["Summary"].ToString();
                        Creation_Date = reader["Creation_Date"].ToString();
                        Priotity = reader["Priotity"].ToString();
                        Status = reader["Status"].ToString();
                        Type = reader["Type"].ToString();
                        Application = reader["Application"].ToString();
                        Requested_By = reader["Requested_By"].ToString();
                        Authorized_By = reader["Authorized_By"].ToString();
                        Analyzed_By = reader["Analyzed_By"].ToString();
                        Developed_By = reader["Developed_By"].ToString();
                        QA_By = reader["QA_By"].ToString();
                        UAT_By = reader["UAT_By"].ToString();
                        Approve_By = reader["Approve_By"].ToString();
                        Deploy_By = reader["Deploy_By"].ToString();
                        Description = reader["Description"].ToString();
                        dev_date = reader["Dev_Date"].ToString();
                        ba_date = reader["BA_Date"].ToString();
                        qa_date = reader["QA_Date"].ToString();
                        uat_date = reader["UAT_Date"].ToString();
                        app_date = reader["App_Date"].ToString();
                        dep_date = reader["Deploy_Date"].ToString();
                        auth_date = reader["Auth_Date"].ToString();
                        ba_id = Convert.ToInt16(reader["BA_ID"]);
                        dev_id = Convert.ToInt16(reader["Dev_ID"]); ;
                        qa_id = Convert.ToInt16(reader["QA_ID"]);
                        uat_id = Convert.ToInt16(reader["UAT_ID"]);
                        app_id = Convert.ToInt16(reader["App_ID"]);
                        dep_id = Convert.ToInt16(reader["Deploy_ID"]);

                    }

                }
                else
                {
                    throw new Exception("No rows");
                }
            }


        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }

    public void get_change_status( out string status,  int change_id)
    {

       status = null;
      

        String query2 = "SELECT [Status]  From Change  where Change_ID = @Change_ID ;";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query2, con);
            cmd.Parameters.AddWithValue("@Change_ID", change_id);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        status = reader["Status"].ToString();
                       
                    }

                }
                else
                {
                    throw new Exception("No rows");
                }
            }


        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }


    public void get_user_request_status(out string status, int UserReq_ID)
    {

        status = null;


        String query2 = "SELECT [Status]  From User_Request  where UserReq_ID = @UserReq_ID ;";
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query2, con);
            cmd.Parameters.AddWithValue("@UserReq_ID", UserReq_ID);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        status = reader["Status"].ToString();

                    }

                }
                else
                {
                    throw new Exception("No rows");
                }
            }


        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }

    public void changecounts(out string new_req, out string auth, out string ba, out string dev, out string qa, out string uat, out string app, out string dep, out string rej)
    {
        new_req = "";
        auth = "";
        ba = "";
        dev = "";
        qa = "";
        uat = "";
        app = "";
        dep = "";
        rej = "";

        String query1 = "SELECT COUNT(Change_ID) as 'count' FROM Change where Status ='New Request';";
        String query2 = "SELECT COUNT(Change_ID) as 'count'FROM Change where Status ='Authorized';";
        String query3 = "SELECT COUNT(Change_ID) as 'count'FROM Change where Status ='BA_Qualified';";
        String query4 = "SELECT COUNT(Change_ID) as 'count'FROM Change where Status ='Developed';";
        String query5 = "SELECT COUNT(Change_ID) as 'count'FROM Change where Status ='QA Checked';";
        String query6 = "SELECT COUNT(Change_ID) as 'count'FROM Change where Status ='UAT Confirmed';";
        String query7 = "SELECT COUNT(Change_ID) as 'count'FROM Change where Status ='Approved';";
        String query8 = "SELECT COUNT(Change_ID) as 'count'FROM Change where Status ='Change Deployed';";
        String query9 = "SELECT COUNT(Change_ID) as 'count'FROM Change where Status ='Rejected';";


        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());


        using (var cmd = new SqlCommand(query1, con))
        {

            try
            {
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            new_req = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //////////////////////////

        using (var cmd = new SqlCommand(query2, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            auth = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //////////////////////////////////////////////

        using (var cmd = new SqlCommand(query3, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            ba = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //////////////////////////////////////////////////

        using (var cmd = new SqlCommand(query4, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            dev = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        ////////////////////////////////////////////////////////////////

        using (var cmd = new SqlCommand(query5, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            qa = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //////////////////////////////////////////////////

        using (var cmd = new SqlCommand(query6, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            uat = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        ////////////////////////////////////////////////////////////////////////
        using (var cmd = new SqlCommand(query7, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            app = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //////////////////////////////////
        using (var cmd = new SqlCommand(query8, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            dep = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //////////////////////////////

        using (var cmd = new SqlCommand(query9, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            rej = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }


        con.Close();
    }

    public void creationcounts(out string new_req, out string auth, out string create, out string reject)
    {
        new_req = "";
        auth = "";
        create = "";
        reject = "";


        String query1 = "SELECT COUNT(UserReq_ID) as 'count' FROM User_Request where Status ='New_Request';";
        String query2 = "SELECT COUNT(UserReq_ID) as 'count'FROM User_Request where Status ='Authorized';";
        String query3 = "SELECT COUNT(UserReq_ID) as 'count'FROM User_Request where Status ='Created';";
        String query4 = "SELECT COUNT(UserReq_ID) as 'count'FROM User_Request where Status ='Rejected';";


        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString());


        using (var cmd = new SqlCommand(query1, con))
        {

            try
            {
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            new_req = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //////////////////////////

        using (var cmd = new SqlCommand(query2, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            auth = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //////////////////////////////////////////////

        using (var cmd = new SqlCommand(query3, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            create = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        ///////////////////////////////////////////////////////////////////////
        using (var cmd = new SqlCommand(query4, con))
        {

            try
            {


                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            reject = reader["count"].ToString();
                        }

                    }
                    else
                    {
                        throw new Exception("No rows");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

    }

    public bool CheckPassword(string password)
    {
        string MatchPassPattern = "(?=^.{6,}$)(?=.*d)(?=.*[a-zA-Z])";

        if (password != null) return Regex.IsMatch(password, MatchPassPattern);
        else return false;

    }
}