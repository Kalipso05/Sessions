using FirstSession.Requests;
using FirstSession.Settings;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace FirstSession
{
    internal class Program
    {
        internal static async Task RouteRequest(HttpListenerResponse response, HttpListenerRequest request)
        {
            var path = request.Url.AbsolutePath;
            var method = request.HttpMethod;

            if(path.StartsWith("/api/Patient"))
            {
                switch(method)
                {
                    case "POST":
                        Logger.Log($"Выполнен {method} запрос по адресу {path}");
                        await PatientRequest.HandlePostPatient(response, request);
                        break;
                }
            }
            else if (path.StartsWith("/api/Hospitalization"))
            {
                switch (method)
                {
                    case "POST":
                        await HospitalizationRequest.HandlePostHospitalization(response, request);
                        Logger.Log($"Выполнен {method} запрос по адресу {path}");
                        break;
                }
            }
            else if (path.StartsWith("/api/tracking"))
            {
                switch(method)
                {
                    case "GET":
                        await TrackingRequest.HandleGetTracking(response);
                        Logger.Log($"Выполнен {method} запрос по адресу {path}");
                        break;
                }
            }
        }

        private static async Task StartServer()
        {
            HttpListener listener = new HttpListener();
            listener.Prefixes.Add("http://localhost:8080/api/");
            listener.Start();
            Logger.Log("Сервер успешно запушен", consoleColor: ConsoleColor.DarkGray);

            while (true)
            {
                var context = await listener.GetContextAsync();
                await RouteRequest(context.Response, context.Request);
            }
        }

        static void Main(string[] args)
        {
            Task.Run(() => StartServer()).GetAwaiter().GetResult();
        }
    }
}
