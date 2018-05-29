using System;
using System.Collections.Generic;
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
using Dating_App.Model;
using System.Data;
using System.IO;

namespace Dating_App.View
{
    /// <summary>
    /// Interaction logic for ProfileViewPage.xaml
    /// </summary>
    public partial class ProfileViewPage : Page
    {
        Like like = new Like();
        SeSynesGodtOm_Window SW = new SeSynesGodtOm_Window();
        public ProfileViewPage()
        {
            InitializeComponent();
        }

        Images imageObj = new Images();
        public void fixpic(string user)
        {
            DataSet ds = imageObj.getImage(user);
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            like.LikeSomeone(Username_ProfilPage_Label.Content.ToString(), Dating_App.Model.User.CurrentUser.Profile_name);
            SynesGodtOm_Label.Content = like.likeCounter(Username_ProfilPage_Label.Content.ToString());
        }

        private void SeSynesGodtOm_Button_Click(object sender, RoutedEventArgs e)
        {
            SW.Datagrid.ItemsSource = like.getMyLikes(Username_ProfilPage_Label.Content.ToString());
            SW.Show();
        }

        private void Hjem_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.HomePage();
        }

        private void LogAf_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = null;
        }

        private void Profil_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.ProfilPage();
        }

        private void Søg_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.SøgPage();
        }

        private void Beskeder_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.BeskederPage();
        }

        private void Rediger_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.RedigerProfil();
        }
    }
}
