using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Genre
/// </summary>
namespace BarterSystem
{
    public class Genres
    {
        public int Id { get; set; }
        public string Genre { get; set; }

        #region Add new Genres
        public void AddGenre(Genres objGenres)
        {
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmdAddGenre = new SqlCommand("INSERT INTO tblGenre (Genre) values (@Genre)"))
                {
                    cmdAddGenre.Connection = connect;
                    connect.Open();
                    cmdAddGenre.Parameters.AddWithValue("@Genre", objGenres.Genre);
                    cmdAddGenre.ExecuteNonQuery();
                }
            }
        }
        #endregion
    }
}
