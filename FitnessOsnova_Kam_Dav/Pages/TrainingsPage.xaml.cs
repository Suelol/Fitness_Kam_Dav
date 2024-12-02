using FitnessOsnova_Kam_Dav.DbModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace FitnessOsnova_Kam_Dav.Pages
{
    public partial class TrainingsPage : Page
    {
        public TrainingsPage()
        {
            InitializeComponent();
            LoadTrainings();
        }

        private void LoadTrainings()
        {
            using (var context = new FitnessClub_Kam_DavEntities1())
            {
                var trainings = context.Trainings.ToList();
                TrainingsListView.ItemsSource = trainings;
            }
        }

        private void BookTrainingButton_Click(object sender, RoutedEventArgs e)
        {
            // Логика для записи на тренировку
            MessageBox.Show("Вы записались на тренировку!");
        }
    }
}