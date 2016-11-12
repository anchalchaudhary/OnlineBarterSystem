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
            //if (Session["UserLogin"] != null)
            //{
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

            //}
        }
    }



    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> Get_Genre(string prefixText, int count)
    {
        using (SqlConnection connect = new SqlConnection())
        {
            connect.ConnectionString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Genre from tblGenre where Genre like @Genre + '%'";
                cmd.Parameters.AddWithValue("@Genre", prefixText);
                cmd.Connection = connect;
                connect.Open();
                List<string> Genre = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        Genre.Add(sdr["Genre"].ToString());
                    }
                }
                connect.Close();
                return Genre;
            }
        }
    }

    protected void ddlSkills_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSearchGener.Text = "" + ddlSkills.SelectedValue;
        Response.Write(ddlSkills.SelectedValue);
    }

    protected void tbxEnterGener_TextChanged(object sender, EventArgs e)
    {
        string genre = tbxEnterGener.Text;
        if (string.Compare(genre,"")==0)
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
    protected void SearchProvider(object sender,EventArgs e)
    {

    }
}
    