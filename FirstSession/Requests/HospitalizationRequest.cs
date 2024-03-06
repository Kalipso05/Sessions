using DataCenter.Model;
using FirstSession.Settings;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace FirstSession.Requests
{
    internal class HospitalizationRequest
    {
        internal static async Task HandlePostHospitalization(HttpListenerResponse response, HttpListenerRequest request)
        {
            using (var db = new dbModel())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        string contentType;
                        using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                        {
                            contentType = await reader.ReadToEndAsync();
                        }
                        var hospitalData = JsonConvert.DeserializeObject<HospitalizationData>(contentType);

                        if (hospitalData != null)
                        {
                            if (hospitalData.CodeHospitalization != null)
                            {
                                db.CodeHospitalization.Add(hospitalData.CodeHospitalization);
                                await db.SaveChangesAsync();
                            }
                            if (hospitalData.Hospitalization != null)
                            {
                                hospitalData.Hospitalization.IDCodeHospitalization = hospitalData.CodeHospitalization.ID;
                                db.Hospitalization.Add(hospitalData.Hospitalization);
                                await db.SaveChangesAsync();
                            }
                            transaction.Commit();
                            await Response.SendResponse(response, "Все данные госпитализации были добавлены");
                        }
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        await Response.SendResponse(response, "Переданы неккоректные данные", code: HttpStatusCode.BadRequest);
                        Logger.Log("Переданы неккоректные данные", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
                    }
                }
            }
        }
    }
}
