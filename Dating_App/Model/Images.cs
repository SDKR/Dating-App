using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.DBConnect;
using System.Data;

namespace Dating_App.Model
{
    class Images
    {
        //DataSet ds;
        ImageDBConnector IDBC = new ImageDBConnector();

        private string _imageString;

        public string ImageString
        {
            get { return _imageString; }
            set { _imageString = value; }
        }

        private string _imageName;

        public string ImageName
        {
            get { return _imageName; }
            set { _imageName = value; }
        }

        private string _UserProfile;

        public string UserProfile
        {
            get { return _UserProfile; }
            set { _UserProfile = value; }
        }


        public Boolean saveImage(Images image)
        {
            return IDBC.savePicture(image);
        }

        public DataSet getImage(string profile)
        {
            DataSet ds = IDBC.getImage(profile);
            Console.WriteLine(ds.Tables[0].Rows.Count == 0);
            return ds;
        }

    }
}
