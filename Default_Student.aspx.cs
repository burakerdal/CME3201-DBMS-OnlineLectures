﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityLayer;
using FacadeLayer;
using BusinessLayer;
using System.Data;

namespace OnlineLecturesSite
{
    public partial class Default_Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EUser usr = ((EUser)Session["UserInfo"]);
            string info = BLStudent.GetStudentName(usr.UserName);
            LabelInfoMain.Text = info;

            if (usr != null)
            {
                if (usr.UserType.Equals("Öğrenci"))
                {                   
                    if (!IsPostBack)
                    {
                        Getir2(usr.UserName);
                    }
                }
                ((LinkButton)this.Master.FindControl("LinkButtonGiris")).Text = "Çıkış";
            }
            else
            {
                // tüm kurslar görünsün ?
                ((LinkButton)this.Master.FindControl("LinkButtonGiris")).Text = "Giriş";
                Response.Redirect("~/Login.aspx");
            }
        }
        private void Getir2(string nick)
        {

            DataTable data = BLStCourses.SelectStCourseData(nick);
            RepeaterCourseInfo.DataSource = data;
            RepeaterCourseInfo.DataBind();

        }

        protected void Default(object sender, EventArgs e)
        {
            EUser usr = ((EUser)Session["UserInfo"]);
            if (usr.UserType.Equals("Öğrenci"))
            {
                Response.Redirect("~/Default_Student.aspx");
            }
            else if (usr.UserType.Equals("Öğretmen"))
            {
                Response.Redirect("~/Default_Teacher.aspx");
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SelectCourse.aspx");
        }
    }
}