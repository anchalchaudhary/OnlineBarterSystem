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
/// Summary description for UserSkills
/// </summary>
namespace BarterSystem
{
    public class UserSkills
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int SkillId { get; set; }
        public string SkillDetails { get; set; }
        //public int Rating { get; set; }
        public void MapUserWithSkills(UserSkills objUserSkills)
        {
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmdMapSkill = new SqlCommand("INSERT INTO tblUserSkillMapping (UserId, SkillId, SkillDetails) values (@UserId, @SkillId, @SkillDetails)"))
                {
                    cmdMapSkill.Connection = connect;
                    connect.Open();
                    cmdMapSkill.Parameters.AddWithValue("@UserId", objUserSkills.UserId);
                    cmdMapSkill.Parameters.AddWithValue("@SkillId", objUserSkills.SkillId);
                    cmdMapSkill.Parameters.AddWithValue("@SkillDetails", objUserSkills.SkillDetails);
                    cmdMapSkill.ExecuteNonQuery();
                }
            }
        }
    }
}