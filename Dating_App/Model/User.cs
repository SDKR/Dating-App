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

        private string _seeking;

        public string Seeking
        {
            get { return _seeking; }
            set { _seeking = value; }
        }

        private int _Post_Code;

        public int Postcode
        {
            get { return _Post_Code; }
            set { _Post_Code = value; }
        }

        private string _email;

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        private string _Status;

        public string Status
        {
            get { return _Status; }
            set { _Status = value; }
        }

        private string _sexual_orientation;

        public string SexualOrientation
        {
            get { return _sexual_orientation; }
            set { _sexual_orientation = value; }
        }

        private int _Height;

        public int Height
        {
            get { return _Height; }
            set { _Height = value; }
        }

        private int _Weight;

        public int Weight
        {
            get { return _Weight; }
            set { _Weight = value; }
        }

        private string _Eyecolor;

        public string Eyecolor
        {
            get { return _Eyecolor; }
            set { _Eyecolor = value; }
        }

        private string _Haircolor;

        public string Haircolor
        {
            get { return _Haircolor; }
            set { _Haircolor = value; }
        }

        private string _Children;

        public string Children
        {
            get { return _Children; }
            set { _Children = value; }
        }

        private string _Body_type;

        public string Body_Type
        {
            get { return _Body_type; }
            set { _Body_type = value; }
        }

        private string _About_yourself;

        public string About_yourself
        {
            get { return _About_yourself; }
            set { _About_yourself = value; }
        }

        private int _FK_ID;

        public int FK_ID
        {
            get { return _FK_ID; }
            set { _FK_ID = value; }
        }

        private string _Confirm_Password;

        public string Confirm_Password
        {
            get { return _Confirm_Password; }
            set { _Confirm_Password = value; }
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

        public User(string Profilename, string Password, string Firstname, string lastname, DateTime birthdate, string gender, string seeking, int postcode, string email, string status, string sexualorientation, int height, int weight, string eyecolor, string haircolor, string children, string BodyType, string aboutyourself, int FK_ID)
        {
            //this._PK_ID = PK_ID;
            this._Profile_name = Profilename;
            this._Password = Password;
            //this._CreationDate = CreationDate;
            //this._infoID = PK_InfoID;
            this._First_name = Firstname;
            this._Last_name = Last_name;
            this._Last_name = lastname;
            this._Date = birthdate;
            this._gender = gender;
            this._seeking = seeking;
            this._Post_Code = postcode;
            this._email = email;
            this._Status = status;
            this._sexual_orientation = sexualorientation;
            this._Height = height;
            this._Weight = weight;
            this._Eyecolor = eyecolor;
            this._Haircolor = haircolor;
            this._Children = children;
            this._Body_type = BodyType;
            this._About_yourself = aboutyourself;
            this.FK_ID = FK_ID;

        }

        public Boolean CreateUser(User user)
        {
            //Console.WriteLine(this._Profile_name);
            return FPDB.CreateUser(user);

        }

    }

}

