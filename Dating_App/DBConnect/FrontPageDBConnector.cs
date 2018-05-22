using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.Model;
using System.Data.SqlClient;

namespace Dating_App.DBConnect
{
    class FrontPageDBConnector
    {

        public static SqlConnection myCon = null;

        public void CreateConnection()
        {
            myCon = new SqlConnection("Data Source=GAYANI-PC;Initial Catalog=soft1;Integrated Security=True");
            myCon.Open();

        }

        // Totally real database connector
        public Boolean CreateUser(User user)
        {
            SqlConnection con = myCon;
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "Execute AddUser @name,@pwd,@type";

            cmd.Parameters.AddWithValue("@name", "Navn");
            cmd.Parameters.AddWithValue("@pwd", "Pass");
            cmd.Parameters.AddWithValue("@type", "LORT");

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            return true;
        }

    }
}
