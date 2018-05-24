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

namespace Dating_App
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        User userobject = new User();
        Messages message = new Messages();

        public MainWindow()
        {
            InitializeComponent();
        }

        

        private void OpretBruger_Button_Click(object sender, RoutedEventArgs e)
        {
            // Uses MVVM
        }

        private void LogInd_Button_Click(object sender, RoutedEventArgs e)
        {

            User user = new User();
            userobject.Profile_name = Brugernavn_Textbox.Text;
            userobject.Password = Password_PasswordBox.Password;
            user = userobject.login(userobject)[0];

            Dating_App.Model.User.CurrentUser = user;

            Frame.Content = new Dating_App.View.HomePage();

        }

        private void Fornavn_TextBox_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (Char.IsDigit((char)KeyInterop.VirtualKeyFromKey(e.Key)) & e.Key != Key.Back | e.Key == Key.Space)
            {
                e.Handled = true;
                MessageBox.Show("Ingen tal i Fornavn", "Fejl", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Efternavn_TextBox_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (Char.IsDigit((char)KeyInterop.VirtualKeyFromKey(e.Key)) & e.Key != Key.Back | e.Key == Key.Space)
            {
                e.Handled = true;
                MessageBox.Show("Ingen tal i Efternavn", "Fejl", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void PostNummer_TextBox_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (!Char.IsDigit((char)KeyInterop.VirtualKeyFromKey(e.Key)) & e.Key != Key.Back | e.Key == Key.Space)
            {
                e.Handled = true;
                MessageBox.Show("Post nummeret kan kun bestå af tal.", "Fejl", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
    }
}
