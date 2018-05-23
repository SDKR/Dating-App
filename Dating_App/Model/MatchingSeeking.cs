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
        FrontPageDBConnector FPDB = new FrontPageDBConnector();

        // Takes a user and returns reccomened users based on age.
        public List<User> getReccomendedUsers(User user)
        {
            List<User> userList = FPDB.getReccomendedUsers(user);
            return userList;
        }

    }
}
