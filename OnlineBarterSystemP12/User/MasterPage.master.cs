using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    //    protected void btnSearch_Click(object sender, EventArgs e)
    //    {
    //        int userCount, skillCount, genreCount;
    //        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
    //        using (SqlConnection connect = new SqlConnection(connString))
    //        {
    //            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblUsers where Name='" + tbxSearch.Text + "'"))
    //            {
    //                cmd.Connection = connect;
    //                connect.Open();
    //                userCount = Convert.ToInt32(cmd.ExecuteScalar());
    //            }
    //        }
    //        using (SqlConnection connect = new SqlConnection(connString))
    //        {
    //            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblSkills where SkillName='" + tbxSearch.Text + "'"))
    //            {
    //                cmd.Connection = connect;
    //                connect.Open();
    //                skillCount = Convert.ToInt32(cmd.ExecuteScalar());
    //                //Response.Redirect("Skills.aspx");
    //            }
    //        }
    //        using (SqlConnection connect = new SqlConnection(connString))
    //        {
    //            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblGenre where Genre='" + tbxSearch.Text + "'"))
    //            {
    //                cmd.Connection = connect;
    //                connect.Open();
    //                genreCount = Convert.ToInt32(cmd.ExecuteScalar());
    //                //Response.Redirect("Genres.aspx");
    //            }
    //        }
    //        if (userCount != 0)
    //            Response.Redirect("Users.aspx");
    //        else if (skillCount != 0)
    //            Response.Redirect("Skills.aspx");
    //        else if (genreCount != 0)
    //            Response.Redirect("Genres.aspx");
    //    }
    //}
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        var liUser = myNavbar.FindControl("navUser") as HtmlGenericControl;
        
    }
}
