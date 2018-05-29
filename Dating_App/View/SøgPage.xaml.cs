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
using System.IO;

namespace Dating_App.View
{
    /// <summary>
    /// Interaction logic for SøgPage.xaml
    /// </summary>
    public partial class SøgPage : Page
    {
        MatchingSeeking ms = new MatchingSeeking();
        User selecteduser = new User();
        Images imageObj = new Images();
        ProfileViewPage PVP = new ProfileViewPage();
        Like like = new Like();
        DataSet ds = new DataSet();

        public SøgPage()
        {
            InitializeComponent();
            Conn_Til_ComboBox();


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

        public void Conn_Til_ComboBox()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            SqlDataAdapter data = new SqlDataAdapter("select PK_Post_code, City from Postcode_City", connection);
            data.Fill(ds, "Postcode_City");
            PostnrMin_ComboBox.ItemsSource = ds.Tables[0].DefaultView;
            PostnrMin_ComboBox.DisplayMemberPath = ds.Tables[0].Columns["PK_Post_code"].ToString();
            PostnrMin_ComboBox.SelectedValue = ds.Tables[0].Columns["PK_Post_code"].ToString();

            PostnrMax_ComboBox.ItemsSource = ds.Tables[0].DefaultView;
            PostnrMax_ComboBox.DisplayMemberPath = ds.Tables[0].Columns["PK_Post_code"].ToString();
            PostnrMax_ComboBox.SelectedValue = ds.Tables[0].Columns["PK_Post_code"].ToString();

        }

        private void Søg_Button_Click(object sender, RoutedEventArgs e)
        {
            if (HøjdeMin_Textbox.Text == "")
            {
                ms.Height = 0;
            }
            else
            {
                ms.Height = int.Parse(HøjdeMin_Textbox.Text);
            }

            if (HøjdeMax_Textbox.Text == "")
            {
                ms.Height1 = 2147483647;
            }
            else
            {
                ms.Height1 = int.Parse(HøjdeMax_Textbox.Text);
            }

            if (VægtMin_Textbox.Text == "")
            {
                ms.Weight = 0;
            }
            else
            {
                ms.Weight = int.Parse(VægtMin_Textbox.Text);
            }

            if (VægtMax_Textbox.Text == "")
            {
                ms.Weight1 = 2147483647;
            }
            else
            {
                ms.Weight1 = int.Parse(VægtMax_Textbox.Text);
            }

            if (FødselsdagMin_Datepicker.Text == "")
            {
                ms.Date = Convert.ToDateTime("1800-01-01");
            }
            else
            {
                ms.Date = DateTime.Parse(FødselsdagMin_Datepicker.Text);
            }

            if (FødeelsdagMax_datepicker.Text == "")
            {
                ms.Date1 =  Convert.ToDateTime("9000-01-01");
            }
            else
            {
                ms.Date1 = DateTime.Parse(FødeelsdagMax_datepicker.Text);
            }

            if (PostnrMin_ComboBox.Text == "")
            {
                ms.Postcode = 1000;
            }
            else
            {
                ms.Postcode = int.Parse(PostnrMin_ComboBox.Text);
            }

            if (PostnrMax_ComboBox.Text == "")
            {
                ms.Postcode1 = 9990;
            }
            else
            {
                ms.Postcode1 = int.Parse(PostnrMax_ComboBox.Text);
            }
            ms.First_name = Fornavn_textbox.Text;
            ms.Last_name = Efternavn_textbox.Text;
            ms.Gender = Køn_combobox.Text;
            ms.Seeking = Søger_combobox.Text;
            ms.Status = Status_Combobox.Text;
            ms.SexualOrientation = IntereseretI_Combobox.Text;
            ms.Eyecolor = Øjenfarve_combobox.Text;
            ms.Haircolor = Hårfarve_combobox.Text;
            ms.Children = Børn_Combobox.Text;
            ms.Body_Type = Kropstype_Combobox.Text;
            ms.FK_profile_name = Dating_App.Model.User.CurrentUser.Profile_name;

            ResultaterForSøgning_datagrid.ItemsSource = ms.search(ms);

        }

        private void ResultaterForSøgning_datagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selecteduser = (User)ResultaterForSøgning_datagrid.SelectedItem;
        }

        private void ResultaterForSøgning_datagrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
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
            PVP.SynesGodtOm_Label.Content = like.likeCounter(selecteduser.FK_profile_name);

            LoadPicture();


            (Application.Current.MainWindow.FindName("Frame") as Frame).Content = PVP;
        }

        public void LoadPicture()
        {
            DataSet ds = imageObj.getImage(selecteduser.Profile_name);
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
                    PVP.ProfilBillede_ProfilPage_Image.Source = bi;
                }
            }
        }
    }
}
