using DataCenter.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebDekstop.ViewModel;

namespace WebDekstop
{
    public partial class About : Page
    {
        public int TypeId { get; set; } = 1;
        public int patientId {  get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var db = new dbModel())
            {
                var id = Convert.ToInt32(DropDownList1.SelectedValue);
                var patient = db.Patient.FirstOrDefault(item => item.ID == id);

                txbFirstName.Text = patient.FirstName;
                txbLastName.Text = patient.LastName;
                txbMiddleName.Text = patient.MiddleName;
                txbPassportSeries.Text = patient.Passport.Series;
                txbPassportNumber.Text = patient.Passport.Number;
                txbWorkPlace.Text = patient.WorkPlace;
                txbInsuranseCompany.Text = patient.InsuranseCompany.Title;
                txbInsuranseNumber.Text = patient.InsuransePolicy.Number;
                txbInsuransePolicyExpiration.TextMode = TextBoxMode.SingleLine;
                txbInsuransePolicyExpiration.Text = patient.InsuransePolicy.DateOfExpiration.ToString();
                txbDiagnos.Text = patient.Diagnos;
            }
        }

        protected async void buttonAddHospitalization_Click(object sender, EventArgs e)
        {
            var id = Convert.ToInt32(DropDownList1.SelectedValue);
            patientId = id;
            var type = DropDownList2.SelectedItem;
            if (type.Value == "2")
            {
                TypeId = 2;
            }
            else
            {
                TypeId = 1;
            }

            if (DropDownList1.SelectedItem != null && DropDownList2.SelectedItem != null && txbCodeHospitalization.Text != null && txbDepartament.Text != null && txbAdditionalInformation.Text != null && txbDateOfHospitalization.Text != null && txbTimeOfHospitalization.Text != null)
            {
                await ViewHospitalizationModel.PostHospitalizationObject(patientId, txbDateOfHospitalization.Text, txbTimeOfHospitalization.Text, txbCodeHospitalization.Text, txbPurpose.Text, txbDepartament.Text, TypeId, Convert.ToInt32(txbTerm.Text), txbAdditionalInformation.Text);
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }
    }
}