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
    public class BLTeacher
    {
        public static DataTable SelectData()
        {
            return FTeacher.SelectData();
        }

        public static string Insert(ETeacher teacher)
        {
            FTeacher.Insert(teacher);
            return "";

        }

        public static void InsertTeacher(ETeacher eTeacher)
        {
            FTeacher.Insert(eTeacher);
        }

        public static string GetTeacherName(string user)
        {
            string teachername = FTeacher.GetTeacherName(user);

            return teachername;
        }
    }
}
