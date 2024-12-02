using FitnessOsnova_Kam_Dav.DbModel;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace FitnessOsnova_Kam_Dav.Pages
{
    public partial class FeedbackPage : Page
    {
        public FeedbackPage()
        {
            InitializeComponent();
            LoadFeedback();
        }

        private void LoadFeedback()
        {
            using (var context = new FitnessClub_Kam_DavEntities1())
            {
                var feedbacks = context.Feedback
                    .Where(f => f.ClientID == CurrentUser.ID) // Загрузка отзывов текущего клиента
                    .Select(f => new
                    {
                        f.Comment,
                        f.Rating,
                        FeedbackDate = f.FeedbackDate.HasValue ? f.FeedbackDate.Value.ToString("g") : "Не указана"
                    })
                    .ToList();

                FeedbackListView.ItemsSource = feedbacks;
            }
        }

        private void AddFeedbackButton_Click(object sender, RoutedEventArgs e)
        {
            var comment = CommentTextBox.Text;
            var ratingText = RatingTextBox.Text;

            if (string.IsNullOrEmpty(comment) || string.IsNullOrEmpty(ratingText) || !int.TryParse(ratingText, out int rating) || rating < 1 || rating > 5)
            {
                MessageBox.Show("Пожалуйста, введите корректный отзыв и оценку (от 1 до 5).", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            using (var context = new FitnessClub_Kam_DavEntities1())
            {
                var newFeedback = new Feedback
                {
                    ClientID = CurrentUser.ID,
                    TrainerID = null, // Укажите ID тренера, если это необходимо
                    Rating = rating,
                    Comment = comment,
                    FeedbackDate = DateTime.Now
                };

                context.Feedback.Add(newFeedback);
                context.SaveChanges();
            }

            MessageBox.Show("Ваш отзыв был успешно добавлен!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            LoadFeedback(); // Обновляем список отзывов
            CommentTextBox.Clear(); // Очищаем текстовое поле
            RatingTextBox.Clear(); // Очищаем текстовое поле
        }
    }
}