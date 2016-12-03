using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Commenting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                RepeaterComment.DataSource = GetComments("Select c.Id,c.Comment,c.Likes,u.Name,u.Image from tblComments as c inner join tblUsers as u on u.Id=c.SenderId order by c.Id desc");
                RepeaterComment.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    protected static DataTable GetComments(string query)
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

    protected DataSet GetReplys()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select Reply from tblReply", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    protected void Comment_Click(object sender, EventArgs e)
    {
        string comment = tbxComment.Text;
        int SenderId = Convert.ToInt32(Session["UserId"]);
        if (string.Compare(comment, "") != 0)
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString);
            string getFields = "insert into tblComments(SenderId,Comment) values(@SenderId,@Comment)";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            cmd.Parameters.AddWithValue("@SenderId", SenderId);
            cmd.Parameters.AddWithValue("@Comment", tbxComment.Text);
            cmd.ExecuteNonQuery();
            connect.Close();
            tbxComment.Text = "";
        }
        RepeaterComment.DataSource = GetComments("Select c.Id,c.Comment,c.Likes,u.Name,u.Image from tblComments as c inner join tblUsers as u on u.Id=c.SenderId");
        RepeaterComment.DataBind();

        Response.Redirect("Commenting.aspx");
    }

    protected void BoundReply(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string Id = ((Label)e.Item.FindControl("lblCommentId")).Text;
            Repeater RepeaterReply = e.Item.FindControl("RepeaterReply") as Repeater;
            RepeaterReply.DataSource = GetComments(string.Format("SELECT r.ReplyedOnCommentId,r.ReplyerId,r.Reply,u.Name,u.Image FROM tblReply as r inner join tblUsers as u on r.ReplyerId=u.Id WHERE ReplyedOnCommentId='{0}'", Id));
            RepeaterReply.DataBind();
        }
    }



    //protected void Like(object sender,EventArgs e)
    //{

    //}
    //protected void UnLike(object sender,EventArgs e)
    //{

    //}
    protected void RepeaterReply(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "reply")
        {
            Repeater rptComment = (Repeater)e.Item.FindControl("RepeaterComment");
            //((Image)e.Item.FindControl("imgCommentImage")).ImageUrl = "../User/Handler.ashx?imgID=" + Session["UserId"];
            ((TextBox)e.Item.FindControl("tbxReply")).Visible = true;
            ((LinkButton)e.Item.FindControl("btnReply")).Visible = false;
            ((LinkButton)e.Item.FindControl("btnPost")).Visible = true;

        }
        else if (e.CommandName == "post")
        {
            string reply = ((TextBox)e.Item.FindControl("tbxReply")).Text;
            ((TextBox)e.Item.FindControl("tbxReply")).Visible = false;
            ((LinkButton)e.Item.FindControl("btnPost")).Visible = false;
            ((LinkButton)e.Item.FindControl("btnReply")).Visible = true;
            if (string.Compare(reply, "") != 0)
            {
                int ReplyerId = Convert.ToInt32(Session["UserId"]);
                int CommentId = Convert.ToInt32(((Label)e.Item.FindControl("lblCommentId")).Text);
                if (string.Compare(reply, "") != 0)
                {
                    SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString);
                    string getFields = "insert into tblReply(ReplyedOnCommentId,ReplyerId,Reply) values(@ReplyedOnCommentId,@ReplyerId,@Reply)";
                    SqlCommand cmd = new SqlCommand(getFields, connect);
                    connect.Open();
                    cmd.Parameters.AddWithValue("@ReplyedOnCommentId", CommentId);
                    cmd.Parameters.AddWithValue("@ReplyerId", ReplyerId);
                    cmd.Parameters.AddWithValue("@Reply", reply);
                    cmd.ExecuteNonQuery();
                    connect.Close();
                    tbxComment.Text = "";
                    Response.Redirect("Commenting.aspx");
                }
            }
        }
        else if (e.CommandName == "like")
        {
            ((ImageButton)e.Item.FindControl("btnLike")).Visible = false;
            ((ImageButton)e.Item.FindControl("btnUnLike")).Visible = true;

        }
        else if (e.CommandName == "Unlike")
        {
            ((ImageButton)e.Item.FindControl("btnUnLike")).Visible = false;
            ((ImageButton)e.Item.FindControl("btnLike")).Visible = true;
        }
    }

}

