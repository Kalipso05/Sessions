using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace WebDekstop.ViewModel
{
    public class ViewHospitalizationModel
    {
        internal static async Task PostHospitalizationObject(int patientId, string date, string time,string code, string purpose, string departament, int type, int term, string additionalInformation)
        {
            var hosData = new HospitalizationData()
            {
                CodeHospitalization = new CodeHospitalization {Code = code, PurposeHospitalization = purpose, DepartamentHospitalization = departament, IDTypeHospitalization = type, TermHospitalization = term, AdditionalInformation = additionalInformation},
                Hospitalization = new Hospitalization {IDPatient = patientId, DateOfHospitalization = DateTime.Parse(date), TimeOfHospitalization = TimeSpan.Parse(time) }
            };
            var content = new StringContent(JsonConvert.SerializeObject(hosData), Encoding.UTF8, "application/json");

            using (var client = new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/Hospitalization", content);

            }
        }
    }
}