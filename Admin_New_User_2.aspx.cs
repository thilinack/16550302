using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration; // this namespace

public partial class New_Request_2 : System.Web.UI.Page
{
    Inputs input1 = new Inputs();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["SUser_Label_Heading"] = "Request Details";
        Session["Scrumble1_Heading"] = "New Request";
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {


        String Priority = "";
        if (Rd_high.Checked)
        {
            Priority = "High";
        }
        else if (rd_low.Checked)
        {
            Priority = "Low";
        }
        else if (rd_medium.Checked)
        {
            Priority = "Medium";
        }

     

       int User_Creation_ID= input1.InsertUserCreation(TextBox_Des.Text, Priority, "New Request", Convert.ToInt16(DropDownApplication.SelectedValue), Convert.ToInt16(DropDownDep.SelectedValue),txtfname.Text,txtlname.Text,txtoname.Text,Convert.ToInt16(txtempno.Text),txtdesignation.Text,DrpdwnRequestType.SelectedValue);
      
    }

    protected void SqlDataSource_ReqType_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}
