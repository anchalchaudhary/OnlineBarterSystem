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
            //int skillCount = 0, genreId = 0;
            //string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            //using (SqlConnection connect = new SqlConnection(connString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("Select count(*) from tblSkills where SkillName='" + objSkills. + "'"))
            //    {
            //        cmd.Connection = connect;
            //        connect.Open();
            //        skillCount = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            //    }
            //}
        }
    }
}