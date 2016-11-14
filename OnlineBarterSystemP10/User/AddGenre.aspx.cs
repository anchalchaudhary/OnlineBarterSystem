using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BarterSystem;

public partial class AddGenre : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] == null)
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
        if (genreCount == 0)
        {
            Genres objGenres = new Genres();
            objGenres.Genre = tbxGenreName.Text.Trim();

            objGenres.AddGenre(objGenres);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('This Genre is already added.')", true);
        }
    }
}