using System;
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
    public partial class AddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EUser usr = ((EUser)Session["UserInfo"]);
            if (usr != null)
            {
                if (!IsPostBack)
                {
                    Getir();
                    ((LinkButton)this.Master.FindControl("LinkButtonGiris")).Text = "Çıkış";
                }

            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        private void Getir()
        {

            DataTable data = BLCourse.SelectData();
            RepeaterCourseInfo.DataSource = data;
            RepeaterCourseInfo.DataBind();

        }

        protected void ButtonTCADD_Click(object sender, EventArgs e)
        {
            
            EUser usr = ((EUser)Session["UserInfo"]);
            string user = usr.UserName;

            string message = BLCourse.InsertCourse(new ECourse
            {
                CName = DropDownListTCName.SelectedItem.ToString(),
                CTeacher = BLTeacher.GetTeacherName(user),
                CLevel = DropDownListTCLevel.SelectedItem.ToString(),
                Cost = Convert.ToInt32(TextBoxCost.Text)

            });

            LabelWarningAddCourse.Text = message;

        }

        protected void DropDownListTCLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownListTCLevel.SelectedValue.Equals("---"))
            {
                DropDownListTCName.Visible = true;
                LabelWarningAddCourse.Text = "";
                List<ELecture> lecture = BLLecture.GetLecture(DropDownListTCLevel.SelectedValue);
                DropDownListTCName.Items.Clear();
                foreach (ELecture lec in lecture)
                {
                    DropDownListTCName.Items.Add(new ListItem { Text = lec.LectureName, Value = lec.LectureLevel });
                }

            }
            

        }

    }
}