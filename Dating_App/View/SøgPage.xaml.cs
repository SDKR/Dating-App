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
    /// Interaction logic for SøgPage.xaml
    /// </summary>
    public partial class SøgPage : Page
    {
        MatchingSeeking ms = new MatchingSeeking();
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

        private void Beskeder_SøgPage_Button_Click(object sender, RoutedEventArgs e)
        {
            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = new Dating_App.View.BeskederPage();
        }

        private void Søg_Button_Click(object sender, RoutedEventArgs e)
        {
            ms.First_name = Fornavn_textbox.Text;
            ms.Last_name = Efternavn_textbox.Text;
            ms.Height = int.Parse(HøjdeMin_Textbox.Text);
            ms.Height1 = int.Parse(HøjdeMax_Textbox.Text);
            ms.Weight = int.Parse(VægtMin_Textbox.Text);
            ms.Weight1 = int.Parse(VægtMax_Textbox.Text);
            ms.Date = DateTime.Parse(FødselsdagMin_Datepicker.Text);
            ms.Date1 = DateTime.Parse(FødeelsdagMax_datepicker.Text);
            ms.Gender = Køn_combobox.Text;
            ms.Seeking = Søger_combobox.Text;
            ms.Status = Status_Combobox.Text;
            ms.SexualOrientation = IntereseretI_Combobox.Text;
            ms.Eyecolor = Øjenfarve_combobox.Text;
            ms.Haircolor = Hårfarve_combobox.Text;
            ms.Children = Børn_Combobox.Text;
            ms.Body_Type = Kropstype_Combobox.Text;

            
            ResultaterForSøgning_datagrid.ItemsSource = ms.search(ms);

        }
    }
}
