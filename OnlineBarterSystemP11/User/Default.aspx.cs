using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BarterSystem;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_click(object sender, EventArgs e)
    {
        Query objQuery = new Query();
        Mail objMail = new Mail();

        objQuery.Email = tbxEmail.Text.Trim();
        objQuery.QueryText = tbxQuery.Text;

        objQuery.AddQuery(objQuery);

        string subjectUser = "Query Registered"; 
        string body="Hello " + tbxName.Text.Trim() + ",";
        body += "<br /> Your Query has been registered with us. We'll contact you shortly.";
        body += "<br/>Thanks";

        Mail.Send_Mail(tbxEmail.Text.Trim(), body, subjectUser);

        //string subjectAdmin = "Query";
        //string body="Query received from "+tbxName.Text.Trim()+""

    }
}