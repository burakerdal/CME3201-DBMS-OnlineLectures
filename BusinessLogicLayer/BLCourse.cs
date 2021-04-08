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
    public class BLCourse
    {
        public static DataTable SelectData()
        {
            return FCourse.SelectData();
        }
        public static DataTable SelectCourseData(string nick)
        {
            return FCourse.SelectCourseData(nick);
        }

        public static string InsertCourse(ECourse course)
        {
            string res = "";
            int q = FCourse.Insert(course);
            if (q > 0){
                res = "kurs kaydı başarılı";
            }
            else {
                res = "kurs kaydında hata var";
            }
            

            return res;

        }

        public static List<ECourse> GetCourseTeacher(string clevel, string cname)
        {
            List<ECourse> courseTeachers = FCourse.GetCourseTeacher(clevel, cname);

            return courseTeachers;
        }

        public static List<ECourse> GetCourseCost(string clevel, string cname, string cteacher)
        {
            List<ECourse> courseCost = FCourse.GetCourseCost(clevel, cname, cteacher);

            return courseCost;
        }

       
    }
}
