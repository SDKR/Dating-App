using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.DBConnect;

namespace Dating_App.Model
{
    class Like
    {

        private int _PK_Like_ID;

        public int PK_Like_ID
        {
            get { return _PK_Like_ID; }
            set { _PK_Like_ID = value; }
        }

        private string _Liked;

        public string Liker
        {
            get { return _Liked; }
            set { _Liked = value; }
        }

        private string _Like_by;

        public string Like_by
        {
            get { return _Like_by; }
            set { _Like_by = value; }
        }

        private DateTime _CreationTime;

        public DateTime CreationTime
        {
            get { return _CreationTime; }
            set { _CreationTime = value; }
        }

        LikeDBConnector LDB = new LikeDBConnector();

        public List<Like> getMyLikes(User user)
        {
            return 
        }

        public Boolean LikeSomeone(string liked, string liked_By)
        {
            return LDB.likeSomeone(liked, liked_By);
        }

        public int likeCounter(User user)
        {
            return LDB.likeCounter(user);
        }

    }
}
