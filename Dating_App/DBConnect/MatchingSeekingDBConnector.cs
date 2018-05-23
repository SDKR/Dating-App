using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.Model;

namespace Dating_App.DBConnect
{
    class MatchingSeekingDBConnector
    {

        // Returns list of reccomened users based on age
        public List<User> getReccomendedUsers(User user)
        {
            // KIIM! her skal databasen finde 5 brugere i ca samme alder som brugeren du får tilsendt i user.Birthdate
            List<User> userList = getReccomendedUsers(user);
            return userList;
        }

    }
}
