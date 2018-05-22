﻿using System;
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

            Console.WriteLine(_Profile_name);
            Console.WriteLine(_Password);
        }

        public User(int ID, string Profilename, string Password, string CreationDate)
        {
            this._PK_ID = ID;
            this._Profile_name = Profilename;
            this._Password = Password;
            this._CreationDate = CreationDate;

            Console.WriteLine(_Profile_name, _Password, _CreationDate);
        }

        public Boolean ConfirmUserCredentials(string profile_name)
        {
            //Console.WriteLine(this._Profile_name);
            return FPDB.ConfirmCredentials(profile_name);

        }

    }

}
