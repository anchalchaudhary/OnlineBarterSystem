using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

public partial class User_ForgotPassword : System.Web.UI.Page
{
    string changePasswordUrl;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void SendMail(object sender, EventArgs e)
    {
        int UserId = 0;
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("select Id from tblUsers where Email='" + tbxEmail.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                UserId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
        if (UserId != 0)
            changePasswordUrl = "http://localhost:49614/User/ChangePassword.aspx?UserId=" + UserId + "&Email=" + Hash.Encrypt_Password(tbxEmail.Text);
        try
        {

            string subject = "Barter System";

            string body = "<a href='" + changePasswordUrl + "'>Click Here to change your password</a>";

            Mail.Send_Mail(tbxEmail.Text.Trim(), body, subject);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Link has been sent to you in Email.')", true);
            //Response.Redirect("Login.aspx");
        }
        catch(Exception except)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Unable to send you the Link. Check your Internet Connection')", true);
        }
    }
}