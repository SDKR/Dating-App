﻿using System;
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
using System.Windows;

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
            cmd.Parameters.AddWithValue("PK_Profile_name", user.Profile_name);
            cmd.Parameters.AddWithValue("Password", user.Password);
            cmd.Parameters.AddWithValue("Creation_Date", today);
            cmd.Parameters.AddWithValue("User_aktiv", 1);
            connection.Open();
            int k = cmd.ExecuteNonQuery();
            connection.Close();

            Console.WriteLine(user.Date);
            DateTime BirthdateConvertion = DateTime.Parse(user.Date.ToString());
            Console.WriteLine(BirthdateConvertion);

            SqlCommand User_information = new SqlCommand("spCreate_User_information", connection);
            User_information.CommandType = CommandType.StoredProcedure;
            User_information.Parameters.AddWithValue("First_name", user.First_name);
            User_information.Parameters.AddWithValue("Last_name", user.Last_name);
            User_information.Parameters.AddWithValue("Birthdate", BirthdateConvertion);
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
            SqlCommand cmd = new SqlCommand("select * from [User], User_Information where PK_Profile_name = '" + user.Profile_name + "' and Password = '" + user.Password + "' " + " and PK_Profile_name = FK_Profile_name and User_aktiv = 1", connection);
            cmd.Parameters.AddWithValue("PK_Profile_name", user.Profile_name);
            cmd.Parameters.AddWithValue("Password", user.Password);

            try
            {

                connection.Open();
                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adapt.Fill(ds);
                connection.Close();

                var User_list = ds.Tables[0].AsEnumerable().Select(dataRow => new User
                {
                    Profile_name = dataRow.Field<string>("PK_Profile_name"),
                    Password = dataRow.Field<string>("Password"),
                    creationDate = dataRow.Field<DateTime>("Creation_Date").ToString(),
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
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                throw;
            }

          
        }

        // Updates user informaiton 
        public void updateUser(User user)
        {
            SqlCommand User_Info_Update = new SqlCommand("spUpdate_User", connection);
            User_Info_Update.CommandType = CommandType.StoredProcedure;
            User_Info_Update.Parameters.AddWithValue("PK_Profile_name", user.FK_profile_name);
            User_Info_Update.Parameters.AddWithValue("Password", user.Password);
            User_Info_Update.Parameters.AddWithValue("First_name", user.First_name);
            User_Info_Update.Parameters.AddWithValue("Last_name", user.Last_name);
            User_Info_Update.Parameters.AddWithValue("Birthdate", "2000-04-05");
            User_Info_Update.Parameters.AddWithValue("Gender", user.Gender);
            User_Info_Update.Parameters.AddWithValue("Seeking", user.Seeking);
            User_Info_Update.Parameters.AddWithValue("FK_Post_Code", user.Postcode);
            User_Info_Update.Parameters.AddWithValue("Email", user.Email);
            User_Info_Update.Parameters.AddWithValue("Status", user.Status);
            User_Info_Update.Parameters.AddWithValue("Sexual_orientation", user.SexualOrientation);
            User_Info_Update.Parameters.AddWithValue("Height", user.Height);
            User_Info_Update.Parameters.AddWithValue("Weight", user.Weight);
            User_Info_Update.Parameters.AddWithValue("Eyecolor", user.Eyecolor);
            User_Info_Update.Parameters.AddWithValue("Haircolor", user.Haircolor);
            User_Info_Update.Parameters.AddWithValue("Children", user.Children);
            User_Info_Update.Parameters.AddWithValue("Body_Type", user.Body_Type);
            User_Info_Update.Parameters.AddWithValue("About_Yourself", user.About_yourself);
            User_Info_Update.Parameters.AddWithValue("FK_Profile_name", user.Profile_name);
            connection.Open();
            int k = User_Info_Update.ExecuteNonQuery();
            connection.Close();
        }

        public void deactivateUser(User user)
        {
            var sql = "UPDATE [User] SET User_aktiv = 0 where PK_Profile_name = @PK_Profile_name";
            try
            {
                using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                {
                    using (var command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.Add("@PK_Profile_name", SqlDbType.NVarChar).Value = user.Profile_name;
                        connection.Open();
                        command.ExecuteNonQuery();

                        MessageBox.Show($"User is deactivated");
                    }
                }
            }
            catch (Exception e)
            {
                MessageBox.Show($"Failed to Delete user. Error message: {e.Message}");
            }
        }
    }
}