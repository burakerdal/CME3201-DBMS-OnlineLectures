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
    public class BLStCourses
    {
        public static DataTable SelectData()
        {
            return FStCourses.SelectData();
        }

        public static string Insert(EStCourses stCourses)
        {
            FStCourses.InsertStCourse(stCourses);
            return "";

        }

        public static string InsertStCourse(EStCourses StCourses)
        {
            int res = FStCourses.InsertStCourse(StCourses);
            string message = "bl";
            if (res>0)
            {
                message = "kurs seçimi başarılı, kurslarıma eklendi";
            }
            else
            {
                message = "kurs seçimi başarısız";
            }

            return message;
        }

        public static DataTable SelectStCourseData(string nick)
        {
            return FStCourses.SelectStCourseData(nick);
        }
    }
}
