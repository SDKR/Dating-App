﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Dating_App.DBConnect
{
    class FrontPageDBConnector
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        //public static string constring = @"server=SKAB4-PC-01\KIM;database=dateingappDatabase;UID=sa;password=Pa$$w0rd";
        // Totally real database connector
        public Boolean CreateUser(string Profile_Name)
        {

            // Creates todays date for fussy Mr. database
            String formatsdate = @"MM\/dd\/yyyy HH:mm";
            DateTime localDate = DateTime.Now;
            var cultureInfo = new CultureInfo("fr-FR");
            string today = localDate.ToString(formatsdate);

            //Your Stored Procedure Command
            SqlCommand cmd = new SqlCommand("spCreate_New_User", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Profile_name", "Wm");
            cmd.Parameters.AddWithValue("Password", "Kim");
            cmd.Parameters.AddWithValue("Creation_Date", today);
            cmd.Parameters.AddWithValue("User_aktiv", 1);
            connection.Open();
            int k = cmd.ExecuteNonQuery();
            connection.Close();


            return true;

            
        }

    }
}
