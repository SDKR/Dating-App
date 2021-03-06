﻿using System;
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
    /// Interaction logic for HomePage.xaml
    /// </summary>
    public partial class HomePage : Page
    {
        MatchingSeeking MS = new MatchingSeeking();
        Messages Chat = new Messages();
        Images imageObj = new Images();
        ProfileViewPage PVP = new ProfileViewPage();
        User selecteduser = new User();
        

        public HomePage()
        {
            InitializeComponent();
            Velkommen_Label.Content = "Velkommen " + Dating_App.Model.User.CurrentUser.First_name;
            ForslagTilDig_Datagrid.ItemsSource = MS.getReccomendedUsers(Dating_App.Model.User.CurrentUser);
            
            LoadPicture();
        }

       

        private void LogAf_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = null;
        }

        private void Profil_HomePage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.ProfilPage();
        }

        private void Rediger_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.RedigerProfil();
        }

        private void Søg_HomePage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.SøgPage();
        }

        private void Beskeder_HomePage_Button_Click(object sender, RoutedEventArgs e)
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
                    ProfilBillede_HomePage_Image.Source = bi;
                }
            }
        }

        private void ForslagTilDig_Datagrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            PVP.Username_ProfilPage_Label.Content = selecteduser.FK_profile_name;
            PVP.FornavnData_ProfilPage_label.Content = selecteduser.First_name;
            PVP.EfternavnData_ProfilPage_label.Content = selecteduser.Last_name;
            PVP.FødselsdagData_ProfilPage_label.Content = selecteduser.Date;
            PVP.KønData_ProfilPage_label.Content = selecteduser.Gender;
            PVP.StatusData_ProfilPage_label.Content = selecteduser.Status;
            PVP.SøgerData_ProfilPage_label.Content = selecteduser.Seeking;
            PVP.InteresseretIData_ProfilPage_label.Content = selecteduser.SexualOrientation;
            PVP.HøjdeData_ProfilPage_label.Content = selecteduser.Height;
            PVP.VægtData_ProfilPage_label.Content = selecteduser.Weight;
            PVP.ØjenfarveData_ProfilPage_label.Content = selecteduser.Eyecolor;
            PVP.HårfarveData_ProfilPage_label.Content = selecteduser.Haircolor;
            PVP.BørnData_ProfilPage_label.Content = selecteduser.Children;
            PVP.KropsTypeData_ProfilPage_label.Content = selecteduser.Body_Type;
            PVP.PostNummerData_ProfilPage_label.Content = selecteduser.Postcode;
            PVP.BeskrivDigSelv_ProfilPage_TextBox.Text = selecteduser.About_yourself;

            LoadPicture();

            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = PVP;
        }

        private void ForslagTilDig_Datagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selecteduser = (User)ForslagTilDig_Datagrid.SelectedItem;
        }
    }
}
