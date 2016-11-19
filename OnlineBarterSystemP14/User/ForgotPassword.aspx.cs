using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ForgotPassword : System.Web.UI.Page
{
    string changePasswordUrl;
    protected void Page_Load(object sender, EventArgs e)
    {
        changePasswordUrl = "http://localhost:55485/User/ChangePassword.aspx?Email=" + tbxEmail.Text;
    }

    protected void SendMail(object sender, EventArgs e)
    {
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
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Unable to send you the Link.<br/>Check your Internet Connection')", true);
        }
    }
}