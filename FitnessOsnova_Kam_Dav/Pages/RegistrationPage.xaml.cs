﻿using FitnessOsnova_Kam_Dav.DbModel;
using System;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace FitnessOsnova_Kam_Dav.Pages
{
    public partial class RegistrationPage : Page
    {
        private Users newUser;

        public RegistrationPage()
        {
            InitializeComponent();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            // Проверка, доступна ли навигация
            if (NavigationService.CanGoBack)
            {
                NavigationService.GoBack();
            }
            else
            {
                // Закрыть приложение, если нельзя вернуться назад
                Application.Current.Shutdown();
            }
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            string name = NameTextBox.Text;
            string login = LoginTextBox.Text;
            string password = PasswordBox.Password;
            string confirmPassword = ConfirmPasswordBox.Password;

            // Проверка на пустые поля
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(login) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Проверка на совпадение паролей
            if (password != confirmPassword)
            {
                MessageBox.Show("Пароли не совпадают.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            using (var context = new FitnessClub_Kam_DavEntities1())
            {
                // Проверка на существование пользователя с таким логином
                var existingUser = context.Users.FirstOrDefault(u => u.Login == login);
                if (existingUser != null)
                {
                    MessageBox.Show("Пользователь с таким логином уже существует!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                using (FitnessClub_Kam_DavEntities1 db = new FitnessClub_Kam_DavEntities1())
                {
                    var newUser = new Users
                    {
                        Name = "Имя",
                        Login = "Логин",
                        Password = "Пароль"
                    };

                    db.Users.Add(newUser);
                    db.SaveChanges();
                }

                try
                {
                    // Добавление нового пользователя
                    context.Users.Add(newUser);
                    context.SaveChanges(); // Сохранение изменений в базе данных

                    MessageBox.Show("Регистрация прошла успешно!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);

                    // Перейти на страницу авторизации или на главную страницу
                    NavigationService.Navigate(new AuthPage());
                }
                catch (DbUpdateException ex)
                {
                    // Выводим больше информации об ошибке
                    var innerException = ex.InnerException?.InnerException;
                    string errorMessage = innerException != null ? innerException.Message : ex.Message;
                    MessageBox.Show($"Ошибка при обновлении базы данных: {errorMessage}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Произошла ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}