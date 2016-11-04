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
        if (RadioButtonMale.Checked == true)
            gender = "Male";
        else if (RadioButtonFemale.Checked == true)
            gender = "Female";

        User objUser = new User();

        if (FileProfilePicture.HasFile)
        {
            HttpPostedFile postedImage = FileProfilePicture.PostedFile;
            string imgName = Path.GetFileName(postedImage.FileName);
            imgExtension = Path.GetExtension(imgName);
            int imgSize = postedImage.ContentLength;
            if (imgExtension.ToLower() == ".jpg" || imgExtension.ToLower() == ".png" || imgExtension.ToLower() == ".jpeg")
            {
                Stream stream = postedImage.InputStream;//returns a stream object pointing to the posted file to read the contents of the file
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] imgBytes = binaryReader.ReadBytes((int)stream.Length);

                objUser.ProfilePicture = imgBytes;
            }
            else
            {
                lblMessage.Visible = true;
                return;
            }
        }
        
        objUser.Name = tbxName.Text.Trim();
        objUser.Email = tbxEmail.Text.Trim();
        objUser.Password = tbxPassword.Text;
        objUser.Gender = gender;
        objUser.City = tbxCity.Text;
        objUser.Phone = tbxPhone.Text;
        objUser.Dob = tbxDob.Text;

        objUser.SignUp(objUser);
    }
}
        
       