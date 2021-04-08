using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityLayer;

namespace OnlineLecturesSite
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EUser usr = ((EUser)Session["UserInfo"]);
            if (usr != null)
            {
                if (!IsPostBack)
                {
                    ((LinkButton)this.Master.FindControl("LinkButtonGiris")).Text = "Çıkış";
                }

            }
        }
    }
}