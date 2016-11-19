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

public partial class AccountConfirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnActivate_Click(object sender, EventArgs e)
    {
        string checkCode;
        int userId;
        if (Session["Activate Account"] != null)
        {
            string emailActivated = Session["Activate Account"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Select Id from tblUsers where Email='" + emailActivated + "'"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    connect.Close();
                }
                using (SqlCommand cmd = new SqlCommand("Select ActivationCode from tblUsers where Email='" + emailActivated + "'"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    checkCode = cmd.ExecuteScalar().ToString();
                    connect.Close();
                }

                if (checkCode == tbxActivate.Text)
                {
                    using (SqlCommand cmdActivated = new SqlCommand("insert into tblActivation(UserId, Activated) values (@UserId, @Activated)"))
                    {
                        cmdActivated.Connection = connect;
                        connect.Open();
                        cmdActivated.Parameters.AddWithValue("@UserId", userId);
                        cmdActivated.Parameters.AddWithValue("@Activated", "Yes");
                        cmdActivated.ExecuteNonQuery();
                    }
                }
            }
            Session["Activate Account"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}