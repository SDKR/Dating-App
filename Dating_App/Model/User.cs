using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.ViewModel;
using Dating_App.DBConnect;
using System.Windows;

namespace Dating_App.Model
{

    class User : ObservableObject
    {
        FrontPageDBConnector FPDB = new FrontPageDBConnector();

        private int _PK_ID;
        private string _Profile_name;
        private string _Password;
        private string _CreationDate;
        private int _bit;

        public int PK_ID
        {
            get { return _PK_ID; }
            set { _PK_ID = value; }
        }

        public string Profile_name
        {
            get { return _Profile_name; }
            set { _Profile_name = value;
                OnPropertyChanged("Profile_name");
                //testprint();
            }
        }

        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }

        public string creationDate
        {
            get { return _CreationDate; }
            set { _CreationDate = value; }
        }

        public int bit
        {
            get { return _bit; }
            set { _bit = value; }
        }

        private int _infoID;

        public int InfoID
        {
            get { return _infoID; }
            set { _infoID = value; }
        }

        private string _First_name;

        public string First_name
        {
            get { return _First_name; }
            set { _First_name = value; }
        }

        private string _Last_name;

        public string Last_name
        {
            get { return _Last_name; }
            set { _Last_name = value; }
        }

        private DateTime _Date;

        public DateTime Date
        {
            get { return _Date; }
            set { _Date = value; }
        }

        private string _gender;

        public string Gender
        {
            get { return _gender; }
            set { _gender = value; }
        }

        private int myVar;

        public int MyProperty
        {
            get { return myVar; }
            set { myVar = value; }
        }



        /*
         * Methods n' stuff
         */

        public User()
        {
            this.Profile_name = "";
            //this._Password = "";
        }

        public User(string Profilename, string Password)
        {
            this._Profile_name = Profilename;
            this._Password = Password;
        }

        public User(int ID, string Profilename, string Password, string CreationDate)
        {
            this._PK_ID = ID;
            this._Profile_name = Profilename;
            this._Password = Password;
            this._CreationDate = CreationDate;
        }

        public Boolean CreateUser(User user)
        {
            //Console.WriteLine(this._Profile_name);
            return FPDB.CreateUser(user);

        }

    }

}

