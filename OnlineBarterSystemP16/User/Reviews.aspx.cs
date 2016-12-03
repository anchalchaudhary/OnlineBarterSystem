using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class User_Reviews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserId"]!=null)
        {
            int providerId = Convert.ToInt32(Session["ProviderId"]);
            int skillId = Convert.ToInt32(Session["SkillReviewed"]);
            int count =0;
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("select count(*) from tblReviews where ReviewedUserId=@ReviewedUserId and ReviewedSkillId=@ReviewedSkillID"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    cmd.Parameters.AddWithValue("@ReviewedUserId", providerId);
                    cmd.Parameters.AddWithValue("@ReviewedSkillID", skillId);
                    count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                }
            }
            if (count == 0)
            {
                lblMessage.Text= "No Reviews Till now";
                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "5;url=ProviderProfile.aspx";
                this.Page.Controls.Add(meta);
            }
            RepeaterReviews.DataSource = GetReviews("Select u.Name,r.Review from tblUsers as u inner join tblReviews as r on r.ReviewerId=u.Id where ReviewedUserId = "+ providerId+" and ReviewedSkillId = "+ skillId + "");
            RepeaterReviews.DataBind();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected static DataTable GetReviews(string query)
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = query;
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = connect;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }
}