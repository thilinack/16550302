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

public partial class Approver_Dash_1 : System.Web.UI.Page
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
        query += " FROM Change where App_ID =@app_id GROUP BY Status";

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
                cmd.Parameters.AddWithValue("@app_id", Convert.ToInt16(HttpContext.Current.Session["User_ID"]));
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

}