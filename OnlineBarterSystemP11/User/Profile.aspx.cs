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
            if (Session["UserLogin"]!=null)
            {
                DataSet ds = GetDetails();
                RepeaterDetails.DataSource = ds;
                RepeaterDetails.DataBind();

                ds = GetSkills();
                RepeaterSkills.DataSource = ds;
                RepeaterSkills.DataBind();
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
            SqlDataAdapter da = new SqlDataAdapter("Select * from tblUsers where Id='" + Convert.ToInt32(Session["UserId"]) +"'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
    protected void RepeaterProfile(object source, RepeaterCommandEventArgs e)
    {


        byte[] bytes = (byte[])GetData("SELECT ProfilePicture FROM tblUsers WHERE Id =" + Convert.ToInt32(Session["UserId"])).Rows[0]["ProfilePicture"];
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        ((Image)e.Item.FindControl("imgProfile")).ImageUrl = "data:image/png;base64," + base64String;


        if (e.CommandName=="Edit")
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
            if (((Label)e.Item.FindControl("lblDob")).Text.Length>10)
            {
                ((Label)e.Item.FindControl("tbxDob")).Text = ((Label)e.Item.FindControl("tbxDob")).Text.Remove(10);
                ((Label)e.Item.FindControl("lblDob")).Text = ((Label)e.Item.FindControl("lblDob")).Text.Remove(10);
            }
            ((ImageButton)e.Item.FindControl("btnEdit")).Visible = false;
            ((ImageButton)e.Item.FindControl("btnUpdate")).Visible = true;
        }
        else if(e.CommandName=="Update")
        {


             bytes = (byte[])GetData("SELECT ProfilePicture FROM tblUsers WHERE Id =" + Convert.ToInt32(Session["UserId"])).Rows[0]["ProfilePicture"];
             base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            ((Image)e.Item.FindControl("imgProfile")).ImageUrl = "data:image/png;base64," + base64String;
            string Gender="";
            if (((RadioButton)e.Item.FindControl("RadioButtonMale")).Checked == true)
            {
                Gender = "Male";
            }
            else
            {
                Gender = "Female";
            }
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString);
            string getFields = "update tblUsers set Name=@Name,Email=@Email,Gender=@Gender,City=@City,Phone=@Phone,Dob=@Dob where Id='"+ Convert.ToInt32(Session["UserId"]) +"'";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            cmd.Parameters.AddWithValue("@Name",((TextBox)e.Item.FindControl("tbxName")).Text);
            cmd.Parameters.AddWithValue("@Email", ((TextBox)e.Item.FindControl("tbxEmail")).Text);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            cmd.Parameters.AddWithValue("@City", ((TextBox)e.Item.FindControl("tbxCity")).Text);
            cmd.Parameters.AddWithValue("@Phone", ((TextBox)e.Item.FindControl("tbxPhone")).Text);
            cmd.Parameters.AddWithValue("@Dob", ((Label)e.Item.FindControl("tbxDob")).Text);

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
            ((RadioButton )e.Item.FindControl("RadioButtonMale")).Visible = false;
            ((RadioButton)e.Item.FindControl("RadioButtonFemale")).Visible = false;
            ((TextBox)e.Item.FindControl("tbxCity")).Visible = false;
            ((TextBox)e.Item.FindControl("tbxPhone")).Visible = false;
            ((Label)e.Item.FindControl("tbxDob")).Visible = false;

            ((ImageButton)e.Item.FindControl("btnEdit")).Visible = true;
            ((ImageButton)e.Item.FindControl("btnUpdate")).Visible = false;

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

    }

    public DataSet GetSkills()
    {
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from tblUserSkillMapping where UserId='" + Convert.ToInt32(Session["UserId"]) + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}