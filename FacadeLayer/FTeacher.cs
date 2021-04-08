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
    public class FTeacher
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

        public static void Insert(ETeacher teacher)
        {
            SqlCommand cmd = new SqlCommand("spTeacherInsert", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@nickname", teacher.TNickName);
            cmd.Parameters.AddWithValue("@name", teacher.TName);
            cmd.Parameters.AddWithValue("@gender", teacher.TGender);
            cmd.Parameters.AddWithValue("@age", teacher.TAge);
            cmd.Parameters.AddWithValue("@educationlevel", teacher.TEducationLevel);

            if (Connection.Con.State == ConnectionState.Closed)
            {
                Connection.Con.Open();
            }

            int effectedRow = cmd.ExecuteNonQuery();

            cmd.Dispose();
            cmd.Connection.Close();
        }

        public static string GetTeacherName(string user)
        {
            string teacher = "";

            SqlCommand com = new SqlCommand("spTeacherName", Connection.Con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@nickname", user);

            if (com.Connection.State != ConnectionState.Open)
            {
                com.Connection.Open();
            }

            SqlDataReader rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    teacher = rd["Tname"].ToString();
                }

                com.Dispose();
                com.Connection.Close();
                return teacher;

            }
            com.Dispose();
            com.Connection.Close();

            return null;
        }
    }
}
