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
    public class ViewPatientModel
    {
        internal static async Task PostPatientObject(string firstName, string lastName, string middleName, string series, string number, string worlkPlace, string insuransePolicyNumber, string insuransePolicyExpiration, string insuranseCompany, string medicalCardNumber, string medicalCardCode)
        {
            var patientData = new PatientData()
            {
                Passport = new Passport { Series = series, Number = number},
                MedicalCard = new MedicalCard { Number = medicalCardNumber, IdentificationCode = medicalCardCode},
                InsuranseCompany = new InsuranseCompany { Title = insuranseCompany},
                InsuransePolicy = new InsuransePolicy { Number = insuransePolicyNumber, DateOfExpiration = DateTime.Parse(insuransePolicyExpiration)},
                Patient = new Patient { FirstName = firstName, LastName = lastName, MiddleName = middleName, WorkPlace = worlkPlace},
                
            };
            var content = new StringContent(JsonConvert.SerializeObject(patientData), Encoding.UTF8, "application/json");

            using (var client = new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/Patient", content);

            }
        }
    }
}