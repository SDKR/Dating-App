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
using System.Data.SqlClient;
using System.Configuration;

namespace Dating_App
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        User userobject = new User();
        Messages message = new Messages();
        MatchingSeeking ms = new MatchingSeeking();
        DataSet ds = new DataSet();

        public MainWindow()
        {
            InitializeComponent();
            Conn_Til_ComboBox();
            Birthday_DatePicker.SelectedDate = DateTime.Today;
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

            if (userobject.login(userobject).Count != 0)
            {
                user = userobject.login(userobject)[0];
                Dating_App.Model.User.CurrentUser = user;
                Frame.Content = new Dating_App.View.HomePage();
            }
            else
            {
                MessageBox.Show("Bruger findes ikke");
            }

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

        public void Conn_Til_ComboBox()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            SqlDataAdapter data = new SqlDataAdapter("select PK_Post_code, City from Postcode_City", connection);
            data.Fill(ds, "Postcode_City");
            PostNummer_ComboBox.ItemsSource = ds.Tables[0].DefaultView;
            PostNummer_ComboBox.DisplayMemberPath = ds.Tables[0].Columns["PK_Post_code"].ToString();
            PostNummer_ComboBox.SelectedValue = ds.Tables[0].Columns["PK_Post_code"].ToString();
        }

        //private void PostNummer_TextBox_KeyUp(object sender, KeyEventArgs e)
        //{
        //    if (!Char.IsDigit((char)KeyInterop.VirtualKeyFromKey(e.Key)) & e.Key != Key.Back | e.Key == Key.Space)
        //    {
        //        e.Handled = true;
        //        MessageBox.Show("Post nummeret kan kun bestå af tal.", "Fejl", MessageBoxButton.OK, MessageBoxImage.Error);
        //    }

        //    List<MatchingSeeking> getPostcode = ms.getPostCodeCity();

        //    var city = getPostcode.Where(getPostcodes => getPostcodes.GetPostCode == int.Parse(PostNummer_ComboBox.Text));
        //    Console.WriteLine(city);

        //    foreach (var item in city)
        //    {
        //        Postnr_label.Content = item.City;
        //    }
        //}


        private void PostNummer_ComboBox_DropDownClosed(object sender, EventArgs e)
        {
            List<MatchingSeeking> getPostcode = ms.getPostCodeCity();

            var city = getPostcode.Where(getPostcodes => getPostcodes.GetPostCode == int.Parse(PostNummer_ComboBox.Text));
            Console.WriteLine(city);

            foreach (var item in city)
            {
                Postnr_label.Content = item.City;
            }
        }
    }
}
