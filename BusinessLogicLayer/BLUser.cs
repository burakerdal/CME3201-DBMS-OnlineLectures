using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntityLayer;
using FacadeLayer;
using System.Data;


namespace BusinessLayer
{
    public class BLUser
    {
        public static DataTable SelectData()
        {
            return FUser.SelectData();
        }


        public static string InsertUser(EUser eUser)
        {
            string message = "";
            int control_result = FUser.Insert(eUser);

            if (control_result==0)
            {
                message = "kayıt gerçekleşmedi";
            }
            if (control_result==1)
            {
                message = "kayıt başarılı";
            }

            return message;
        }

        public static EUser GetUser(string nickname, string password, string status)
        {
            return FUser.GetUser(nickname, password, status);
        }

    }
}
