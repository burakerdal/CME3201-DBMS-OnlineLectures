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
    public class FStudent
    {
        public static DataTable SelectData()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Connection.Con;
            cmd.CommandText = "select * from Student";
            SqlDataAdapter adptr = new SqlDataAdapter();
            adptr.SelectCommand = cmd;
            DataTable dtSelect = new DataTable();
            adptr.Fill(dtSelect);
            return dtSelect;
        }

        public static string GetStudentName(string user)
        {
            string student = "";

            SqlCommand com = new SqlCommand("spStudentName", Connection.Con);
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
                    student = rd["Sname"].ToString();
                }

                com.Dispose();
                com.Connection.Close();
                return student;

            }
            com.Dispose();
            com.Connection.Close();

            return null;
        }

        public static void Insert(EStudent std)
        {
            
            SqlCommand cmd = new SqlCommand("spStudentInsert", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@nickname", std.SNickName);
            cmd.Parameters.AddWithValue("@name", std.SName);
            cmd.Parameters.AddWithValue("@gender", std.SGender);
            cmd.Parameters.AddWithValue("@age", std.SAge);
            cmd.Parameters.AddWithValue("@educationlevel", std.SEducationLevel);

            if (Connection.Con.State == ConnectionState.Closed)
            {
                Connection.Con.Open();
            }

            int effectedRow = cmd.ExecuteNonQuery();

            cmd.Dispose();
            cmd.Connection.Close();

        }
    }
}
