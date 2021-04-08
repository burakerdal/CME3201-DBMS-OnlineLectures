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
    public class FCourse
    {
        public static DataTable SelectData()
        {
            SqlCommand cmd = new SqlCommand("spListCourse", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;

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

        public static DataTable SelectCourseData(string nick)
        {
            SqlCommand cmd = new SqlCommand("spListCourseTeacher", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@tnickname", nick);

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

        public static int Insert(ECourse course)
        {
            SqlCommand cmd = new SqlCommand("spCourseInsert", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cname", course.CName);
            cmd.Parameters.AddWithValue("@cteacher", course.CTeacher);
            cmd.Parameters.AddWithValue("@clevel", course.CLevel);
            cmd.Parameters.AddWithValue("@cost", course.Cost);

            if (Connection.Con.State == ConnectionState.Closed)
            {
                Connection.Con.Open();
            }

            int effectedRow = cmd.ExecuteNonQuery();


            cmd.Dispose();
            cmd.Connection.Close();

            return effectedRow;
        }

        public static List<ECourse> GetCourseCost(string clevel, string cname, string cteacher)
        {
            SqlCommand com = new SqlCommand("spSelectCourseCost", Connection.Con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@level", clevel);
            com.Parameters.AddWithValue("@cname", cname);
            com.Parameters.AddWithValue("@cteacher", cteacher);

            if (com.Connection.State != ConnectionState.Open)
            {
                com.Connection.Open();
            }
            List<ECourse> costlst = new List<ECourse>();
            SqlDataReader rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    costlst.Add(new ECourse
                    {
                        Cost = Convert.ToInt32(rd["Ccost"])
                    });
                }

                com.Dispose();
                com.Connection.Close();
                return costlst;

            }
            com.Dispose();
            com.Connection.Close();

            return null;
        }

        public static List<ECourse> GetCourseTeacher(string clevel, string cname)
        {
            SqlCommand com = new SqlCommand("spSelectCourseTeacher", Connection.Con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@level", clevel);
            com.Parameters.AddWithValue("@cname", cname);

            if (com.Connection.State != ConnectionState.Open)
            {
                com.Connection.Open();
            }
            List<ECourse> tlst = new List<ECourse>();
            SqlDataReader rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    tlst.Add(new ECourse
                    {
                        CTeacher = rd["Cteacher"].ToString()
                    });
                }

                com.Dispose();
                com.Connection.Close();
                return tlst;

            }
            com.Dispose();
            com.Connection.Close();

            return null;
        }

        
    }
}
