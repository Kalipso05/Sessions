using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SecondSesion
{
    internal class TrackingService
    {
        private readonly HttpClient _httpClient;
        private const string URL = "http://localhost:8080/api/tracking";

        public TrackingService()
        {
            _httpClient = new HttpClient();
        }

        public async Task<List<SecurityAccessLog>> GetTrackingDataAsync()
        {
            var response = await _httpClient.GetAsync(URL);
            if(response.IsSuccessStatusCode)
            {
                var jsonResponse = await response.Content.ReadAsStringAsync();

                var trackingData = JsonConvert.DeserializeObject<List<SecurityAccessLog>>(jsonResponse);
                return trackingData;
            }
            else
            {
                throw new HttpRequestException($"Ошибка: {response.ReasonPhrase}");
            }
        }
    }
}
