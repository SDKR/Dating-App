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

namespace Dating_App.View
{
    /// <summary>
    /// Interaction logic for HomePage.xaml
    /// </summary>
    public partial class HomePage : Page
    {
        MatchingSeeking MS = new MatchingSeeking();
        Messages Chat = new Messages();
        public HomePage()
        {
            InitializeComponent();
            Velkommen_Label.Content = "Velkommen " + Dating_App.Model.User.CurrentUser.First_name;
            ForslagTilDig_Datagrid.ItemsSource = MS.getReccomendedUsers(Dating_App.Model.User.CurrentUser);
            CurrentChat.ItemsSource = Chat.CurrentConversationList(Dating_App.Model.User.CurrentUser);

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
    }
}
