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
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected DataSet GetData()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from tblUsers where Id='" + Convert.ToInt32(Session["ProviderId"]) + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            imgProfile.ImageUrl = "../User/Handler.ashx?imgID=" + Session["ProviderId"];
            return ds;
        }
    }

    protected DataSet GetSkills()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        int count = 0;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select s.Id,s.SkillName,m.SkillDetails,m.Rating from tblUserSkillMapping as m inner join tblSkills as s on m.SkillId=s.Id where UserId='" + Convert.ToInt32(Session["ProviderId"]) + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
    protected void SkillSelecting(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "RequestSkill")
        {
            ((Label)e.Item.FindControl("lblRequested")).Visible = true;
            ((Label)e.Item.FindControl("lblRequested")).Text = "Requested";
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
            int count = 0;
            using (SqlConnection connect = new SqlConnection(str))
            {
                using (SqlCommand cmd = new SqlCommand("Select count(*) from tblUserFollowMapping where FollowerId=@FollowerId and FollowedId=@FollowedId and SkillId=@SkillId"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    cmd.Parameters.AddWithValue("@FollowerId", Convert.ToInt32(Session["UserId"]));
                    cmd.Parameters.AddWithValue("@FollowedId", Convert.ToInt32(Session["ProviderId"]));
                    cmd.Parameters.AddWithValue("@SkillId", NeedId);
                    count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    connect.Close();
                }
            }
            if (count == 0)
            {

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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Request has Been Send to the Provider')", true);

                string subject = "Barter System";

                string body = "Hello " + ProviderEmail + ",";
                body += "<br />You were requested by " + RequestedName + " . <br />Visit our WebSite to confirm the request.";
                body += "<br /><br />Thanks";

                Mail.Send_Mail(ProviderEmail, body, subject);
                lblInfo.Text = "Requested";
            }
            else
            {
                lblInfo.Text = "You have already requested for this skill from this user";
            }
        }
        else if (e.CommandName == "Show_Reviews")
        {

            int ID = Convert.ToInt32(e.CommandArgument.ToString());
            Session["SkillReviewed"] = ID;
            Response.Redirect("Reviews.aspx");
        }
    }

    protected void RepeaterProfile_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Apply")
        {
            byte[] bytes = (byte[])GetProfilePhoto("SELECT ProfilePicture FROM tblUsers WHERE Id =" + Convert.ToInt32(Session["UserId"])).Rows[0]["ProfilePicture"];
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            ((Image)e.Item.FindControl("imgProfile")).ImageUrl = "data:image/png;base64," + base64String;
        }
    }
    protected DataTable GetProfilePhoto(string query)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }

    protected void btnMessage_Click(object sender, EventArgs e)
    {
        Session["MessageToId"] = Session["ProviderId"];
        Response.Redirect("Message.aspx");
    }
}