using Bogus;
using DataCenter.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BogusData
{
    internal class Program
    {
        static void Main(string[] args)
        {
            using (var db = new dbModel())
            {
                var genderOptions = new[] { "Мужской", "Женский" };
                var passportSeries = new[] { "4501", "4605", "4506", "4601" };
                var workPlaces = new[] { "Тинькофф", "СберБан", "ВТБ Банк", "Газпром" };
                var diagnoses = new[] { "ОРВИ", "Ангина", "Бронхит", "Рак" };


                var genders = new Faker<Gender>()
                    .RuleFor(g => g.Title, f => f.PickRandom(genderOptions))
                    .Generate(2);
                db.Gender.AddRange(genders);
                db.SaveChanges();

                var passports = new Faker<Passport>()
                    .RuleFor(p => p.Series, f => f.PickRandom(passportSeries))
                    .RuleFor(p => p.Number, f => f.Random.Number(100000, 999999).ToString())
                    .Generate(100);
                db.Passport.AddRange(passports);
                db.SaveChanges();

                var insuransePolicy = new Faker<InsuransePolicy>()
                    .RuleFor(i => i.Number, f => $"IP-{f.Random.Hexadecimal(8)}")
                    .RuleFor(i => i.DateOfExpiration, f => f.Date.Future(1))
                    .Generate(100);
                db.InsuransePolicy.AddRange(insuransePolicy);
                db.SaveChanges();

                var insuranseCompanyFaker = new Faker<InsuranseCompany>("ru")
                    .RuleFor(i => i.Title, f => f.Company.CompanyName());
                var insuranseCompanies = insuranseCompanyFaker.Generate(10);
                db.InsuranseCompany.AddRange(insuranseCompanies);
                db.SaveChanges();
                var insuranseCompanyIds = db.InsuranseCompany.Select(ic => ic.ID).ToList();

                var medicalCards = new Faker<MedicalCard>()
                    .RuleFor(m => m.Number, f => $"MC-{f.Random.Hexadecimal(8)}")
                    .RuleFor(m => m.DateOfIssue, f => f.Date.Past(10))
                    .RuleFor(m => m.DateOfLastApeal, f => f.Date.Past(3))
                    .RuleFor(m => m.DateOfNextApeal, f => f.Date.Soon(30))
                    .RuleFor(m => m.IdentificationCode, f => f.Random.Number(100000, 999999).ToString())
                    .Generate(100);
                db.MedicalCard.AddRange(medicalCards);
                db.SaveChanges();

                var patientGenerator = new Faker<Patient>("ru")
                    .RuleFor(u => u.Photo, f => f.Image.LoremFlickrUrl())
                    .RuleFor(u => u.FirstName, f => f.Name.FirstName())
                    .RuleFor(u => u.LastName, f => f.Name.LastName())
                    .RuleFor(u => u.Gender, f => f.PickRandom(genders))
                    .RuleFor(u => u.MiddleName, (f, u) =>
                    {
                        var maleMiddleName = new[] { "Александрович", "Иванович", "Дмитриевич", "Степанович" };
                        var femaleMiddleName = new[] { "Александровна", "Ивановна", "Дмитриевна", "Степановна" };
                        return u.Gender.Title == "Мужской" ? f.PickRandom(maleMiddleName) : f.PickRandom(femaleMiddleName);
                    })
                    .RuleFor(u => u.DateOfBirth, f => f.Date.Past(80, DateTime.Today.AddYears(-18)))
                    .RuleFor(u => u.Adress, f => f.Address.FullAddress())
                    .RuleFor(u => u.Phone, f => f.Phone.PhoneNumber())
                    .RuleFor(u => u.Email, f => f.Internet.Email())
                    .RuleFor(u => u.IDPassport, (f, u) => passports[f.IndexFaker % passports.Count].ID)
                    .RuleFor(u => u.IDMedicalCard, (f, u) => medicalCards[f.IndexFaker % medicalCards.Count].ID)
                    .RuleFor(u => u.IDInsuransePolicy, (f, u) => insuransePolicy[f.IndexFaker % insuransePolicy.Count].ID)
                    .RuleFor(u => u.IDInsuranseCompany, f => f.PickRandom(insuranseCompanyIds))
                    .RuleFor(u => u.WorkPlace, f => f.PickRandom(workPlaces))
                    .RuleFor(u => u.Diagnos, f => f.PickRandom(diagnoses))
                    .RuleFor(u => u.IDGender, f => f.PickRandom(genders).ID);

                var patients = patientGenerator.Generate(100);
                db.Patient.AddRange(patients);
                db.SaveChanges();
                Console.WriteLine("Генерация завершена");

            }
        }
    }
}
