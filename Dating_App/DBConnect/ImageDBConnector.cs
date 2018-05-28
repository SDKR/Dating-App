using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dating_App.Model;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Dating_App.DBConnect
{
    class ImageDBConnector
    {
        //Images img = new Images();

        /*
        * Save Picture to database
        */

        public Boolean savePicture(Images image)
        {
            try
            {
                if (image.ImageName != "")
                {
                    //Initialize a file stream to read the image file
                    FileStream fs = new FileStream(image.ImageName, FileMode.Open, FileAccess.Read);

                    //Initialize a byte array with size of stream
                    byte[] imgByteArr = new byte[fs.Length];

                    //Read data from the file stream and put into the byte array
                    fs.Read(imgByteArr, 0, Convert.ToInt32(fs.Length));

                    //Close a file stream
                    fs.Close();

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                    {
                        conn.Open();
                        string sql = "insert into Picture(FK_InfoID, Picture) values('" + image.UserProfile + "',@img)";
                        using (SqlCommand cmd = new SqlCommand(sql, conn))
                        {
                            //Pass byte array into database
                            cmd.Parameters.Add(new SqlParameter("img", imgByteArr));
                            int result = cmd.ExecuteNonQuery();
                            if (result == 1)
                            {
                                //BindImageList();
                                return true;
                            }
                            return false;
                        }
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }

        }

        public DataSet getImage(string profile)
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                {
                    conn.Open();

                    using (SqlDataAdapter adapter = new SqlDataAdapter("SELECT TOP 1 * FROM Picture where FK_InfoID = '" + profile + "' order by PK_Picture_ID DESC", conn))
                    {
                        ds = new DataSet("myDataSet");
                        adapter.Fill(ds);
                        //DataTable dt = ds.Tables[0];
                        return ds;

                        //cbImages.Items.Clear();

                        //foreach (DataRow dr in dt.Rows)
                        //    cbImages.Items.Add(dr["id"].ToString());

                        //cbImages.SelectedIndex = 0;
                        
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return ds;
            }
        }

    }
}
