using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityLayer;

namespace OnlineLecturesSite
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LinkButtonGiris_Click(object sender, EventArgs e)
        {
            if (LinkButtonGiris.Text.Equals("Çıkış"))
            {
                Session["UserInfo"] = null;
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void LinkButtonLOGO_Click(object sender, EventArgs e)
        {
            EUser usr = ((EUser)Session["UserInfo"]);
            if (usr != null)
            {
                if (usr.UserType.Equals("Öğrenci"))
                {
                    Response.Redirect("Default_Student.aspx");
                }
                else if (usr.UserType.Equals("Öğretmen"))
                {
                    Response.Redirect("Default_Teacher.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }

       

    }
}