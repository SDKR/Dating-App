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
    /// Interaction logic for ProfileViewPage.xaml
    /// </summary>
    public partial class ProfileViewPage : Page
    {
        Like like = new Like();
        SeSynesGodtOm_Window SW = new SeSynesGodtOm_Window();
        public ProfileViewPage()
        {
            InitializeComponent();
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private void SeSynesGodtOm_Button_Click(object sender, RoutedEventArgs e)
        {
            SW.Datagrid.ItemsSource = like.getMyLikes(Username_ProfilPage_Label.Content.ToString());
            SW.Show();
        }
    }
}
