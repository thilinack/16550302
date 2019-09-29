using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;



public partial class Report_1 : System.Web.UI.Page
{
    Outputs out1 = new Outputs();
    protected void Page_Load(object sender, EventArgs e)
    {
        String  Summary,   Creation_Date,   Priotity,   Status,   Type,   Application,   Requested_By,   Authorized_By,   Analyzed_By,   Developed_By,   QA_By,   UAT_By,   Approve_By,   Deploy_By,   Description,   ba_date,   dev_date,qa_date,uat_date,dep_date,app_date,auth_date;
        int? ba_id, dev_id, qa_id, uat_id, app_id, dep_id;
        out1.getallchangedetails(out Summary, out Creation_Date, out Priotity, out Status, out Type, out Application, out Requested_By, out Authorized_By, out Analyzed_By, out Developed_By, out QA_By, out UAT_By, out Approve_By, out Deploy_By, out Description, out ba_date, out dev_date,out qa_date,out uat_date, out dep_date,out app_date, out auth_date, out ba_id, out dev_id, out qa_id, out uat_id, out app_id, out dep_id, Convert.ToInt16(Session["id"]));
        lblchangeID.Text = Session["id"].ToString();
        lblpriority.Text = Priotity;
        lblreqdate.Text = Creation_Date;
        lblreqtype.Text = Type;
        lblreqby.Text = Requested_By;
        lblauthby.Text = Authorized_By;
        lblsummery.Text = Summary;
        lbldes.Text = Description;
        lblapplication.Text = Application;
        lblbaby.Text = Analyzed_By;
        lblbadate.Text = ba_date;
        lbldevby.Text = Developed_By;
        lbldevdate.Text = dev_date;
        lblqaby.Text = QA_By;
        lblqadate.Text = qa_date;
        lbluatby.Text = UAT_By;
        lblappby.Text = Approve_By;
        lbluatdate.Text = uat_date;
       
        lblappdate.Text = app_date;
        lbldepby.Text = Deploy_By;
        lbldepdate.Text = dep_date;
        lblauthdate.Text = auth_date;
        SqlDataSourceBAComments.SelectParameters["change_id"].DefaultValue = Session["id"].ToString();
        SqlDataSourceBAComments.SelectParameters["userid"].DefaultValue = ba_id.ToString();
        DataList1.DataBind();
        SqlDataSourceDevComments.SelectParameters["change_id"].DefaultValue = Session["id"].ToString();
        SqlDataSourceDevComments.SelectParameters["userid"].DefaultValue = dev_id.ToString();
        DataListDevCmnt.DataBind();
        SqlDataSourceQAComments.SelectParameters["change_id"].DefaultValue = Session["id"].ToString();
        SqlDataSourceQAComments.SelectParameters["userid"].DefaultValue = qa_id.ToString();
        DataListQACmnt.DataBind();
        SqlDataSourceUATComments.SelectParameters["change_id"].DefaultValue = Session["id"].ToString();
        SqlDataSourceUATComments.SelectParameters["userid"].DefaultValue = uat_id.ToString();
        DataListUATCmnt.DataBind();
        SqlDataSourceAppComments.SelectParameters["change_id"].DefaultValue = Session["id"].ToString();
        SqlDataSourceAppComments.SelectParameters["userid"].DefaultValue = app_id.ToString();
        DataListAppCmnt.DataBind();
        SqlDataSourceDeployComments.SelectParameters["change_id"].DefaultValue = Session["id"].ToString();
        SqlDataSourceBAComments.SelectParameters["userid"].DefaultValue = dep_id.ToString();
        DataListDeployCmnt.DataBind();
    }


}