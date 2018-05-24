using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.DBConnect;

namespace Dating_App.Model
{
    class Messages
    {

        MessageDBConnector MDBC = new MessageDBConnector();

        // properties + getters and setters

        private int _messageID;

        public int MessageID
        {
            get { return _messageID; }
            set { _messageID = value; }
        }

        private string _FK_Sender;

        public string Sender
        {
            get { return _FK_Sender; }
            set { _FK_Sender = value; }
        }

        private string _FK_Reciver;

        public string Reciver
        {
            get { return _FK_Reciver; }
            set { _FK_Reciver = value; }
        }

        //private string _sender;

        //public string Sender
        //{
        //    get { return _sender; }
        //    set { _sender = value; }
        //}


        private string _message;

        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }

        /*
         * Message Methods 
         */

        // Returns The entire conversation between two given users
        public List<Messages> getConversation (string user1, string user2)
        {
            return MDBC.getMessages(user1, user2);
        }

        // Saves message and returns boolean to say wether it was successful
        public Boolean saveMessage (Messages message)
        {
            return MDBC.saveMessage(message);
        }

        public List<User> CurrentConversationList(User user)
        {
            return MDBC.CurrentConversationList(user);
        }

    }
}
