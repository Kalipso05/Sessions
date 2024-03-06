using DataCenter.Model;
using FirstSession.Settings;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace FirstSession.Requests
{
    internal class PatientRequest
    {
        internal static async Task HandlePostPatient(HttpListenerResponse response, HttpListenerRequest request)
        {
            using (var db = new dbModel())
            {
                using(var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        string contentType;
                        using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                        {
                            contentType = await reader.ReadToEndAsync();
                        }
                        var patientData = JsonConvert.DeserializeObject<PatientData>(contentType);

                        if (patientData != null)
                        {
                            if (patientData.Passport != null)
                            {
                                db.Passport.Add(patientData.Passport);
                                await db.SaveChangesAsync();
                            }
                            if (patientData.InsuransePolicy != null)
                            {
                                db.InsuransePolicy.Add(patientData.InsuransePolicy);
                                await db.SaveChangesAsync();
                            }
                            if (patientData.InsuranseCompany != null)
                            {
                                db.InsuranseCompany.Add(patientData.InsuranseCompany);
                                await db.SaveChangesAsync();
                            }
                            if (patientData.MedicalCard != null)
                            {
                                db.MedicalCard.Add(patientData.MedicalCard);
                                await db.SaveChangesAsync();
                            }
                            if (patientData.Patient != null)
                            {
                                patientData.Patient.IDPassport = patientData.Passport.ID;
                                patientData.Patient.IDMedicalCard = patientData.MedicalCard.ID;
                                patientData.Patient.IDInsuranseCompany = patientData.InsuranseCompany.ID;
                                patientData.Patient.IDInsuransePolicy = patientData.InsuransePolicy.ID;

                                db.Patient.Add(patientData.Patient);
                                await db.SaveChangesAsync();

                            }
                            transaction.Commit();
                            await Response.SendResponse(response, "Все данные пациента были добавлены");
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
