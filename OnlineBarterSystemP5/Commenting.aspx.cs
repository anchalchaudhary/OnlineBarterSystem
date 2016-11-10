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
            DataSet ds = GetData();
            RepeaterComment.DataSource = ds;
            RepeaterComment.DataBind();
        }
    }

    protected DataSet GetData()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from Commenting", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    protected void Comment_Click(object sender, EventArgs e)
    {
        string comment = tbxComment.Text;
        string senderName = (Session["UserLogin"]).ToString();
        if (string.Compare(comment, "") != 0)
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString);
            string getFields = "insert into Commenting(Sender,Comment) values(@Sender,@Comment)";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            cmd.Parameters.AddWithValue("@Sender", senderName);
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

