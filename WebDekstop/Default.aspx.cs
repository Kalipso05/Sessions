using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebDekstop.ViewModel;

namespace WebDekstop
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void buttonAddPatient_Click(object sender, EventArgs e)
        {
            if(txbFirstName.Text != null && txbLastName.Text != null && txbMiddleName.Text != null && txbWorkPlace.Text != null && txbMedicalCardNumber.Text != null && txbMedicalCardCode.Text != null && txbInsuranseNumber.Text != null && txbInsuransePolicyExpiration.Text != null && txbInsuranseCompany.Text != null)
            {
                await ViewPatientModel.PostPatientObject(txbFirstName.Text, txbLastName.Text, txbMiddleName.Text, txbPassportSeries.Text, txbPassportNumber.Text, txbWorkPlace.Text, txbInsuranseNumber.Text, txbInsuransePolicyExpiration.Text, txbInsuranseCompany.Text, txbMedicalCardNumber.Text, txbMedicalCardCode.Text);
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}