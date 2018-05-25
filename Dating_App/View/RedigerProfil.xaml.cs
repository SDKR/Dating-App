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
    /// Interaction logic for RedigerProfil.xaml
    /// </summary>
    public partial class RedigerProfil : Page
    {
        Model.User UserObject = new Model.User();
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
            Email_Textbox.Text = Dating_App.Model.User.CurrentUser.Email;
            Password_Textbox.Text = Dating_App.Model.User.CurrentUser.Password;
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

        private void Gem_PrilePage_Button_Click(object sender, RoutedEventArgs e)
        {
            UserObject.First_name = FornavnData_ProfilPage_TextBox.Text;
            UserObject.Last_name = EfternavnData_ProfilPage_TextBox.Text;
            UserObject.Date = DateTime.Parse(fødselsdag_datepicker.Text);
            UserObject.Gender = Køn_combobox.Text;
            UserObject.Status = Status_Combobox.Text;
            UserObject.Seeking = Seeking_Combobox.Text;
            UserObject.SexualOrientation = IntereseretI_Combobox.Text;
            UserObject.Height = int.Parse(HøjdeData_ProfilPage_TextBox.Text);
            UserObject.Weight = int.Parse(VægtData_ProfilPage_TextBox.Text);
            UserObject.Eyecolor = EyeColor_ComboBox.Text;
            UserObject.Haircolor = HairColor_Combobox.Text;
            UserObject.Children = Børn_Combobox.Text;
            UserObject.Body_Type = KropsType_Combobox.Text;
            UserObject.Postcode = int.Parse(PostNummerData_ProfilPage_TextBox.Text);
            UserObject.About_yourself = BeskrivDigSelv_ProfilPage_TextBox.Text;
            UserObject.Email = Email_Textbox.Text;
            UserObject.FK_profile_name = Dating_App.Model.User.CurrentUser.Profile_name;
            UserObject.Profile_name = Dating_App.Model.User.CurrentUser.Profile_name;
            UserObject.Password = Password_Textbox.Text;
            UserObject.updateUser(UserObject);

        }
    }
}
