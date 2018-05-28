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
            string biseksuelsnyd = "";
            if (user.SexualOrientation == "Heteroseksuel" && user.Gender == "Mand")
            {
                user.Gender = "Kvinde";
                biseksuelsnyd = "Biseksuel";
            }
            else if (user.SexualOrientation == "Heteroseksuel" && user.Gender == "Kvinde")
            {
                user.Gender = "Mand";
                biseksuelsnyd = "Biseksuel";
            }
            else if (user.SexualOrientation == "Biseksuel")
            {
                user.Gender = "nd";
                biseksuelsnyd = "Heterosesuel";
            }
            else if (user.SexualOrientation == "Homoseksuel")
            {
                biseksuelsnyd = "Biseksuel";
            }

            SqlCommand cmd = new SqlCommand("spSearch_User", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("FK_Profile_name", user.Profile_name);
            cmd.Parameters.AddWithValue("Gender", user.Gender);
            cmd.Parameters.AddWithValue("Sexual_orientationSynd", biseksuelsnyd);
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



            return User_list;
        }

        public List<User> search(MatchingSeeking MS)
        {
            SqlCommand User_Seach = new SqlCommand("spSearch_User_information", connection);
            User_Seach.CommandType = CommandType.StoredProcedure;
            User_Seach.Parameters.AddWithValue("First_name", MS.First_name);
            User_Seach.Parameters.AddWithValue("Last_name", MS.Last_name);
            User_Seach.Parameters.AddWithValue("Birthdate1", MS.Date);
            User_Seach.Parameters.AddWithValue("Birthdate2", MS.Date1);
            User_Seach.Parameters.AddWithValue("Gender", MS.Gender);
            User_Seach.Parameters.AddWithValue("Seeking", MS.Seeking);
            //User_Seach.Parameters.AddWithValue("@FK_Post_Code1", 2650);
            //User_Seach.Parameters.AddWithValue("@FK_Post_Code2", 2650);
            User_Seach.Parameters.AddWithValue("Status", MS.Status);
            User_Seach.Parameters.AddWithValue("Sexual_orientation", MS.SexualOrientation);
            User_Seach.Parameters.AddWithValue("Height1", MS.Height);
            User_Seach.Parameters.AddWithValue("Height2", MS.Height1);
            User_Seach.Parameters.AddWithValue("Weight1", MS.Weight);
            User_Seach.Parameters.AddWithValue("Weight2", MS.Weight1);
            User_Seach.Parameters.AddWithValue("Eyecolor", MS.Eyecolor);
            User_Seach.Parameters.AddWithValue("Haircolor", MS.Haircolor);
            User_Seach.Parameters.AddWithValue("Children", MS.Children);
            User_Seach.Parameters.AddWithValue("Body_Type", MS.Body_Type);
            User_Seach.Parameters.AddWithValue("FK_Profile_name", MS.FK_profile_name);
            SqlDataAdapter adapt = new SqlDataAdapter(User_Seach);
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
                Status = dataRow.Field<string>("Status"),
                SexualOrientation = dataRow.Field<string>("Sexual_orientation"),
                Height = dataRow.Field<int>("Height"),
                Weight = dataRow.Field<int>("Weight"),
                Eyecolor = dataRow.Field<string>("Eyecolor"),
                Haircolor = dataRow.Field<string>("Haircolor"),
                Children = dataRow.Field<string>("Children"),
                Body_Type = dataRow.Field<string>("Body_Type"),
                FK_profile_name = dataRow.Field<string>("FK_Profile_name")
            }).ToList();
            return User_list;
        }

        public List<MatchingSeeking> getPostCodeCity()
        {
            SqlCommand cmd = new SqlCommand("select * from Postcode_City", connection);
            connection.Open();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            connection.Close();

            var MS_list = ds.Tables[0].AsEnumerable().Select(dataRow => new MatchingSeeking
            {
                GetPostCode = dataRow.Field<int>("PK_Post_code"),
                City = dataRow.Field<string>("City"),

            }).ToList();

            return MS_list;
        }

    }
}
