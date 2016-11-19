using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

namespace BarterSystem
{
    public class Profile
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
        public int Dob { get; set; }
        public int ProfilePicture { get; set; }


        public void GetDetails(int Id)
        {
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd= new SqlCommand("Select * from tblUsers where Id = '"+ Id +"'"))
                {
                    cmd.Connection = connect;
                    connect.Open();

                }
            }
        }
    }
}