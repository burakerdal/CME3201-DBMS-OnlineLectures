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
    public class BLStudent
    {
        public static DataTable SelectData()
        {
            return FStudent.SelectData();
        }

        public static void InsertStudent(EStudent eStudent)
        {
            FStudent.Insert(eStudent);
        }

        public static string GetStudentName(string user)
        {
            string studentname = FStudent.GetStudentName(user);

            return studentname;
        }
    }
}
