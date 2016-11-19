﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Requests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = GetData();
        RepeaterRequest.DataSource = ds;
        RepeaterRequest.DataBind();
    }
    protected DataSet GetData()
    {
        int userId = Convert.ToInt32(Session["UserId"]);
        string str = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
        int count = 0;
        using (SqlConnection connect = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblUserFollowMapping as m inner join tblUsers as u on u.Id=FollowerId inner join tblSkills as n on n.Id=m.SkillId where m.Accepted=0 and FollowedId='" + userId + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                connect.Close();
            }
        }
        if (count == 0)
        {
            lblInfo.Text = "<br>"+"No Request recieved till Now";
        }
        else
        {
            lblInfo.Text = "";
        }
        using (SqlConnection connect = new SqlConnection(str))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select u.Name,m.SkillId,m.Id,n.SkillName from tblUserFollowMapping as m inner join tblUsers as u on u.Id=FollowerId inner join tblSkills as n on n.Id=m.SkillId where m.Accepted=0 and FollowedId='" + userId + "'", connect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }


    protected void RepeaterRequest_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName== "Accept")
        {
            int ID = Convert.ToInt32(e.CommandArgument.ToString());
            int UserId = Convert.ToInt32(Session["UserId"]);
            string connString = ConfigurationManager.ConnectionStrings["UserDetailsConnectionString"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("update tblUserFollowMapping set Accepted=1 WHERE Id=@Id"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    cmd.Parameters.AddWithValue("@Id", ID);
                    cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("Requests.aspx");
        }
    }
}