using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using EntityLayer;

namespace FacadeLayer
{
    public class FStCourses
    {
        public static DataTable SelectData()
        {
            /*SqlCommand cmd = new SqlCommand();
            cmd.Connection = Connection.Con;
            cmd.CommandText = "select * from Student";
            SqlDataAdapter adptr = new SqlDataAdapter();
            adptr.SelectCommand = cmd;*/
            DataTable dtSelect = new DataTable();
            //adptr.Fill(dtSelect);
            return dtSelect;
        }

        public static int InsertStCourse(EStCourses stCourses)
        {
            SqlCommand cmd = new SqlCommand("spStCoursesInsert", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@snickname", stCourses.StNickName);
            cmd.Parameters.AddWithValue("@cname", stCourses.StCName);
            cmd.Parameters.AddWithValue("@cteacher", stCourses.StCTeacher);
            cmd.Parameters.AddWithValue("@clevel", stCourses.StCLevel);
            cmd.Parameters.AddWithValue("@ccost", stCourses.StCost);


            if (Connection.Con.State == ConnectionState.Closed)
            {
                Connection.Con.Open();
            }

            int effectedRow = cmd.ExecuteNonQuery();

            cmd.Dispose();
            cmd.Connection.Close();

            return effectedRow;
        }

        public static DataTable SelectStCourseData(string nick)
        {
            SqlCommand cmd = new SqlCommand("spSelectStCourses", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@snickname", nick);

            if (Connection.Con.State == ConnectionState.Closed)
            {
                Connection.Con.Open();
            }
            
            
            SqlDataAdapter adptr = new SqlDataAdapter();
            adptr.SelectCommand = cmd;
            DataTable dtSelect = new DataTable();
            adptr.Fill(dtSelect);
            return dtSelect;
        }
    }
}
