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

public partial class User_Verification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int count;
        string USEREMAIL = Request.QueryString["Email"];
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("select count(*) from tblUsers where Email='" + USEREMAIL + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        if (count != 0)
        {
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Update tblUsers set Activated=1 where Email=@Email"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    cmd.Parameters.AddWithValue("@Email", USEREMAIL);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}
