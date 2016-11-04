using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
[System.Web.Script.Services.ScriptMethod()]
[System.Web.Services.WebMethod]

public partial class AddSkills : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tbxGenreName.Enabled = false;
        if (!this.IsPostBack)
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
            ddlGenre.Items.Insert(1, new ListItem("Other", "0"));
        }
    }
    protected void ddlGenre_SelectedIndexChange(object sender, EventArgs e)
    {
        if (ddlGenre.SelectedItem.Text == "Other")
            tbxGenreName.Enabled = true;
        else
            tbxGenreName.Enabled = false;
    }

    protected void btnSubmit_click(object sender, EventArgs e)
    {
        int skillCount = 0;
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblSkills where SkillName='" + tbxEnterSkill.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                skillCount = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            }
        }
        if (skillCount == 0) //to add skill to tblSkills if not present
        {
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmdAddSkill = new SqlCommand("INSERT INTO tblSkills (SkillName, GenreId) values (@SkillName, @GenreId)"))
                {
                    cmdAddSkill.Connection = connect;
                    connect.Open();
                    cmdAddSkill.Parameters.AddWithValue("@SkillName", tbxEnterSkill.Text);
                    cmdAddSkill.Parameters.AddWithValue("@GenreId", ddlGenre.SelectedValue);
                    cmdAddSkill.ExecuteNonQuery();
                }
            }
        }
    }
        
        public static List<string> Get_Skills(string prefixText, int count)
        {
            using (SqlConnection connect = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select SkillName from tblSkills where SkillName like @SkillName + '%'";
                    cmd.Parameters.AddWithValue("@SkillName", prefixText);
                    cmd.Connection = connect;
                    connect.Open();
                    List<string> Skills = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            Skills.Add(sdr["SkillName"].ToString());
                        }
                    }
                    conn.Close();
                    return Skills;
                }
            }
        }
    }
