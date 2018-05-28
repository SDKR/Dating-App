using Dating_App.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Dating_App.View
{
    /// <summary>
    /// Interaction logic for ProfilPage.xaml
    /// </summary>
    public partial class ProfilPage : Page
    {
        Images imageObj = new Images();
        public ProfilPage()
        {
            InitializeComponent();
            LoadPicture();

            OmMig_ProfilPage_Label.Content = "Om " + Dating_App.Model.User.CurrentUser.Profile_name;
            Username_ProfilPage_Label.Content = Dating_App.Model.User.CurrentUser.Profile_name;

            FornavnData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.First_name;
            EfternavnData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Last_name;
            FødselsdagData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Date;
            KønData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Gender;
            StatusData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Status;
            SøgerData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Seeking;
            InteresseretIData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.SexualOrientation;
            HøjdeData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Height;
            VægtData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Weight;
            ØjenfarveData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Eyecolor;
            HårfarveData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Haircolor;
            BørnData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Children;
            KropsTypeData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Body_Type;
            PostNummerData_ProfilPage_label.Content = Dating_App.Model.User.CurrentUser.Postcode;
            BeskrivDigSelv_ProfilPage_TextBox.Text = Dating_App.Model.User.CurrentUser.About_yourself;
        }

        private void LogAf_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = null;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.HomePage();
        }

        private void Søg_HomePage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.SøgPage();
        }

        private void Beskeder_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.BeskederPage();
        }

        public void LoadPicture()
        {
            DataSet ds = imageObj.getImage(Dating_App.Model.User.CurrentUser.Profile_name);
            DataTable dataTable = ds.Tables[0];
            foreach (DataRow row in dataTable.Rows)
            {
                if (row[0].ToString() != null)
                {
                    //Store binary data read from the database in a byte array
                    byte[] blob = (byte[])row[2];
                    MemoryStream stream = new MemoryStream();
                    stream.Write(blob, 0, blob.Length);
                    stream.Position = 0;

                    System.Drawing.Image img = System.Drawing.Image.FromStream(stream);
                    BitmapImage bi = new BitmapImage();
                    bi.BeginInit();

                    MemoryStream ms = new MemoryStream();
                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Bmp);
                    ms.Seek(0, SeekOrigin.Begin);
                    bi.StreamSource = ms;
                    bi.EndInit();
                    ProfilBillede_ProfilPage_Image.Source = bi;
                }
            }
        }

        private void Rediger_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.RedigerProfil();
        }
    }
}
