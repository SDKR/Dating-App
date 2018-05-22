using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.Model;
using Dating_App.View;
using System.Windows;

namespace Dating_App.ViewModel
{
    class Presenter : ObservableObject
    {

        private User _user;

        public User _User
        {
            get
            {
                return _user;
            }
            set
            {
                _user = value;
                RaisePropertyChangedEvent("_User");
            }
        }

        private string _profile_name;

        public string Profile_Name
        {
            get { return _profile_name; }
            set { _profile_name = value;
                RaisePropertyChangedEvent("_profile_name");
            }

        }

        public Presenter()
        {
            this._user = new User();
            //Console.WriteLine(_user.Profile_name);
            this.Command = new Command(this);
        }


        public Command Command { get; set; }

        //public Presenter()
        //{
        //    this.Command = new Command(this);
        //}

            // Login Button Press
        public void CreateUser()
        {
            User user = new User(_user.Profile_name,_user.Password);

            if (_user.CreateUser(user))
            {
                MessageBox.Show("User Creation Successful");
            }
            else
            {
                MessageBox.Show("An Error occurred creating a new user");
            }
        }

        //public Presenter()
        //{
        //    _user = new User("bob", "Ymer");
        //}

    }
}
