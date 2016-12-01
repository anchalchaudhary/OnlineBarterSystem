using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] == null)
            Response.Redirect("Login.aspx");
    }
    

    protected void btnAddSkills_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddSkills.aspx");
    }
    

    protected void btnSearchSkills_Click(object sender, EventArgs e)
    {
        Response.Redirect("Skills.aspx");
    }

    protected void btnNotification_Click(object sender, EventArgs e)
    {
        Response.Redirect("Requests.aspx");
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}