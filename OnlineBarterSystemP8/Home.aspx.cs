using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearchUser_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("Select Name from tblUsers where Name='" + tbxSearchUser.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                //Respone.Redirect("Users.aspx");
            }
        }
    }
    protected void btnSearchSkill_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("Select Skill from tblSkills where Skill='" + tbxSearchSkill.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                //Respone.Redirect("Skills.aspx");
            }
        }
    }
}