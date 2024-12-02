using FitnessOsnova_Kam_Dav.DbModel;
using System.Linq;
using System.Windows.Controls;

namespace FitnessOsnova_Kam_Dav.Pages
{
    public partial class GymsPage : Page
    {
        public GymsPage()
        {
            InitializeComponent();
            LoadGyms();
        }

        private void LoadGyms()
        {
            using (var context = new FitnessClub_Kam_DavEntities1())
            {
                var gyms = context.Gyms
                    .Select(g => new
                    {
                        g.GymName,
                        g.Location,
                        g.Facilities,
                        g.Capacity
                    })
                    .ToList();

                GymsListView.ItemsSource = gyms;
            }
        }
    }
}