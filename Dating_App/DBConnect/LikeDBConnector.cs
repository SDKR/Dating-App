using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.Model;

namespace Dating_App.DBConnect
{
    class LikeDBConnector
    {

        public Boolean likeSomeone(string liked, string likedBy)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {

                    // Creates todays date for fussy Mr. database
                    String formatsdate = @"MM\/dd\/yyyy HH:mm";
                    //DateTime thisDate = new DateTime();
                    DateTime localDate = DateTime.Now;
                    var cultureInfo = new CultureInfo("fr-FR");
                    string today = localDate.ToString(formatsdate);

                    command.Connection = connection;            // <== lacking
                    command.CommandType = CommandType.Text;
                    command.CommandText = "INSERT into Likes (Liked, [Like_By], Creation_Date) VALUES (@Liked, @Like_By, @Creation_Date)";
                    command.Parameters.AddWithValue("@Liked", liked);
                    command.Parameters.AddWithValue("@Like_By", likedBy);
                    command.Parameters.AddWithValue("@Creation_Date", today);
                    try
                    {
                        connection.Open();
                        int recordsAffected = command.ExecuteNonQuery();
                        return true;
                    }
                    catch (SqlException e)
                    {
                        Console.WriteLine("Like Error");
                        Console.WriteLine(e);
                        return false;
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }
        }

        public int likeCounter(User user)
        {
            // Get account balance
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select COUNT(Liked) from Likes where Liked = " + user.Profile_name + "group by Liked ", sqlConn);

            try
            {
                sqlConn.Open();
                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adapt.Fill(ds);
                sqlConn.Close();

                int likenumber = int.Parse(ds.Tables[0].Rows[0][0].ToString());
                return likenumber;
            }
            catch (Exception e)
            {
                Console.WriteLine("error" + e);
                return 0;
                throw;
            }

        }

    }
}
