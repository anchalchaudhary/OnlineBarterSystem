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
using System.Net;
using System.Net.Mail;

/// <summary>
/// Summary description for Query
/// </summary>

namespace BarterSystem
{
    public class Query
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string QueryText { get; set; }
        public void AddQuery(Query objQuery)
        {
            int emailCount = 0, userId;
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmdEmail = new SqlCommand("select count(*) from tblUsers where Email='" + objQuery.Email + "'"))
                {
                    cmdEmail.Connection = connect;
                    connect.Open();
                    emailCount = Convert.ToInt32(cmdEmail.ExecuteScalar().ToString());
                }
            }
            if (emailCount != 0)
            {
                using (SqlConnection connect = new SqlConnection(connString))
                {
                    using (SqlCommand cmdUserId = new SqlCommand("Select Id from tblUsers where Email='" + objQuery.Email + "'"))
                    {
                        cmdUserId.Connection = connect;
                        connect.Open();
                        userId = Convert.ToInt32(cmdUserId.ExecuteScalar());
                        connect.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("Insert into tblQuery(UserId, Email, Query) values (@UserId,@Email,@Query)"))
                    {
                        cmd.Connection = connect;
                        connect.Open();
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@Email", objQuery.Email);
                        cmd.Parameters.AddWithValue("@Query", objQuery.QueryText);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            else
            {
                using (SqlConnection connect = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("Insert into tblQuery(Email, Query) values (@Email,@Query)"))
                    {
                        cmd.Connection = connect;
                        connect.Open();
                        cmd.Parameters.AddWithValue("@Email", objQuery.Email);
                        cmd.Parameters.AddWithValue("@Query", objQuery.QueryText);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}