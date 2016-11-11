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
        Session["Email"] = null;
        lblIncorrectEmail.Visible = false;
        lblIncorrectPassword.Visible = false;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        int count = 0;
        int userId;
        string encrytedPassword = "";
        string activated;
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblUsers where Email='" + tbxEmail.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                connect.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Select Id from tblUsers where Email='" + tbxEmail.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                connect.Close();
            }
            using (SqlCommand cmd = new SqlCommand("Select Activated from tblActivation where UserId='" + userId + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                activated = cmd.ExecuteScalar().ToString();
            }
        }

        encrytedPassword = Hash.Encrypt_Password(tbxPassword.Text);
        if (count != 0 && activated != "")
        {
            using (SqlConnection connect1 = new SqlConnection(connString))
            {
                SqlCommand cmdPassword = new SqlCommand("Select Password from tblUsers where Email='" + tbxEmail.Text + "'");
                cmdPassword.Connection = connect1;
                connect1.Open();
                string checkPassword = cmdPassword.ExecuteScalar().ToString();
                connect1.Close();
                if (checkPassword == encrytedPassword)
                {
                    SqlCommand cmdName = new SqlCommand("Select Name from tblUsers where Email='" + tbxEmail.Text + "'");
                    cmdName.Connection = connect1;
                    connect1.Open();
                    string userName = cmdName.ExecuteScalar().ToString();
                    Session["UserLogin"] = userName;
                    Response.Redirect("AddSkills.aspx");
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
        using (SqlConnection connect1 = new SqlConnection(connString))
        {
            SqlCommand cmd = new SqlCommand("Select Email from tblUsers where Email='" + tbxEmail.Text + "'");
            cmd.Connection = connect1;
            connect1.Open();
            string userEmail = cmd.ExecuteScalar().ToString();
            Session["Email"] = userEmail;
        }
    }
}