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
    class MessageDBConnector
    {

        /*
         * Get messages between users
         */

        public List<Messages> getMessages(string user1, string user2)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from [Message] where FK_Sender = '" + user1 + "' and FK_Reciver = '" + user2 + "' or FK_Sender = '" + user2 + "' and FK_Reciver = '" + user1 + "'  ", connection);
            //cmd.Parameters.AddWithValue("PK_Profile_name", user.Profile_name);
            //cmd.Parameters.AddWithValue("Password", user.Password);
            connection.Open();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            connection.Close();

            var message_list = ds.Tables[0].AsEnumerable().Select(dataRow => new Messages
            {
                MessageID = dataRow.Field<int>("PK_MessageID"),
                Sender = dataRow.Field<string>("FK_Sender"),
                Reciver = dataRow.Field<string>("FK_Reciver"),
                Message = dataRow.Field<string>("Message")
            }).ToList();

            return message_list;
        }


        /*
        * Insert new message 
        */

        public Boolean saveMessage(Messages message)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {

                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = "INSERT into Message (FK_Sender, FK_Reciver, [Message]) VALUES (@FK_Sender, @FK_Reciver, @Message)";
                    command.Parameters.AddWithValue("@FK_Sender", message.Sender);
                    command.Parameters.AddWithValue("@FK_Reciver", message.Reciver);
                    command.Parameters.AddWithValue("@Message", message.Message);
                    try
                    {
                        connection.Open();
                        int recordsAffected = command.ExecuteNonQuery();
                        return true;
                    }
                    catch (SqlException e)
                    {
                        // error here
                        Console.WriteLine("Message sender Error");
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

        /*
         * Get list of users chatted to
         */

        public List<User> CurrentConversationList(User user)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select DISTINCT FK_Reciver from [Message] where FK_sender = '" + user.FK_profile_name + "' or FK_Reciver = '" + user.FK_profile_name + "' Union Select DISTINCT FK_Sender from[Message] where FK_sender = '" + user.FK_profile_name + "' or FK_Reciver = '" + user.FK_profile_name + "'", connection);
            //cmd.Parameters.AddWithValue("PK_Profile_name", user.Profile_name);
            //cmd.Parameters.AddWithValue("Password", user.Password);
            connection.Open();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            connection.Close();

            var User_Chack_List = ds.Tables[0].AsEnumerable().Select(dataRow => new User
            {
                FK_profile_name = dataRow.Field<String>("FK_Profile_name")

            }).ToList();

            return User_Chack_List;
        }


    }
}
