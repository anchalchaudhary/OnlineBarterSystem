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
public partial class ProviderProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
        {
            DataSet ds = GetData();
            RepeaterProfile.DataSource = ds;
            RepeaterProfile.DataBind();

            ds = GetSkills();
            RepeaterSkills.DataSource = ds;
            RepeaterSkills.DataBind();
        }
        else
            Response.Redirect("Login.aspx");
    }
    protected DataSet GetData()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from tblUsers where Id='" + Convert.ToInt32(Session["ProviderId"]) + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    protected DataSet GetSkills()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select s.SkillName,m.SkillDetails,m.Rating from tblUserSkillMapping as m inner join tblSkills as s on m.SkillId=s.Id where UserId='" + Convert.ToInt32(Session["ProviderId"]) + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
    protected void SkillSelecting(object source, RepeaterCommandEventArgs e)
    {
        string Need = ((LinkButton)e.CommandSource).Text;
        int NeedId = 0;
        string ProviderEmail = "";
        string RequestedName = "";
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("Select Id from tblSkills where SkillName='" + Need + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                NeedId = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                connect.Close();
            }
        }
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("Select Email from tblUsers where Id='" + Convert.ToInt32(Session["ProviderId"]) + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                ProviderEmail = (cmd.ExecuteScalar().ToString());
                connect.Close();
            }
        }
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("Select Name from tblUsers where Id='" + Convert.ToInt32(Session["UserId"]) + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                RequestedName = cmd.ExecuteScalar().ToString();
                connect.Close();
            }
        }
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("Insert into tblUserFollowMapping(FollowerId,FollowedId,SkillId) values(@FollowerId,@FollowedId,@SkillId)"))
            {
                cmd.Connection = connect;
                connect.Open();
                cmd.Parameters.AddWithValue("@FollowerId", Convert.ToInt32(Session["UserId"]));
                cmd.Parameters.AddWithValue("@FollowedId", Convert.ToInt32(Session["ProviderId"]));
                cmd.Parameters.AddWithValue("@SkillId", NeedId);
                cmd.ExecuteNonQuery();
                connect.Close();
            }
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Request has Been Sent to the Provider')", true);

        string subject = "Barter System";

        string body = "Hello " + ProviderEmail + ",";
        body += "<br />You Been Requested by " + RequestedName + " . <br />Visit our WebSite to confirm the request.";
        body += "<br /><br />Thanks";

        Mail.Send_Mail(ProviderEmail, body, subject);
        lblInfo.Text = "Requested";
    }
    protected void lblLogout_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = null;
        Response.Redirect("Login.aspx");
    }

}