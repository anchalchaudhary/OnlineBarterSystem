using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserLogin"] != null)
            {
                DataSet ds = GetDetails();
                RepeaterDetails.DataSource = ds;
                RepeaterDetails.DataBind();

                ds = GetSkills();
                RepeaterSkills.DataSource = ds;
                RepeaterSkills.DataBind();

                ds = GetRequests();
                RepeaterRequested.DataSource = ds;
                RepeaterRequested.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    public DataSet GetDetails()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from tblUsers where Id='" + Convert.ToInt32(Session["UserId"]) + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            imgProfile.ImageUrl = "../User/Handler.ashx?imgID=" + Session["UserId"];
            return ds;
        }
    }
    protected void RepeaterProfile(object source, RepeaterCommandEventArgs e)
    {


        //byte[] bytes = (byte[])GetData("SELECT ProfilePicture FROM tblUsers WHERE Id =" + Convert.ToInt32(Session["UserId"])).Rows[0]["ProfilePicture"];
        //string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        //((Image)e.Item.FindControl("imgProfile")).ImageUrl = "data:image/png;base64," + base64String;


        if (e.CommandName == "Edit")
        {

            if (((Label)e.Item.FindControl("lblGender")).Text == "Male")
            {
                ((RadioButton)e.Item.FindControl("RadioButtonMale")).Visible = true;
                ((RadioButton)e.Item.FindControl("RadioButtonFemale")).Visible = true;
                ((RadioButton)e.Item.FindControl("RadioButtonMale")).Enabled = true;
                ((RadioButton)e.Item.FindControl("RadioButtonFemale")).Enabled = true;
                ((RadioButton)e.Item.FindControl("RadioButtonMale")).Checked = true;
            }
            else
            {
                ((RadioButton)e.Item.FindControl("RadioButtonMale")).Visible = true;
                ((RadioButton)e.Item.FindControl("RadioButtonFemale")).Visible = true;
                ((RadioButton)e.Item.FindControl("RadioButtonMale")).Enabled = true;
                ((RadioButton)e.Item.FindControl("RadioButtonFemale")).Enabled = true;
                ((RadioButton)e.Item.FindControl("RadioButtonFemale")).Checked = true;
            }


            ((Label)e.Item.FindControl("lblName")).Visible = false;
            ((Label)e.Item.FindControl("lblEmail")).Visible = false;
            ((Label)e.Item.FindControl("lblGender")).Visible = false;
            ((Label)e.Item.FindControl("lblCity")).Visible = false;
            ((Label)e.Item.FindControl("lblPhone")).Visible = false;
            ((Label)e.Item.FindControl("lblDob")).Visible = true;

            ((TextBox)e.Item.FindControl("tbxName")).Visible = true;
            ((TextBox)e.Item.FindControl("tbxEmail")).Visible = true;
            ((TextBox)e.Item.FindControl("tbxCity")).Visible = true;
            ((TextBox)e.Item.FindControl("tbxPhone")).Visible = true;
            ((Label)e.Item.FindControl("tbxDob")).Visible = false;
            if (((Label)e.Item.FindControl("lblDob")).Text.Length > 10)
            {
                ((Label)e.Item.FindControl("tbxDob")).Text = ((Label)e.Item.FindControl("tbxDob")).Text.Remove(10);
                ((Label)e.Item.FindControl("lblDob")).Text = ((Label)e.Item.FindControl("tbxDob")).Text;
            }
            ((Button)e.Item.FindControl("btnEdit")).Visible = false;
            ((Button)e.Item.FindControl("btnUpdate")).Visible = true;
        }
        else if (e.CommandName == "Update")
        {


            //bytes = (byte[])GetData("SELECT ProfilePicture FROM tblUsers WHERE Id =" + Convert.ToInt32(Session["UserId"])).Rows[0]["ProfilePicture"];
            //base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            //((Image)e.Item.FindControl("imgProfile")).ImageUrl = "data:image/png;base64," + base64String;
            string Gender = "";
            if (((RadioButton)e.Item.FindControl("RadioButtonMale")).Checked == true)
            {
                Gender = "Male";
            }
            else
            {
                Gender = "Female";
            }
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString);
            string getFields = "update tblUsers set Name=@Name,Email=@Email,Gender=@Gender,City=@City,Phone=@Phone where Id='" + Convert.ToInt32(Session["UserId"]) + "'";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            cmd.Parameters.AddWithValue("@Name", ((TextBox)e.Item.FindControl("tbxName")).Text);
            cmd.Parameters.AddWithValue("@Email", ((TextBox)e.Item.FindControl("tbxEmail")).Text);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            cmd.Parameters.AddWithValue("@City", ((TextBox)e.Item.FindControl("tbxCity")).Text);
            cmd.Parameters.AddWithValue("@Phone", ((TextBox)e.Item.FindControl("tbxPhone")).Text);
            

            cmd.ExecuteNonQuery();
            connect.Close();

            ((Label)e.Item.FindControl("lblName")).Visible = true;
            ((Label)e.Item.FindControl("lblEmail")).Visible = true;
            ((Label)e.Item.FindControl("lblGender")).Visible = true;
            ((Label)e.Item.FindControl("lblCity")).Visible = true;
            ((Label)e.Item.FindControl("lblPhone")).Visible = true;
            ((Label)e.Item.FindControl("lblDob")).Visible = true;

            ((TextBox)e.Item.FindControl("tbxName")).Visible = false;
            ((TextBox)e.Item.FindControl("tbxEmail")).Visible = false;
            ((RadioButton)e.Item.FindControl("RadioButtonMale")).Visible = false;
            ((RadioButton)e.Item.FindControl("RadioButtonFemale")).Visible = false;
            ((TextBox)e.Item.FindControl("tbxCity")).Visible = false;
            ((TextBox)e.Item.FindControl("tbxPhone")).Visible = false;
            ((Label)e.Item.FindControl("tbxDob")).Visible = false;

            ((Button)e.Item.FindControl("btnEdit")).Visible = true;
            ((Button)e.Item.FindControl("btnUpdate")).Visible = false;



            DataSet ds = GetDetails();
            RepeaterDetails.DataSource = ds;
            RepeaterDetails.DataBind();
        }
    }
    protected DataTable GetData(string query)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }
    protected void FillSkills(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument.ToString());
            int UserId = Convert.ToInt32(Session["UserId"]);
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;

            using (SqlConnection connect = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("select m.SkillId,m.FollowedId,u.Email from tblUserFollowMapping as m inner join tblUsers as u on m.FollowerId=u.Id  WHERE SkillId=@SkillID and FollowedId=@UserId ", connect);
                connect.Open();
                cmd.Parameters.AddWithValue("@SkillId", ID);
                cmd.Parameters.AddWithValue("@UserId", UserId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    string subject = "Barter System";

                    string body =  "One Skill has been Deleted";

                    //string body = "Hello " + tbxName.Text.Trim() + ",";
                    //body += "<br />Your Activation Code is " + activationCode + ". <br />Use this code to Activate your Account.";
                    //body += "<br /><br />Thanks";

                    Mail.Send_Mail(rdr["Email"].ToString(), body, subject);
                }
            }

            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM tblUserSkillMapping WHERE SkillId=@SkillID and UserId=@UserId "))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    cmd.Parameters.AddWithValue("@SkillId", ID);
                    cmd.Parameters.AddWithValue("@UserId", UserId);
                    cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("Profile.aspx");
        }
    }

    public DataSet GetSkills()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        int count = 0;
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblUserSkillMapping as u inner join tblSkills as s on u.SkillId=s.Id where UserId='" + Convert.ToInt32(Session["UserId"]) + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                connect.Close();
            }
        }
        if (count == 0)
        {
            lblInfo1.Text = "No Skill Added";
            btnAddSkill.Visible = true;
        }
        else
        {
            lblInfo1.Text = "";
            btnAddSkill.Visible = false;
        }
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select s.SkillName,u.Rating,s.Id from tblUserSkillMapping as u inner join tblSkills as s on u.SkillId=s.Id where UserId='" + Convert.ToInt32(Session["UserId"]) + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    public DataSet GetRequests()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        int count = 0;
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblUserFollowMapping where FollowerId='" + Convert.ToInt32(Session["UserId"]) + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                connect.Close();
            }
        }
        if (count == 0)
        {
            lblInfo2.Text = "No Requests from your side";
            btnSearchSkill.Visible = true;
        }
        else
        {
            lblInfo2.Text = "";
            btnSearchSkill.Visible = false;
        }
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select s.SkillName,u.FollowedId,s.Id,ur.Email from tblUserFollowMapping as u inner join tblSkills as s on u.SkillId=s.Id inner join tblUsers as ur on ur.Id=u.FollowedId where FollowerId='" + Convert.ToInt32(Session["UserId"]) + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    protected void btnAddSkill_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddSkills.aspx");
    }
    protected void btnSearchSkill_Click(object sender, EventArgs e)
    {
        Response.Redirect("Skills.aspx");
    }
}