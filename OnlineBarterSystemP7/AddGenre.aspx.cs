using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddGenre : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["GenreAdded"] = 1;
    }
    protected void btnAddGenre_click(object sender, EventArgs e) //To ADD NEW GENRE
    {
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        if (tbxGenreName.Visible == true)
        {
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmdAddGenre = new SqlCommand("INSERT INTO tblGenre (Genre) values (@Genre)"))
                {
                    cmdAddGenre.Connection = connect;
                    connect.Open();
                    cmdAddGenre.Parameters.AddWithValue("@Genre", tbxGenreName.Text);
                    cmdAddGenre.ExecuteNonQuery();
                }
            }
        }
    }
}