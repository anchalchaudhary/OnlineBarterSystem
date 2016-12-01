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

public partial class SearchSkills : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (Session["UserLogin"] != null)
            {
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
                
                using (SqlConnection connect = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT Id, Genre FROM tblGenre"))
                    {
                        cmd.Connection = connect;
                        connect.Open();
                        ddlGenre.DataSource = cmd.ExecuteReader();
                        ddlGenre.DataTextField = "Genre";
                        ddlGenre.DataValueField = "Id";
                        ddlGenre.DataBind();
                        connect.Close();
                    }
                }

                ddlGenre.Items.Insert(0, new ListItem("Select", "-1"));
                using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Id, SkillName FROM tblSkills"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    ddlSkills.DataSource = cmd.ExecuteReader();
                    ddlSkills.DataTextField = "SkillName";
                    ddlSkills.DataValueField = "Id";
                    ddlSkills.DataBind();
                    connect.Close();
                }
            }
                ddlSkills.Items.Insert(0, new ListItem("Select", "-1"));
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }



    //[System.Web.Script.Services.ScriptMethod()]
    //[System.Web.Services.WebMethod]
    //public static List<string> Get_Genre(string prefixText, int count)
    //{
    //    using (SqlConnection connect = new SqlConnection())
    //    {
    //        connect.ConnectionString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "select Genre from tblGenre where Genre like @Genre + '%'";
    //            cmd.Parameters.AddWithValue("@Genre", prefixText);
    //            cmd.Connection = connect;
    //            connect.Open();
    //            List<string> Genre = new List<string>();
    //            using (SqlDataReader sdr = cmd.ExecuteReader())
    //            {
    //                while (sdr.Read())
    //                {
    //                    Genre.Add(sdr["Genre"].ToString());
    //                }
    //            }
    //            connect.Close();
    //            return Genre;
    //        }
    //    }


    protected void tbxEnterGener_TextChanged(object sender, EventArgs e)
    {
        string genre = ddlGenre.SelectedItem.ToString();
        if (string.Compare(genre, "") == 0)
        {
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Id, SkillName FROM tblSkills"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    ddlSkills.DataSource = cmd.ExecuteReader();
                    ddlSkills.DataTextField = "SkillName";
                    ddlSkills.DataValueField = "Id";
                    ddlSkills.DataBind();
                    connect.Close();
                }
            }

            ddlSkills.Items.Insert(0, new ListItem("Select", "-1"));
        }
        else
        {
            int count = 0;
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Select count(*) from tblGenre where Genre='" + genre + "'"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                }
            }
            int genreId;
            if (count != 0)
            {
                using (SqlConnection connect = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("Select Id from tblGenre where Genre='" + genre + "'"))
                    {
                        cmd.Connection = connect;
                        connect.Open();
                        genreId = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    }
                }
                using (SqlConnection connect = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT Id, SkillName FROM tblSkills where GenreId='" + genreId + "'"))
                    {
                        cmd.Connection = connect;
                        connect.Open();
                        ddlSkills.DataSource = cmd.ExecuteReader();
                        ddlSkills.DataTextField = "SkillName";
                        ddlSkills.DataValueField = "Id";
                        ddlSkills.DataBind();
                        connect.Close();
                    }
                }
            }
        }
    }
    protected void SearchProvider(object sender, EventArgs e)
    {
        DataSet ds = GetData();
        RepeaterComment.DataSource = ds;
        RepeaterComment.DataBind();
    }
    protected DataSet GetData()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        int userId = 0;
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("Select UserId from tblUserSkillMapping where SkillId='" + ddlSkills.SelectedValue + "'"))
            {
                try
                {
                    cmd.Connection = connect;
                    connect.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    lblInfo.Text = "";
                }
                catch (Exception except)
                {
                    lblInfo.Text = "No Provider Available";
                }
            }
        }
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select u.Name,u.Email, s.Rating from tblUserSkillMapping as s inner join tblUsers as u on u.Id=s.UserId where SkillId='" + ddlSkills.SelectedValue + "'", connect);//"Select * from tblUsers where Id='"+ userId + "'"  CHANGE IN REPEATER
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
    protected void RepeaterLink(object source, RepeaterCommandEventArgs e)
    {
        string customerEmail = ((LinkButton)e.CommandSource).Text;
        int customer = 0;
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Id FROM tblUsers where Email='" + customerEmail + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                customer = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                connect.Close();
            }
        }
        Session["ProviderId"] = customer;
        Response.Redirect("ProviderProfile.aspx");
    }
}
