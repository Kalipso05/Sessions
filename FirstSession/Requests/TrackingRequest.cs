using DataCenter.Model;
using FirstSession.Settings;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace FirstSession.Requests
{
    internal class TrackingRequest
    {
        internal static async Task HandleGetTracking(HttpListenerResponse response)
        {
            using (var db = new dbModel())
            {
                try
                {
                    var trackingData = await db.SecurityAccessLog.ToListAsync();
                    await Response.SendResponse(response, JsonConvert.SerializeObject(trackingData));
                }
                catch (Exception ex)
                {
                    Logger.Log($"Ошибка: {ex.Message}", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
                    await Response.SendResponse(response, "Произошла внутренняя ошибка сервера", code: HttpStatusCode.BadRequest);
                }
            }
        }
    }
}
