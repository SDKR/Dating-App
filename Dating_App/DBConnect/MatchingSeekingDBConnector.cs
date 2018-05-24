using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.Model;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Dating_App.DBConnect
{
    class MatchingSeekingDBConnector
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        // Returns list of reccomened users based on age
        public List<User> getReccomendedUsers(User user)
        {
            if (user.SexualOrientation == "Heteroseksuel" && user.Gender == "Mand")
            {
                user.Gender = "Kvinde";
            }
            else if (user.SexualOrientation == "Heteroseksuel" && user.Gender == "Kvinde")
            {
                user.Gender = "Mand";
            }
            else if (user.SexualOrientation == "Biseksuel")
            {
                user.Gender = "nd";
            }

            SqlCommand cmd = new SqlCommand("spSearch_User", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("FK_Profile_name", user.Profile_name);
            cmd.Parameters.AddWithValue("Gender", user.Gender);
            connection.Open();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            connection.Close();

            var User_list = ds.Tables[0].AsEnumerable().Select(dataRow => new User
            {
                First_name = dataRow.Field<string>("First_Name"),
                Last_name = dataRow.Field<string>("Last_Name"),
                Date = dataRow.Field<DateTime>("Birthdate"),
                Gender = dataRow.Field<string>("Gender"),
                Seeking = dataRow.Field<string>("Seeking"),
                Postcode = dataRow.Field<int>("FK_Post_Code"),
                Email = dataRow.Field<string>("Email"),
                Status = dataRow.Field<string>("Status"),
                SexualOrientation = dataRow.Field<string>("Sexual_orientation"),
                Height = dataRow.Field<int>("Height"),
                Weight = dataRow.Field<int>("Weight"),
                Eyecolor = dataRow.Field<string>("Eyecolor"),
                Haircolor = dataRow.Field<string>("Haircolor"),
                Children = dataRow.Field<string>("Children"),
                Body_Type = dataRow.Field<string>("Body_Type"),
                About_yourself = dataRow.Field<string>("About_Yourself"),
                FK_profile_name = dataRow.Field<string>("FK_Profile_name")
            }).ToList();


            // KIIM! her skal databasen finde 5 brugere i ca samme alder som brugeren du får tilsendt i user.Birthdate
            List<User> userList = getReccomendedUsers(user);
            return userList;
        }

    }
}
