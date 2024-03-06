using DataCenter.Model;
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
using System.Windows.Threading;

namespace SecondSesion
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private TrackingService _trackingService;
        private double originalImageWidth = 7460;
        private double originalImageHeight = 2580;

        private readonly DispatcherTimer _timer;

        public MainWindow()
        {
            InitializeComponent();
            _trackingService = new TrackingService();
            _timer = new DispatcherTimer()
            {
                Interval = TimeSpan.FromSeconds(3)
            };
            _timer.Tick += Timer_Tick;
            _timer.Start();

        }

        private async void Timer_Tick(object sender, EventArgs e)
        {
            var trackingData = await _trackingService.GetTrackingDataAsync();
            DisplayPeopleOnCanvas(trackingData);
        }

        private async void UpdateLocation_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var jsonResponse = await _trackingService.GetTrackingDataAsync();
                DisplayPeopleOnCanvas(jsonResponse);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private void DisplayPeopleOnCanvas(List<SecurityAccessLog> securityAccessLogs)
        {
            try
            {
                TrackingCanvas.Children.Clear();

                foreach(var person in securityAccessLogs)
                {
                    int scudNumber = person.LastSecurityPointNumber;
                    Point location = GetCanvasCoordinatesFromScudNumber(scudNumber);

                    Ellipse personMarker = new Ellipse()
                    {
                        Width = 10,
                        Height = 10,
                        Fill = person.PersonRole == "Клиент" ? Brushes.Green : Brushes.Blue
                    };
                    Canvas.SetLeft(personMarker, location.X);
                    Canvas.SetTop(personMarker, location.Y);
                    TrackingCanvas.Children.Add(personMarker);

                    string direction = person.LastSecurityPointDirection == "in" ? "Зашел" : "Вышел";
                    TextBlock textBlock = new TextBlock()
                    {
                        Text = $"{person.PersonCode}\n {person.PersonRole}\n {person.LastSecurityPointTime}\n {direction}",
                        Foreground = Brushes.Black,
                        Background = Brushes.White,
                        Padding = new Thickness(2)
                    };
                    Canvas.SetLeft(textBlock, location.X + 15);
                    Canvas.SetTop(textBlock, location.Y - 10);
                    TrackingCanvas.Children.Add(textBlock);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private Dictionary<int, Point> scudNumberToCanvas = new Dictionary<int, Point>()
        {
            {15, new Point(1177,1646) },
            {21, new Point(2179, 930) },
        };

        private Point GetCanvasCoordinatesFromScudNumber(int scudNumber)
        {
            try
            {
                if (scudNumberToCanvas.TryGetValue(scudNumber, out Point imageCoordinates))
                {
                    double scaleX = TrackingCanvas.ActualWidth / originalImageWidth;
                    double scaleY = TrackingCanvas.ActualHeight / originalImageHeight;

                    double canvasX = imageCoordinates.X * scaleX;
                    double canvasY = imageCoordinates.Y * scaleY;
                    return new Point(canvasX, canvasY);
                }
                else
                {
                    return new Point(0, 0);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
                return new Point(0, 0);
            }
        }
    }
}
