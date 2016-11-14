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
        if (Session["UserLogin"] != null)
            Response.Redirect("Home.aspx");
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
        if (emailCount == 0)
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


        if (FileProfilePicture.HasFile)
        {
            HttpPostedFile postedImage = FileProfilePicture.PostedFile;
            string imgName = Path.GetFileName(postedImage.FileName);
            imgExtension = Path.GetExtension(imgName);
            int imgSize = postedImage.ContentLength;
            if(imgSize<=1572864)
            {
               if (imgExtension.ToLower() == ".jpg" || imgExtension.ToLower() == ".png" || imgExtension.ToLower() == ".jpeg")
            	{
                	Stream stream = postedImage.InputStream;//returns a stream object pointing to the posted file to read the contents of the file
                	BinaryReader binaryReader = new BinaryReader(stream);
                	byte[] imgBytes = binaryReader.ReadBytes((int)stream.Length);

	                objUser.ProfilePicture = imgBytes;
    	        }
        	    else
            	{
                    lblMessage.Text = "File should be only in jpg/jpeg or png format";
                    lblMessage.Visible = true;
    	            return;
        	    }
        	}
        	else
        	{
        		lblMessage.Text="File size should be less than 1.5MB";
        		lblMessage.Visible = true;
        	}
        }
        

        objUser.Name = tbxName.Text.Trim();
        objUser.Email = tbxEmail.Text.Trim();
        objUser.Password = encrytedPassword;
        objUser.Gender = gender;
        objUser.City = tbxCity.Text;
        objUser.Phone = tbxPhone.Text;
        objUser.Dob = tbxDob.Text;
        objUser.ActivationCode = activationCode;


        objUser.SignUp(objUser);
        string subject = "Account Activation";

        string body = "Hello " + tbxName.Text.Trim() + ",";
        body += "<br />Your Activation Code is " + activationCode + ". <br />Use this code to Activate your Account.";
        body += "<br /><br />Thanks";

        Mail.Send_Mail(tbxEmail.Text.Trim(), body, subject);
        Response.Redirect("AccountConfirmation.aspx");
    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        MpeLogin.Show();
    }
}

        
       