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

        // Totally real database connector
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
            User_information.Parameters.AddWithValue("First_name", 1);
            User_information.Parameters.AddWithValue("Last_name", 1);
            User_information.Parameters.AddWithValue("Birthdate", 1);
            User_information.Parameters.AddWithValue("Gender", 1);
            User_information.Parameters.AddWithValue("Seeking", 1);
            User_information.Parameters.AddWithValue("FK_Post_Code", 1);
            User_information.Parameters.AddWithValue("Email", 1);
            User_information.Parameters.AddWithValue("Status", 1);
            User_information.Parameters.AddWithValue("Sexual_orientation", 1);
            User_information.Parameters.AddWithValue("Height", 1);
            User_information.Parameters.AddWithValue("Eyecolor", 1);
            User_information.Parameters.AddWithValue("Haircolor", 1);
            User_information.Parameters.AddWithValue("Children", 1);
            User_information.Parameters.AddWithValue("Body_Type", 1);
            User_information.Parameters.AddWithValue("About_Yourself", 1);
            connection.Open();
            k = User_information.ExecuteNonQuery();
            connection.Close();


            return true;
       
        }

    }
}
