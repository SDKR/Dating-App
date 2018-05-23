using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Configuration;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Dating_App.Model;
using System.Data.SqlClient;

namespace Dating_App.DBConnect
{
    class FrontPageDBConnector
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        // Create User DBconnection
        public Boolean CreateUser(User user)
        {

            // Creates todays date for fussy Mr. database
            String formatsdate = @"MM\/dd\/yyyy HH:mm";
            DateTime localDate = DateTime.Now;
            var cultureInfo = new CultureInfo("fr-FR");
            string today = localDate.ToString(formatsdate);

            //Your Stored Procedure Command
            SqlCommand cmd = new SqlCommand("spCreate_New_User", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Profile_name", user.Profile_name);
            cmd.Parameters.AddWithValue("Password", user.Password);
            cmd.Parameters.AddWithValue("Creation_Date", today);
            cmd.Parameters.AddWithValue("User_aktiv", 1);
            connection.Open();
            int k = cmd.ExecuteNonQuery();
            connection.Close();

            SqlCommand User_information = new SqlCommand("spCreate_User_information", connection);
            User_information.CommandType = CommandType.StoredProcedure;
            User_information.Parameters.AddWithValue("First_name", user.First_name);
            User_information.Parameters.AddWithValue("Last_name", user.Last_name);
            User_information.Parameters.AddWithValue("Birthdate", "2000-04-05");
            User_information.Parameters.AddWithValue("Gender", user.Gender);
            User_information.Parameters.AddWithValue("Seeking", user.Seeking);
            User_information.Parameters.AddWithValue("FK_Post_Code", user.Postcode);
            User_information.Parameters.AddWithValue("Email", user.Email);
            User_information.Parameters.AddWithValue("Status", user.Status);
            User_information.Parameters.AddWithValue("Sexual_orientation", user.SexualOrientation);
            User_information.Parameters.AddWithValue("Height", user.Height);
            User_information.Parameters.AddWithValue("Weight", user.Weight);
            User_information.Parameters.AddWithValue("Eyecolor", user.Eyecolor);
            User_information.Parameters.AddWithValue("Haircolor", user.Haircolor);
            User_information.Parameters.AddWithValue("Children", user.Children);
            User_information.Parameters.AddWithValue("Body_Type", user.Body_Type);
            User_information.Parameters.AddWithValue("About_Yourself", user.About_yourself);
            User_information.Parameters.AddWithValue("FK_Profile_name", user.Profile_name);
            connection.Open();
            k = User_information.ExecuteNonQuery();
            connection.Close();


            return true;
       
        }

        // Check login information
        public List<User> login(User user)
        {
            SqlCommand cmd = new SqlCommand("select * from [User], User_Information where PK_Profile_name = '" + user.Profile_name + "' and Password = '" + user.Password + "' ", connection);
            cmd.Parameters.AddWithValue("PK_Profile_name", user.Profile_name);
            cmd.Parameters.AddWithValue("Password", user.Password);
            connection.Open();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            connection.Close();

            var User_list = ds.Tables[0].AsEnumerable().Select(dataRow => new User
            {
                Profile_name = dataRow.Field<string>("PK_Profile_name"),
                Password = dataRow.Field<string>("Password"),
                //creationDate = dataRow.Field<DateTime>("Creation_Date").ToString(),
                bit = dataRow.Field<int>("User_aktiv"),
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

        // Returns list of reccomened users based on age
        public List<User> getReccomendedUsers(User user)
        {
            // KIIM! her skal databasen finde 5 brugere i ca samme alder som brugeren du får tilsendt i user.Birthdate
            List<User> userList = getReccomendedUsers(user);
            return userList;
        }

        // Updates user informaiton 
        public void updateUser(User user)
        {
            /// KIIM Her skal der laves en update. Der skal opdateres i brugerens information.
        }

    }
}
