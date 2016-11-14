using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BarterSystem;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void btnSearchUser_Click(object sender, EventArgs e)
    //{
    //    string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
    //    using (SqlConnection connect = new SqlConnection(connString))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("Select Name from tblUsers where Name='" + tbxSearchUser.Text + "'"))
    //        {
    //            cmd.Connection = connect;
    //            connect.Open();
    //            //Respone.Redirect("Users.aspx");
    //        }
    //    }
    //}
    //protected void btnSearchSkill_Click(object sender, EventArgs e)
    //{
    //    string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
    //    using (SqlConnection connect = new SqlConnection(connString))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("Select Skill from tblSkills where Skill='" + tbxSearchSkill.Text + "'"))
    //        {
    //            cmd.Connection = connect;
    //            connect.Open();
    //            //Respone.Redirect("Skills.aspx");
    //        }
    //    }
    //}
    protected void btnSubmit_click(object sender, EventArgs e)
    {
        Query objQuery = new Query();
        Mail objMail = new Mail();

        objQuery.Email = tbxEmail.Text.Trim();
        objQuery.QueryText = tbxQuery.Text;

        objQuery.AddQuery(objQuery);

        string subjectUser = "Query Registered";
        string body = "Hello " + tbxName.Text.Trim() + ",";
        body += "<br /> Your Query has been registered with us. We'll contact you shortly.";
        body += "<br/>Thanks";

        Mail.Send_Mail(tbxEmail.Text.Trim(), body, subjectUser);

        string subjectAdmin = "Query";
        string bodyNotification = "Query received from " + tbxName.Text.Trim() + "<br/>Email: " + tbxEmail.Text.Trim();
        Mail.Send_Mail("anchal.chaudhary329@gmail.com", bodyNotification, subjectAdmin);
    }
}