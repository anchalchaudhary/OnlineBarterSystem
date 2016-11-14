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
                DataSet ds = GetData();
                RepeaterComment.DataSource = ds;
                RepeaterComment.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    protected DataSet GetData()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select c.Comment,c.Likes,u.Name from tblComments as c inner join tblUsers as u on u.Id=c.SenderId", connect);
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
        DataSet ds = GetData();
        RepeaterComment.DataSource = ds;
        RepeaterComment.DataBind();


    }
}

