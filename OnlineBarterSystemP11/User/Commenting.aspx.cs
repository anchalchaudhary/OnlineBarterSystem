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
            Session["UserId"] = 30;
            if (Session["UserId"] != null)
            {
                DataSet ds = GetComments();
                RepeaterComment.DataSource = ds;
                RepeaterComment.DataBind();

                //ds = GetReplys();
                //RepeaterReply.DataSource = ds;
                //RepeaterReply.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    protected DataSet GetComments()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select c.Id,c.Comment,c.Likes,u.Name from tblComments as c inner join tblUsers as u on u.Id=c.SenderId", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    protected DataSet GetReplys()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select Reply from tblReply",connect);
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
        DataSet ds = GetComments();
        RepeaterComment.DataSource = ds;
        RepeaterComment.DataBind();


    }
    //protected void Like(object sender,EventArgs e)
    //{

    //}
    //protected void UnLike(object sender,EventArgs e)
    //{

    //}
    protected void RepeaterReply(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName=="reply")
        {
            Repeater rptComment = (Repeater)e.Item.FindControl("RepeaterComment");
            ((TextBox)e.Item.FindControl("tbxReply")).Visible = true;
            ((LinkButton)e.Item.FindControl("btnReply")).Visible = false;
            ((LinkButton)e.Item.FindControl("btnPost")).Visible = true;
            
        }
        else if(e.CommandName=="post")
        {
            string reply = ((TextBox)e.Item.FindControl("tbxReply")).Text;
            ((TextBox)e.Item.FindControl("tbxReply")).Visible = false;
            ((LinkButton)e.Item.FindControl("btnPost")).Visible = false;
            ((LinkButton)e.Item.FindControl("btnReply")).Visible = true;
            if(string.Compare(reply,"")!=0)
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
                    cmd.Parameters.AddWithValue("@Reply",reply);
                    cmd.ExecuteNonQuery();
                    connect.Close();
                    tbxComment.Text = "";
                }
            }
        }
        else if(e.CommandName=="like")
        {
            ((ImageButton)e.Item.FindControl("btnLike")).Visible = false;
            ((ImageButton)e.Item.FindControl("btnUnLike")).Visible = true;

        }
        else if(e.CommandName=="Unlike")
        {
            ((ImageButton)e.Item.FindControl("btnUnLike")).Visible = false;
            ((ImageButton)e.Item.FindControl("btnLike")).Visible = true;
        }
    }

}

