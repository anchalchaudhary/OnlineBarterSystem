using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_ChangePassword : System.Web.UI.Page
{
    string USEREMAIL = "";
    protected void Page_Load(object sender, EventArgs e)
    {
         USEREMAIL = Request.QueryString["Email"];
        
    }
    protected void Change(object sender,EventArgs e)
    {
        string encrytedPassword = Hash.Encrypt_Password(tbxPassword.Text);
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("update tblUsers set Password=@Password where Email='" + USEREMAIL + "'"))
            {
                cmd.Connection = connect;
                cmd.Parameters.AddWithValue("@Password", encrytedPassword);
                connect.Open();
                cmd.ExecuteNonQuery();
                connect.Close();
            }
        }
        Response.Redirect("Login.aspx");
    }
}