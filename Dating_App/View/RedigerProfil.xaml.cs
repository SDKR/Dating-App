using Microsoft.Win32;
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
using System.Drawing.Imaging;

namespace Dating_App.View
{
    
    /// <summary>
    /// Interaction logic for RedigerProfil.xaml
    /// </summary>
    public partial class RedigerProfil : Page
    {
        Model.User UserObject = new Model.User();
        Images imageObj = new Images();

        string ImageString; // strName
        string ImageName; // imageName

        public RedigerProfil()
        {
            InitializeComponent();
            LoadPicture();

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

        /*
         * Select / Save profile image
         */

            // select picture from local pc Using filediaglog
        private void btnBrowse_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                FileDialog fldlg = new OpenFileDialog();
                fldlg.InitialDirectory = Environment.SpecialFolder.MyPictures.ToString();
                fldlg.Filter = "Image File (*.jpg;*.bmp;*.png)|*.jpg;*.bmp;*.png";
                fldlg.ShowDialog();
                {
                    ImageString = fldlg.SafeFileName;
                    ImageName = fldlg.FileName;
                    ImageSourceConverter isc = new ImageSourceConverter();
                    image.SetValue(Image.SourceProperty, isc.ConvertFromString(ImageName));
                }
                fldlg = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        // Save selected picture to database
        private void BtnSaveImage_Click(object sender, RoutedEventArgs e)
        {
            imageObj.ImageName = ImageName;
            imageObj.ImageString = ImageString;
            imageObj.UserProfile = Dating_App.Model.User.CurrentUser.Profile_name;

            if (imageObj.saveImage(imageObj))
            {
                MessageBox.Show("Billedet er gemt");
            }
            else
            {
                MessageBox.Show("Fejl");
            }

            LoadPicture();
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
                    ProfilBillede_RedigerProfilPage_Image.Source = bi;
                }
            }
        }

       
    }
}
