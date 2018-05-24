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

        // Takes a user and returns reccomened users based on age.
        public List<User> getReccomendedUsers(User user)
        {
            return MDBC.getReccomendedUsers(user);
        }

    }
}
