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


public partial class Admin_Dash_1 : System.Web.UI.Page
{

    Outputs out1 = new Outputs();
    Inputs input1 = new Inputs();
    protected void Page_Load(object sender, EventArgs e)
    {
        String new_req, auth, ba, dev, qa, uat, app, dep, rej, new_req2, auth2, create, reject;

        Session["SUser_Label_Heading"] = "Dashboard";
        Session["Scrumble1_Heading"] = "Dashboard";
        out1.changecounts(out new_req, out auth, out ba, out dev, out qa, out uat, out app, out dep, out rej);
        out1.creationcounts(out new_req2, out auth2, out create, out reject);
        Dash_New_Req.Text = new_req;
        Dash_Auth_Req.Text = auth;
        Dash_BA_Req.Text = ba;
        Dash_Dev_Req.Text = dev;
        Dash_QA_Req.Text = qa;
        Dash_UAT_Req.Text = uat;
        Dash_App_Req.Text = app;
        Dash_Complete_Req.Text = dep;
        Dash_Reject_Req.Text = rej;
        User_New_Req.Text = new_req2;
        User_Auth_Req.Text = auth2; 
        User_Complete_Req.Text = create;
        User_Reject_Req.Text = reject;



    }



    [WebMethod]
    public static List<object> GetChartData()
    {
        string query = "SELECT Status, COUNT(Change_ID) TotalOrders";
        query += " FROM Change GROUP BY Status";
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
        query += " FROM User_Request GROUP BY Status";
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

    protected void Add_Application(object sender, EventArgs e)
    {
        input1.Add_Application(Txt_App.Text);
        // input1.RejectChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Rejected");
        Response.Redirect("~/Admin_Dash_1.aspx");

    }

    protected void Add_Department(object sender, EventArgs e)
    {
        input1.Add_Department(TxtDep.Text,TxtLoc.Text);
        // input1.RejectChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Rejected");
        Response.Redirect("~/Admin_Dash_1.aspx");

    }

    protected void Add_ChangeType(object sender, EventArgs e)
    {
        input1.Add_ChangeType(TxtType.Text);
        // input1.RejectChange(Convert.ToInt16(Session["User_ID"]), Convert.ToInt16(Session["id"]), "Rejected");
        Response.Redirect("~/Admin_Dash_1.aspx");

    }


    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            int app_id = Convert.ToInt16(e.CommandArgument);
            input1.Inactive_Application(app_id);
        }

        if (e.CommandName == "Active")
        {
            int app_id = Convert.ToInt16(e.CommandArgument);
            input1.Active_Application(app_id);
        }

        Response.Redirect("~/Admin_Dash_1.aspx");
    }

    protected void GridView2_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            int dep_id = Convert.ToInt16(e.CommandArgument);
            input1.Inactive_Department(dep_id);
        }

        if (e.CommandName == "Active")
        {
            int dep_id = Convert.ToInt16(e.CommandArgument);
            input1.Activate_Department(dep_id);
        }

        Response.Redirect("~/Admin_Dash_1.aspx");
    }

    protected void GridView3_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            int type = Convert.ToInt16(e.CommandArgument);
            input1.Inactive_ChangeType(type);
        }

        if (e.CommandName == "Active")
        {
            int type = Convert.ToInt16(e.CommandArgument);
            input1.Activate_ChangeType(type);
        }

        Response.Redirect("~/Admin_Dash_1.aspx");
    }
}