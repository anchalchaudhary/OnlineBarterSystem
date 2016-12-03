using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.IO;
using BarterSystem;


public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {

        string gender = "";
        string imgExtension = "";
        string encrytedPassword = Hash.Encrypt_Password(tbxPassword.Text);
        string activationCode = Guid.NewGuid().ToString();

        int emailCount = 0;
        string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        using (SqlConnection connect = new SqlConnection(connString))
        {
            using (SqlCommand cmdEmail = new SqlCommand("select count(*) from tblUsers where Email='" + tbxEmail.Text + "'"))
            {
                cmdEmail.Connection = connect;
                connect.Open();
                emailCount = Convert.ToInt32(cmdEmail.ExecuteScalar().ToString());
            }
        }
        if (emailCount != 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('This Email is already added.')", true);
            return;
        }

        Session["Activate Account"] = tbxEmail.Text;


        if (RadioButtonMale.Checked == true)
            gender = "Male";
        else if (RadioButtonFemale.Checked == true)
            gender = "Female";


        User objUser = new User();
        Hash objHash = new Hash();
        Mail objMail = new Mail();

        try
        {

            if (FileProfilePicture.HasFile)
            {
                HttpPostedFile postedImage = FileProfilePicture.PostedFile;
                string imgName = Path.GetFileName(postedImage.FileName);
                imgExtension = Path.GetExtension(imgName);
                int imgSize = postedImage.ContentLength;

                if (imgExtension.ToLower() == ".jpg" || imgExtension.ToLower() == ".png" || imgExtension.ToLower() == ".jpeg")
                {
                    if (imgSize <= 1572864)
                    {
                        Stream stream = postedImage.InputStream;//returns a stream object pointing to the posted file to read the contents of the file
                        BinaryReader binaryReader = new BinaryReader(stream);
                        byte[] imgBytes = binaryReader.ReadBytes((int)stream.Length);

                        objUser.ProfilePicture = imgBytes;
                    }
                    else
                    {
                        lblMessage.Text = "File size should be less than 1.5MB";
                        lblMessage.Visible = true;
                        return;
                    }
                }
                else
                {
                    lblMessage.Text = "File should be only in jpg/jpeg or png format";
                    lblMessage.Visible = true;
                    return;
                }


            }
        }
        catch(Exception ex)
        {
            lblMessage.Text = "File size should be less than 1.5MB";
        }


        objUser.Name = tbxName.Text.Trim();
        objUser.Email = tbxEmail.Text.Trim();
        objUser.Password = encrytedPassword;
        objUser.Gender = gender;
        objUser.City = tbxCity.Text;
        objUser.Phone = tbxPhone.Text;
        objUser.Dob = tbxDob.Text;

        //string activationUrl = "http://localhost:49614/User/Verification.aspx?Email=" + tbxEmail.Text;


        objUser.SignUp(objUser);
        int uId = 0;
        using (SqlConnection connect1 = new SqlConnection(connString))
        {
            //int uId = 0;
            using (SqlCommand cmdDetails = new SqlCommand("select Id from tblUsers where Email='" + tbxEmail.Text + "'"))
            {
                cmdDetails.Connection = connect1;
                connect1.Open();
                uId=Convert.ToInt32(cmdDetails.ExecuteScalar().ToString());
                cmdDetails.ExecuteNonQuery();
            }
            using (SqlCommand cmdDetails = new SqlCommand("update tblUsers set Image=@Image where Id=@Id"))
            {
                cmdDetails.Connection = connect1;
                cmdDetails.Parameters.AddWithValue("@Id", uId);
                cmdDetails.Parameters.AddWithValue("@Image", "../User/Handler.ashx?imgID=" + uId.ToString());
                cmdDetails.ExecuteNonQuery();
            }
        }
        string activationUrl = "http://localhost:49614/User/Verification.aspx?UserId=" + uId +"&Email=" + Hash.Encrypt_Password(tbxEmail.Text);
        string subject = "Account Activation";

        string body = "<a href='" + activationUrl + "'>Click Here to verify your acount</a>";

        //string body = "Hello " + tbxName.Text.Trim() + ",";
        //body += "<br />Your Activation Code is " + activationCode + ". <br />Use this code to Activate your Account.";
        //body += "<br /><br />Thanks";

        Mail.Send_Mail(tbxEmail.Text.Trim(), body, subject);
        //Response.Redirect("AccountConfirmation.aspx");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Verification Link has been sent to you in Email.')", true);
    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        //MpeLogin.Show();
    }
}


