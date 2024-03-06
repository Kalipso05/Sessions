using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataCenter.Model
{
    public class PatientData
    {
        public Patient Patient { get; set; }
        public Passport Passport { get; set; }
        public MedicalCard MedicalCard { get; set; }
        public InsuranseCompany InsuranseCompany { get; set;}
        public InsuransePolicy InsuransePolicy { get; set; }
    }
}
