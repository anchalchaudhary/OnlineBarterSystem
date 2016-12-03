using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            int recieverId = Convert.ToInt32(Session["MessageToId"]);
            RepeaterMessages.DataSource = GetMessages("Select m.Message,u.Name from tblMessage as m inner join tblUsers as u on m.senderId=u.Id where (senderId = " + userId + " and recieverId = " + recieverId + ") or (senderId = " + recieverId + " and recieverId = "+userId+" )");
            RepeaterMessages.DataBind();
            imgYou.ImageUrl = "../User/Handler.ashx?imgID=" + Session["UserId"];
            imgReciever.ImageUrl = "../User/Handler.ashx?imgID=" + Session["MessageToId"];

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected static DataTable GetMessages(string query)
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
    protected void SendMessage(object sender,EventArgs e)
    {
        string message = tbxMessage.Text;
        int SenderId = Convert.ToInt32(Session["UserId"]);
        int recieverId = Convert.ToInt32(Session["MessageToId"]);
        if (string.Compare(message, "") != 0)
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString);
            string getFields = "insert into tblMessage(senderId,recieverId,Message) values(@senderId,@recieverId,@Message)";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            cmd.Parameters.AddWithValue("@senderId", SenderId);
            cmd.Parameters.AddWithValue("@recieverId", recieverId);
            cmd.Parameters.AddWithValue("@Message", tbxMessage.Text);
            cmd.ExecuteNonQuery();
            connect.Close();
            tbxMessage.Text = "";
            Response.Redirect("Message.aspx");
        }
    }
}