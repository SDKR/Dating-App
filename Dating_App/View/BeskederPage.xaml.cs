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
    /// Interaction logic for BeskederPage.xaml
    /// </summary>
    public partial class BeskederPage : Page
    {
        Messages message = new Messages();
        User user = new User();

        public BeskederPage()
        {
            InitializeComponent();
            //Chat_person_Combobox.ItemsSource = message.CurrentConversationList(Dating_App.Model.User.CurrentUser);
            List<User> user = message.CurrentConversationList(Dating_App.Model.User.CurrentUser);

            for (int i = 0; i < user.Count; i++)
            {

                if (user[i].Profile_name != Dating_App.Model.User.CurrentUser.Profile_name)
                {
                    Chat_person_Combobox.Items.Add(user[i].Profile_name);
                }
                
            }
        }

        private void Hjem_BeskederPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.HomePage();
        }

        private void Profil_BeskederPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.ProfilPage();
        }

        private void Søg_BeskederPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.SøgPage();
        }

        private void Rediger_BeskederPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.RedigerProfil();
        }

        private void LogAf_BeskederPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = null;
        }

        private void Chat_person_Combobox_DropDownClosed(object sender, EventArgs e)
        {
            Indbakke_datagrid.ItemsSource = message.getConversation(Dating_App.Model.User.CurrentUser.Profile_name, Chat_person_Combobox.Text);
            NyBesked_Textbox.Text = Chat_person_Combobox.Text;
        }

        private void Hjem_BeskederPage_Button_Click_1(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.HomePage();
        }

        private void Send_BeskedPage_Button_Click(object sender, RoutedEventArgs e)
        {
            message.Reciver = NyBesked_Textbox.Text;
            message.Message = Besked_Textox.Text;
            message.Sender = Dating_App.Model.User.CurrentUser.Profile_name;
            message.saveMessage(message);
            Besked_Textox.Text = null;
            Indbakke_datagrid.ItemsSource = message.getConversation(Dating_App.Model.User.CurrentUser.Profile_name, Chat_person_Combobox.Text);
        }
    }
}
