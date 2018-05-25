using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.DBConnect;

namespace Dating_App.Model
{
    class MatchingSeeking
    {
        MatchingSeekingDBConnector MDBC = new MatchingSeekingDBConnector();

        private string _Profile_name;

        public string Profile_name
        {
            get { return _Profile_name; }
            set { _Profile_name = value; }
        }

        private int _bit;

        public int bit
        {
            get { return _bit; }
            set { _bit = value; }
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

        private DateTime _Date1;

        public DateTime Date1
        {
            get { return _Date1; }
            set { _Date1 = value; }
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

        private int _Post_Code1;

        public int Postcode1
        {
            get { return _Post_Code1; }
            set { _Post_Code1 = value; }
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

        private int _Height1;

        public int Height1
        {
            get { return _Height1; }
            set { _Height1 = value; }
        }

        private int _Weight;

        public int Weight
        {
            get { return _Weight; }
            set { _Weight = value; }
        }

        private int _Weight1;

        public int Weight1
        {
            get { return _Weight1; }
            set { _Weight1 = value; }
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

        private string _FK_Profile_name;

        public string FK_profile_name
        {
            get { return _FK_Profile_name; }
            set { _FK_Profile_name = value; }
        }

        // Takes a user and returns reccomened users based on age.
        public List<User> getReccomendedUsers(User user)
        {
            return MDBC.getReccomendedUsers(user);
        }

        public List<User> search(MatchingSeeking MS)
        {
            return MDBC.search(MS);
        }

    }
}
