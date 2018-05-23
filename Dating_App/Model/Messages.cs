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

        private string _user1;

        public string User1
        {
            get { return _user1; }
            set { _user1 = value; }
        }

        private string _user2;

        public string User2
        {
            get { return _user2; }
            set { _user2 = value; }
        }

        private string _sender;

        public string Sender
        {
            get { return _sender; }
            set { _sender = value; }
        }


        private string _message;

        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }



        public void getConversation (string user1, string user2)
        {
               
        }

    }
}
