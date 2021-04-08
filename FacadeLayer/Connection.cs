using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace FacadeLayer
{
    public class Connection
    {
        public static readonly SqlConnection Con = new SqlConnection(@"server=****;database=OnlineLectures;Trusted_Connection=true;MultipleActiveResultSets=True;");

        // **** your Microsoft SQL Server Name 
    }

}
