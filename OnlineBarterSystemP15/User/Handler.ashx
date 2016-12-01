<%@ WebHandler Language="C#" Class="Handler" %>

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


public class Handler : IHttpHandler {
    
    public void ProcessRequest(HttpContext context)
    { 
            SqlDataReader rdr = null;
            SqlConnection conn = null;
            SqlCommand selcmd = null;
            try
            {
                conn = new SqlConnection (ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString);
                selcmd = new SqlCommand("select ProfilePicture from tblUsers where Id=" + context.Request.QueryString["imgID"], conn);
                conn.Open();
                rdr = selcmd.ExecuteReader();
                while (rdr.Read())
                {
                    context.Response.ContentType = "image/jpg";
                    context.Response.BinaryWrite((byte[])rdr["ProfilePicture"]);
                }             
                rdr.Close();
            }
            finally
            {
                conn.Close();
            } 
}
 
   public bool IsReusable {
        get {
            return false;
        }
    }

}