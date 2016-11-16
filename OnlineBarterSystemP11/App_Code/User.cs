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

/// <summary>
/// Summary description for User
/// </summary>
namespace BarterSystem
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Gender { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
        public string Dob { get; set; }
        public byte[] ProfilePicture { get; set; }
        

        #region Signup function
        public void SignUp(User objUser)
        {
            int emailCount = 0;
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmdEmail = new SqlCommand("select count(*) from tblUsers where Email='" + objUser.Email + "'"))
                {
                    cmdEmail.Connection = connect;
                    connect.Open();
                    emailCount = Convert.ToInt32(cmdEmail.ExecuteScalar().ToString());
                }
            }
            using (SqlConnection connect1 = new SqlConnection(connString))
            {
                if (emailCount == 0)
                {
                    if (ProfilePicture != null)
                    {
                        using (SqlCommand cmdDetails = new SqlCommand("insert into tblUsers(Name, Email, Password, Gender, City, Phone, Dob, ProfilePicture) values (@Name, @Email, @Password, @Gender, @City, @Phone, @Dob, @ProfilePicture)"))
                        {
                            cmdDetails.Connection = connect1;
                            connect1.Open();
                            cmdDetails.Parameters.AddWithValue("@Name", objUser.Name);
                            cmdDetails.Parameters.AddWithValue("@Email", objUser.Email);
                            cmdDetails.Parameters.AddWithValue("@Password", objUser.Password);
                            cmdDetails.Parameters.AddWithValue("@Gender", objUser.Gender);
                            cmdDetails.Parameters.AddWithValue("@City", objUser.City);
                            cmdDetails.Parameters.AddWithValue("@Phone", objUser.Phone);
                            cmdDetails.Parameters.AddWithValue("@Dob", objUser.Dob);
                            cmdDetails.Parameters.AddWithValue("@ProfilePicture", objUser.ProfilePicture);
                            
                            //connect1.Open();
                            cmdDetails.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        using (SqlCommand cmdDetails = new SqlCommand("insert into tblUsers(Name, Email, Password, Gender, City, Phone, Dob) values (@Name, @Email, @Password, @Gender, @City, @Phone, @Dob)"))
                        {
                            cmdDetails.Connection = connect1;
                            connect1.Open();
                            cmdDetails.Parameters.AddWithValue("@Name", objUser.Name);
                            cmdDetails.Parameters.AddWithValue("@Email", objUser.Email);
                            cmdDetails.Parameters.AddWithValue("@Password", objUser.Password);
                            cmdDetails.Parameters.AddWithValue("@Gender", objUser.Gender);
                            cmdDetails.Parameters.AddWithValue("@City", objUser.City);
                            cmdDetails.Parameters.AddWithValue("@Phone", objUser.Phone);
                            cmdDetails.Parameters.AddWithValue("@Dob", objUser.Dob);
                           
                            //connect1.Open();
                            cmdDetails.ExecuteNonQuery();
                        }
                    }
                }
            }
        }
        #endregion
    }
}