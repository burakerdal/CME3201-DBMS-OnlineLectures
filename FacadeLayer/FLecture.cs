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
    public class FLecture
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

        public static List<ELecture> GetLecture(string clevel)
        {
            SqlCommand com = new SqlCommand("spSelectLecture", Connection.Con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@level", clevel);

            if (com.Connection.State != ConnectionState.Open)
            {
                com.Connection.Open();
            }
            List<ELecture> lst = new List<ELecture>();
            SqlDataReader rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    lst.Add(new ELecture
                    {
                        LectureName = rd["Lname"].ToString()
                    });
                }

                com.Dispose();
                com.Connection.Close();
                return lst;

            }
            com.Dispose();
            com.Connection.Close();

            return null;
        }

        public static void Insert(ELecture lec)
        {
            
        }
    }
}
