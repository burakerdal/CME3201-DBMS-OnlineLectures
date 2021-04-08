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
    public class FUser
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

        public static int Insert(EUser user)
        {
            SqlCommand cmd = new SqlCommand("spUserInsert", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@username", user.UserName);
            cmd.Parameters.AddWithValue("@usertype", user.UserType);
            cmd.Parameters.AddWithValue("@password", user.Password);

            if (Connection.Con.State == ConnectionState.Closed)
            {
                Connection.Con.Open();
            }

            int effectedRow = cmd.ExecuteNonQuery();

            cmd.Dispose();
            cmd.Connection.Close();

            return effectedRow;

        }

        public static EUser GetUser(string nickname, string password, string status) {

            
            SqlCommand cmd = new SqlCommand("IsUserValid", Connection.Con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@nickname", nickname);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@type", status);

            if (Connection.Con.State == ConnectionState.Closed)
            {
                Connection.Con.Open();
            }

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {

                rd.Read();

                return new EUser
                {
                    UserID = Convert.ToInt32(rd["UserID"]),
                    UserName = rd["UserName"].ToString(),
                    UserType = rd["UserType"].ToString(),
                    Password = rd["Password"].ToString()

                };

            }
            cmd.Dispose();
            cmd.Connection.Close();

            return null;

        }
    }
}
