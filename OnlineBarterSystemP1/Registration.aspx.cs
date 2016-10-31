using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BarterSystem;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        //int emailCount = 0;
        string gender = "";
        if (RadioButtonMale.Checked == true)
            gender = "Male";
        else if (RadioButtonFemale.Checked == true)
            gender = "Female";
        User objUser = new User();
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
        
       