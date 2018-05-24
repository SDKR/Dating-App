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

namespace Dating_App.View
{
    /// <summary>
    /// Interaction logic for SøgPage.xaml
    /// </summary>
    public partial class SøgPage : Page
    {
        public SøgPage()
        {
            InitializeComponent();
        }

        private void Rediger_ProfilPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.RedigerProfil();
        }

        private void Profil_HomePage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.ProfilPage();
        }

        private void Hjem_HomePage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.HomePage();
        }

        private void LogAf_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = null;
        }
    }
}
