using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for UserDetails
/// </summary>
namespace BarterSystem
{
    public class SqlConnectionClass
    {
        SqlConnection connect = new SqlConnection();
        public SqlConnectionClass()
        {
            connect.ConnectionString= ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        }
        public void Add_Details_to_table(string command)
        {
            using (SqlCommand cmd = new SqlCommand(command, connect))
            {
                connect.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}