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

    }
    protected void btnAddGenre_click(object sender, EventArgs e) //To ADD NEW GENRE
    {
        Genres objGenres = new Genres();
        objGenres.Genre = tbxGenreName.Text.Trim();

        objGenres.AddGenre(objGenres);
    }
}