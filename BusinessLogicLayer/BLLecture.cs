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
    public class BLLecture
    {
        public static DataTable SelectData()
        {
            return FLecture.SelectData();
        }

        public static string Insert(ELecture lec)
        {
            FLecture.Insert(lec);
            return "";

        }

        public static List<ELecture> GetLecture(string clevel)
        {
            // clevel e göre lecture ları getir

            List<ELecture> eLectures = FLecture.GetLecture(clevel);

            return eLectures;
        }
    }
}
