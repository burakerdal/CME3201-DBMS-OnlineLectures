using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityLayer;
using FacadeLayer;
using BusinessLayer;

namespace OnlineLecturesSite
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            if (DropDownListStatus.SelectedValue.Equals("Öğrenci"))
            {

                LabelLoginWarning.Text = BLUser.InsertUser(new EUser
                {
                    UserName = TextBoxNickName.Text,
                    UserType = DropDownListStatus.SelectedValue,
                    Password = TextBoxLoginPassword.Text

                });

                if (LabelLoginWarning.Text.Equals("kayıt başarılı"))
                {
                    BLStudent.InsertStudent(new EStudent
                    {
                        SNickName = TextBoxNickName.Text,
                        SName = TextBoxNameSurname.Text,
                        SGender = DropDownListGender.SelectedValue,
                        SAge = Convert.ToInt32(TextBoxAge.Text),
                        SEducationLevel = DropDownListEdLevel.SelectedValue
                    });

                    EUser usr = BLUser.GetUser(TextBoxNickName.Text, TextBoxLoginPassword.Text, DropDownListStatus.SelectedValue);

                    Session["UserInfo"] = usr;

                    Response.Redirect("~/Default_Student.aspx");

                }
            }
            else
            {
                LabelLoginWarning.Text = BLUser.InsertUser(new EUser
                {
                    UserName = TextBoxNickName.Text,
                    UserType = DropDownListStatus.SelectedValue,
                    Password = TextBoxLoginPassword.Text

                });

                if (LabelLoginWarning.Text.Equals("kayıt başarılı"))
                {
                    BLTeacher.InsertTeacher(new ETeacher
                    {
                        TNickName = TextBoxNickName.Text,
                        TName = TextBoxNameSurname.Text,
                        TGender = DropDownListGender.SelectedValue,
                        TAge = Convert.ToInt32(TextBoxAge.Text),
                        TEducationLevel = DropDownListEdLevel.SelectedValue
                    });

                    EUser usr = BLUser.GetUser(TextBoxNickName.Text, TextBoxLoginPassword.Text, DropDownListStatus.SelectedValue);

                    Session["UserInfo"] = usr;
                    Response.Redirect("~/Default_Teacher.aspx");

                }
            }
        }

    }
}