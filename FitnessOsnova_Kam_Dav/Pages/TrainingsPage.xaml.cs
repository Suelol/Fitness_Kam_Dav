using FitnessOsnova_Kam_Dav.Classes;
using FitnessOsnova_Kam_Dav.DbModel;
using System;
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
            LoadTrainings(); // Загрузка тренировок при инициализации страницы
        }

        private void LoadTrainings()
        {
            using (var context = new FitnessClub_Kam_DavEntities1())
            {
                // Получение списка доступных тренировок
                var trainingsQuery = context.Trainings
                    .Select(t => new
                    {
                        TrainingType = t.TrainingType,
                        TrainerName = t.Trainers.FirstName + " " + t.Trainers.LastName,
                        Schedule = t.Schedule,
                        MaxParticipants = t.MaxParticipants
                    });

                // Выполнение запроса и преобразование результатов в TrainingViewModel
                var trainings = trainingsQuery
                    .AsEnumerable() // Переход к LINQ to Objects
                    .Select(t => new TrainingViewModel
                    {
                        Title = t.TrainingType,
                        Description = string.Concat("Тренер: ", t.TrainerName, ", ",
                                                   "Дата: ", t.Schedule.ToShortDateString(), ", ",
                                                   "Макс. участников: ", t.MaxParticipants)
                    })
                    .ToList();

                // Привязка данных к ListView
                TrainingsListView.ItemsSource = trainings;
            }
        }

        private void EnrollButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var training = button.DataContext as TrainingViewModel; // Преобразование к TrainingViewModel

            if (training != null)
            {
                // Логика для записи на тренировку
                using (var context = new FitnessClub_Kam_DavEntities1())
                {
                    var newBooking = new Bookings
                    {
                        //ClientID = /* Получите ID текущего клиента */,
                        //TrainingID = /* Получите ID выбранной тренировки, например, training.TrainingID */,
                        BookingDate = DateTime.Now,
                        Status = "Записан"
                    };

                    context.Bookings.Add(newBooking);
                    context.SaveChanges();
                }

                MessageBox.Show($"Вы записаны на тренировку: {training.Title}", "Запись на тренировку", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}