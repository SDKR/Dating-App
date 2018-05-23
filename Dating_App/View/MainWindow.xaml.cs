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

namespace Dating_App
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
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
