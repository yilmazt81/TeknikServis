using Kdr.DBLayer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Kdr.TeknikServis.forms
{
    public partial class FormSendCargo : Form
    {
        private CihazKargoGonderim kargoGonderim = null;
        public FormSendCargo()
        {
            InitializeComponent();

            var cargoListe = CargoRepository.GetKargoFirmas();
            cargoListe.Insert(0, new KargoFirma() { FirmaAdi = "Seçiniz" });
            comboBoxCargo.DisplayMember = "FirmaAdi";
            comboBoxCargo.ValueMember = "Id";
            comboBoxCargo.DataSource = cargoListe;

        }

        public CihazKargoGonderim KargoGonderim
        {
            get
            {
                if (kargoGonderim == null)
                {
                    kargoGonderim = new CihazKargoGonderim()
                    {
                        GondermeTarihi = DateTime.Now
                    };
                }
                kargoGonderim.Adres = textBoxAdress.Text;
                kargoGonderim.KargoFirmaId = (int)comboBoxCargo.SelectedValue;
                kargoGonderim.GonderiNumarasi = textBoxCargoNo.Text;
                return kargoGonderim;
            }
            set
            {

                kargoGonderim = value;

                var city = AdressRepository.GetCity(kargoGonderim.IlId);
                var district = AdressRepository.GetDistrict(kargoGonderim.IlceId);
                textBoxCustomerName.Text = kargoGonderim.MusteriAdi;
                textBoxCity.Text = city.IlAdi;
                textBoxDistrict.Text = district.IlceAdi;
                textBoxAdress.Text = kargoGonderim.Adres;
                comboBoxCargo.SelectedValue = kargoGonderim.KargoFirmaId;
                textBoxCargoNo.Text = kargoGonderim.GonderiNumarasi;

            }
        }
        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }

        private void buttonCreateReport_Click(object sender, EventArgs e)
        {

            if (Convert.ToInt32(comboBoxCargo.SelectedValue) == 0)
            {
                MessageBoxHelper.ShowInfo("Kargo Firması Seçmediniz");
                return;
            }
            if (string.IsNullOrEmpty(textBoxCargoNo.Text))
            {
                MessageBoxHelper.ShowInfo("Kargo Numarası giriniz.");
                return;

            }

            var tamirteslim = TamirTeslimRepository.GetTamirTeslim(kargoGonderim.TamirTeslimId);
            PrintFormCreator.CreateCargoDoc(tamirteslim, KargoGonderim);

        }

        private void buttonOk_Click(object sender, EventArgs e)
        {

            if (Convert.ToInt32(comboBoxCargo.SelectedValue) ==0)
            {
                MessageBoxHelper.ShowInfo("Kargo Firması Seçmediniz");
                return;
            }
            if (string.IsNullOrEmpty(textBoxCargoNo.Text))
            {
                MessageBoxHelper.ShowInfo("Kargo Numarası giriniz.");
                return;

            }


            DialogResult = DialogResult.OK;
        }
    }
}
