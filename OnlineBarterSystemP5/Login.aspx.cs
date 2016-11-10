using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["UserLogin"] = null;
        lblIncorrectEmail.Visible = false;
        lblIncorrectPassword.Visible = false;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        int count = 0;
        string encrytedPassword="";
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblUsers where Email='" + tbxEmail.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            }
        }
        encrytedPassword = Hash.Encrypt_Password(tbxPassword.Text);
        if (count != 0)
        {
            using (SqlConnection connect1 = new SqlConnection(connString))
            {
                SqlCommand cmdPassword = new SqlCommand("Select Password from tblUsers where Email='" + tbxEmail.Text + "'");
                cmdPassword.Connection = connect1;
                connect1.Open();
                string checkPassword = cmdPassword.ExecuteScalar().ToString();
                connect1.Close();
                //if (checkPassword == tbxPassword.Text)
                if (checkPassword == encrytedPassword)
                {
                    SqlCommand cmdName = new SqlCommand("Select Id from tblUsers where Email='" + tbxEmail.Text + "'");
                    cmdName.Connection = connect1;
                    connect1.Open();
                    int userId = Convert.ToInt32(cmdName.ExecuteScalar().ToString());
                    Session["UserLogin"] = userId;
                    Response.Redirect("Logout.aspx");
                }
                else
                {
                    lblIncorrectPassword.Visible = true;
                    Session["UserLogin"] = null;
                }
            }
        }
        else
        {
            lblIncorrectEmail.Visible = true;
            Session["UserLogin"] = null;
        }
        Response.Redirect("HomePage.aspx");
    }
}