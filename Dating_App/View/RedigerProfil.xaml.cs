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

namespace Dating_App.View
{
    /// <summary>
    /// Interaction logic for RedigerProfil.xaml
    /// </summary>
    public partial class RedigerProfil : Page
    {
        public RedigerProfil()
        {
            InitializeComponent();

            UserName_RedigerProfil_label.Content = Dating_App.Model.User.CurrentUser.Profile_name;
            OmMig_RedigerPage_Label.Content = "Om " + Dating_App.Model.User.CurrentUser.Profile_name;

            FornavnData_ProfilPage_TextBox.Text = Dating_App.Model.User.CurrentUser.First_name;
            EfternavnData_ProfilPage_TextBox.Text = Dating_App.Model.User.CurrentUser.Last_name;
            fødselsdag_datepicker.Text = Dating_App.Model.User.CurrentUser.Date.ToString();
            Køn_combobox.Text = Dating_App.Model.User.CurrentUser.Gender;
            Status_Combobox.Text = Dating_App.Model.User.CurrentUser.Status;
            Seeking_Combobox.Text = Dating_App.Model.User.CurrentUser.Seeking;
            IntereseretI_Combobox.Text = Dating_App.Model.User.CurrentUser.SexualOrientation;
            HøjdeData_ProfilPage_TextBox.Text = Dating_App.Model.User.CurrentUser.Height.ToString();
            VægtData_ProfilPage_TextBox.Text = Dating_App.Model.User.CurrentUser.Weight.ToString();
            EyeColor_ComboBox.Text = Dating_App.Model.User.CurrentUser.Eyecolor;
            HairColor_Combobox.Text = Dating_App.Model.User.CurrentUser.Haircolor;
            Børn_Combobox.Text = Dating_App.Model.User.CurrentUser.Children;
            KropsType_Combobox.Text = Dating_App.Model.User.CurrentUser.Body_Type;
            PostNummerData_ProfilPage_TextBox.Text = Dating_App.Model.User.CurrentUser.Postcode.ToString();
            BeskrivDigSelv_ProfilPage_TextBox.Text = Dating_App.Model.User.CurrentUser.About_yourself;
        }

        private void LogAf_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = null;
        }

        private void Profil_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.ProfilPage();
        }

        private void Hjem_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.HomePage();
        }

        private void Søg_HomePage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.SøgPage();
        }

        private void Beskeder_SøgPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.BeskederPage();
        }
    }
}
