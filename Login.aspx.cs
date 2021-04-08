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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonTamam_Click(object sender, EventArgs e)
        {

            EUser usr = BLUser.GetUser(TBLogNick.Text, TBLogPass.Text, DDLogStat.SelectedValue);
            if (usr == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Böyle bir kullanıcı bulunamadı!!!');", true);
            }
            else
            {
                Session["UserInfo"] = usr;
                if (usr.UserType.Equals("Öğrenci"))
                {
                    Response.Redirect("~/Default_Student.aspx");
                }
                else
                {
                    Response.Redirect("~/Default_Teacher.aspx");
                }

            }

        }
    }
}