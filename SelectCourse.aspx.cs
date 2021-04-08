using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityLayer;
using BusinessLayer;
using System.Data;

namespace OnlineLecturesSite
{
    public partial class SelectCourse : System.Web.UI.Page
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

        protected void ButtonStCourseADD_Click(object sender, EventArgs e)
        {
            EUser usr = ((EUser)Session["UserInfo"]);
            string message = "";
            
            message = BLStCourses.InsertStCourse(new EStCourses
            {
                StNickName = usr.UserName,
                StCName = DropDownListStCName.SelectedValue,
                StCTeacher = DropDownListStCTeacher.SelectedValue,
                StCLevel = DropDownListStCLevel.SelectedValue,
                StCost = Convert.ToInt32(LabelCost.Text),

            });

            LabelWarningAddCourse.Text = message;

        }
        


        protected void DropDownListStCLevel_SelectedIndexChanged(object sender, EventArgs e)
        {          
            if (!DropDownListStCLevel.SelectedValue.Equals("---"))
            {
                List<ELecture> lecture = BLLecture.GetLecture(DropDownListStCLevel.SelectedValue);
                DropDownListStCName.Items.Clear();
                LabelWarningAddCourse.Text = "";
                DropDownListStCName.Items.Add(new ListItem { Text = "---", Value = "---" });

                foreach (ELecture lec in lecture)
                {
                    DropDownListStCName.Items.Add(new ListItem { Text = lec.LectureName, Value = lec.LectureName });
                }
            }


        }

        protected void DropDownListStCName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownListStCName.SelectedValue.Equals("---"))
            {
                List<ECourse> cteacher = BLCourse.GetCourseTeacher(DropDownListStCLevel.SelectedValue, DropDownListStCName.SelectedItem.ToString());

                DropDownListStCTeacher.Items.Clear();

                DropDownListStCTeacher.Items.Add(new ListItem { Text = "---", Value = "---" });

                foreach (ECourse ct in cteacher)
                {
                    DropDownListStCTeacher.Items.Add(new ListItem { Text = ct.CTeacher, Value = ct.CTeacher });
                }
            }

            


        }

        protected void DropDownListStCTeacher_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (!DropDownListStCTeacher.SelectedValue.Equals("---"))
            {
                List<ECourse> cost = BLCourse.GetCourseCost(DropDownListStCLevel.SelectedValue, DropDownListStCName.SelectedValue, DropDownListStCTeacher.SelectedValue);
               
                LabelCost.Text = "";

                foreach (ECourse ct in cost)
                {
                    LabelCost.Text = Convert.ToString(ct.Cost);
                }
            }

            

        }
    }
}