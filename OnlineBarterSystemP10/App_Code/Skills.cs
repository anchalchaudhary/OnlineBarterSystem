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

/// <summary>
/// Summary description for Skills
/// </summary>
namespace BarterSystem
{
    public class Skills
    {
        public int Id { get; set; }
        public string SkillName { get; set; }
        public byte[] SkillImage { get; set; }
        public int GenreId { get; set; }
        public void AddSkill(Skills objSkills)
        {
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmdAddSkill = new SqlCommand("INSERT INTO tblSkills (SkillName, SkillImage, GenreId) values (@SkillName, @SkillImage, @GenreId)"))
                {
                    cmdAddSkill.Connection = connect;
                    connect.Open();
                    cmdAddSkill.Parameters.AddWithValue("@SkillName", objSkills.SkillName);
                    cmdAddSkill.Parameters.AddWithValue("@SkillImage", objSkills.SkillImage);
                    if (objSkills.GenreId == 0)
                    {
                        cmdAddSkill.Parameters.AddWithValue("@GenreId", objSkills.GenreId);
                        cmdAddSkill.ExecuteNonQuery();
                  
                    }
                    else
                    {
                        cmdAddSkill.Parameters.AddWithValue("@GenreId", objSkills.GenreId);
                        cmdAddSkill.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}