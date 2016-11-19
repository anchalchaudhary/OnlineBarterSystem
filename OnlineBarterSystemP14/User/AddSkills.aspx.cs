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
using BarterSystem;

//check without save button
public partial class AddSkills : System.Web.UI.Page
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
                int genreCount;
                using (SqlConnection connect = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT count(*) FROM tblGenre"))
                    {
                        cmd.Connection = connect;
                        connect.Open();
                        genreCount = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    }
                }
                ddlGenre.Items.Insert(0, new ListItem("Select", "-1"));
                //ddlGenre.Items.Insert(genreCount + 1, new ListItem("Other", "0"));
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
    protected void ddlGenre_SelectedIndexChange(object sender, EventArgs e)
    {
        if (ddlGenre.SelectedItem.Text == "Other")
        { 
            //MpeAddGenre.Show();
        }
        //else if(Convert.ToInt32(Session["GenreAdded"])==1)
        //{
        //    Session["GenreAdded"] = 0;
        //    string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        //    using (SqlConnection connect = new SqlConnection(connString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("SELECT Id, Genre FROM tblGenre"))
        //        {
        //            cmd.Connection = connect;
        //            connect.Open();
        //            ddlGenre.DataSource = cmd.ExecuteReader();
        //            ddlGenre.DataTextField = "Genre";
        //            ddlGenre.DataValueField = "Id";
        //            ddlGenre.DataBind();
        //            connect.Close();
        //        }
        //    }
        //    int genreCount;
        //    using (SqlConnection connect = new SqlConnection(connString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("SELECT count(*) FROM tblGenre"))
        //        {
        //            cmd.Connection = connect;
        //            connect.Open();
        //            genreCount = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        //        }
        //    }
        //    ddlGenre.Items.Insert(0, new ListItem("Select", "-1"));
        //    ddlGenre.Items.Insert(genreCount + 1, new ListItem("Other", "0"));
        //}
    }

    protected void btnAddSkill_click(object sender, EventArgs e)
    {
        int skillCount = 0, genreId = 0;

        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblSkills where SkillName='" + tbxEnterSkill.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                skillCount = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            }
            if (ddlGenre.SelectedValue == "Other")
            {
                using (SqlCommand cmd = new SqlCommand("Select Id from tblGenre where Genre='" + ddlGenre.SelectedItem.Text + "'"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    genreId = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                }
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
                    if (genreId == 0)
                    {
                        cmdAddSkill.Parameters.AddWithValue("@GenreId", ddlGenre.SelectedValue);
                        cmdAddSkill.ExecuteNonQuery();
                    }
                    else
                    {
                        cmdAddSkill.Parameters.AddWithValue("@GenreId", genreId);
                        cmdAddSkill.ExecuteNonQuery();
                    }
                }
            }
        }

        int userId, skillId,count;

        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("Select Id from tblUsers where Id='" + Convert.ToInt32(Session["UserId"]) + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                connect.Close();
            }
            using (SqlCommand cmd = new SqlCommand("Select Id from tblSkills where SkillName='" + tbxEnterSkill.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                skillId = Convert.ToInt32(cmd.ExecuteScalar());
                connect.Close();
            }
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblUserSkillMapping where SkillId=@SkillId and UserId=@UserId"))
            {
                cmd.Connection = connect;
                connect.Open();
                cmd.Parameters.AddWithValue("@SkillId",skillId);
                cmd.Parameters.AddWithValue("@UserId", userId);
                count = Convert.ToInt32(cmd.ExecuteScalar());
                connect.Close();
            }
            if (count == 0)
            {
                using (SqlCommand cmdMapSkill = new SqlCommand("INSERT INTO tblUserSkillMapping (UserId, SkillId, SkillDetails) values (@UserId, @SkillId, @SkillDetails)"))
                {
                    userId = Convert.ToInt32(Session["UserId"]);
                    cmdMapSkill.Connection = connect;
                    connect.Open();

                    cmdMapSkill.Parameters.AddWithValue("@UserId", userId);
                    cmdMapSkill.Parameters.AddWithValue("@SkillId", skillId);
                    cmdMapSkill.Parameters.AddWithValue("@SkillDetails", tbxSkillDetails.Text);
                    cmdMapSkill.ExecuteNonQuery();
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Skill added successfully.')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have already added this skill.')", true);
            }
            //Response.Redirect("AddSkills.aspx");
        }
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> Get_Skills(string prefixText, int count)
    {
        using (SqlConnection connect = new SqlConnection())
        {
            connect.ConnectionString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
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
                connect.Close();
                return Skills;
            }
        }
    }

    //protected void btnSave_click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        int userId, skillId;
    //        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
    //        using (SqlConnection connect = new SqlConnection(connString))
    //        {

    //            using (SqlCommand cmd = new SqlCommand("Select Id from tblUsers where Email='" + Session["Email"] + "'"))
    //            {
    //                cmd.Connection = connect;
    //                connect.Open();
    //                userId = Convert.ToInt32(cmd.ExecuteScalar());
    //                connect.Close();
    //            }
    //            using (SqlCommand cmd = new SqlCommand("Select Id from tblSkills where SkillName='" + tbxEnterSkill.Text + "'"))
    //            {
    //                cmd.Connection = connect;
    //                connect.Open();
    //                skillId = Convert.ToInt32(cmd.ExecuteScalar());
    //                connect.Close();
    //            }
    //            using (SqlCommand cmdMapSkill = new SqlCommand("INSERT INTO tblUserSkillMapping (UserId, SkillId, SkillDetails) values (@UserId, @SkillId, @SkillDetails)"))
    //            {
    //                cmdMapSkill.Connection = connect;
    //                connect.Open();
    //                cmdMapSkill.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["UserId"]));
    //                cmdMapSkill.Parameters.AddWithValue("@SkillId", skillId);
    //                cmdMapSkill.Parameters.AddWithValue("@SkillDetails", tbxSkillDetails.Text);
    //                cmdMapSkill.ExecuteNonQuery();
    //                connect.Close();
    //            }
    //        }
    //    }
    //    catch (Exception exc)
    //    {
    //        Response.Write(exc.Message);
    //    }
    //}
    protected void Refresh(object sender, EventArgs e)
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
        //using (SqlConnection connect = new SqlConnection(connString))
        //{
        //    using (SqlCommand cmd = new SqlCommand("SELECT Id FROM tblGenre where Genre='"+ ddlGenre.SelectedItem.Text + "'"))
        //    {
        //        cmd.Connection = connect;
        //        connect.Open();
        //        int GenerId = Convert.ToInt32(cmd.ExecuteScalar());
        //        //ddlGenre.SelectedValue = GenerId;
        //        connect.Close();
        //    }
        //}

        int genreCount;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT count(*) FROM tblGenre"))
            {
                cmd.Connection = connect;
                connect.Open();
                genreCount = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            }
        }
        ddlGenre.Items.Insert(0, new ListItem("Select", "-1"));
        //ddlGenre.Items.Insert(genreCount + 1, new ListItem("Other", "0"));
    }
    
    //protected void Comment(object sender, EventArgs e)
    //{
    //    Response.Redirect("Commenting.aspx");
    //}
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = null;
        Response.Redirect("Login.aspx");
    }
    protected void btnAddGenre_click(object sender, EventArgs e) //To ADD NEW GENRE
    {
        int genreCount = 0;
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT count(*) from tblGenre where Genre='" + tbxGenreName.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                genreCount = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
        if (genreCount == 0 && tbxGenreName.Text!="")
        {
            Genres objGenres = new Genres();
            objGenres.Genre = tbxGenreName.Text.Trim();

            objGenres.AddGenre(objGenres);
        }
        else if(tbxGenreName.Text!="")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('This Genre is already added.')", true);
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Enter Name of Genre.')", true);
        // Response.Redirect("AddSkills.aspx");
    }
}
