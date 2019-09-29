using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
public partial class Dev_Dash_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["SUser_Label_Heading"] = "Dashboard";
        Session["Scrumble1_Heading"] ="Dashboard";

    }

    [WebMethod]
    public static List<object> GetChartData()
    {
        string query = "SELECT Status, COUNT(Change_ID) TotalOrders";
        query += " FROM Change where Dev_ID =@dev_id GROUP BY Status";

        // string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        List<object> chartData = new List<object>();
        chartData.Add(new object[]
        {
        "Status", "TotalOrders"
        });
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@dev_id", Convert.ToInt16(HttpContext.Current.Session["User_ID"]));
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        string a = sdr["Status"].ToString();
                        string b = sdr["TotalOrders"].ToString();

                        chartData.Add(new object[]
                        {
                        sdr["Status"], sdr["TotalOrders"]

                        });

                    }
                }
                con.Close();
                return chartData;
            }
        }
    }



    [WebMethod]
    public static List<object> GetChartData2()
    {
        string query = "SELECT Status, COUNT(UserReq_ID) TotalReq";
        query += " FROM User_Request where Req_By =@req_id GROUP BY Status";
        // string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        List<object> chartData = new List<object>();
        chartData.Add(new object[]
        {
        "Status", "TotalReq"
        });
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ChngMgtConnectionString"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@req_id", Convert.ToInt16(HttpContext.Current.Session["User_ID"]));
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        string a = sdr["Status"].ToString();
                        string b = sdr["TotalReq"].ToString();

                        chartData.Add(new object[]
                        {
                        sdr["Status"], sdr["TotalReq"]

                        });

                    }
                }
                con.Close();

                return chartData;
            }
        }
    }
}