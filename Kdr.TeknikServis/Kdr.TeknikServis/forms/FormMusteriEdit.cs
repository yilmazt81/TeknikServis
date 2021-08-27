using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Kdr.DBLayer;
namespace Kdr.TeknikServis.forms
{
    public partial class FormMusteriEdit : Form
    {
        Musteri musteri = null;
        public FormMusteriEdit()
        {
            InitializeComponent();

            var cityList = AdressRepository.GetCity();
            cityList.Insert(0, new Il() { IlAdi = "Seçiniz" });
            comboBoxCity.DisplayMember = "IlAdi";
            comboBoxCity.ValueMember = "Id";
            comboBoxCity.DataSource = cityList;
            comboBoxCity.SelectedIndex = 0;
        }

        public Musteri MusterProp
        {
            get
            {
                if (musteri == null)
                {
                    musteri = new Musteri();
                }
                musteri.Adres = textBoxAdress.Text;
                musteri.Eposta = textBoxPosta.Text;
                musteri.GsmNo = textBoxGsm.Text;
                musteri.TamAdi = textBoxCustomerName.Text;
                musteri.IlId = ((Il)comboBoxCity.SelectedItem).Id;
                musteri.IlceId = ((Ilce)comboBoxDisctrict.SelectedItem).Id;

                return musteri;
            }
            set
            {
                musteri = value;

                textBoxAdress.Text = musteri.Adres;
                textBoxPosta.Text = musteri.Eposta;
                textBoxGsm.Text = musteri.GsmNo;
                textBoxCustomerName.Text = musteri.TamAdi;
                comboBoxCity.SelectedValue = musteri.IlId;
                comboBoxDisctrict.SelectedValue = musteri.IlceId;

            }
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;

        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textBoxCustomerName.Text))
            {
                MessageBoxHelper.ShowInfo("Müşteri Adı Giriniz");
                return;
            }

            if (string.IsNullOrEmpty(textBoxGsm.Text))
            {
                MessageBoxHelper.ShowInfo("Gsm No Giriniz");
                return;
            }
            if (string.IsNullOrEmpty(textBoxPosta.Text))
            {
                MessageBoxHelper.ShowInfo("E Posta Giriniz");
                return;
            }
            DialogResult = DialogResult.OK;
        }

        private void comboBoxCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBoxCity.SelectedItem == null)
                return;

            var selectedCity = (Il)comboBoxCity.SelectedItem;
            var districtListe = AdressRepository.GetCityDistrict(selectedCity.Id);
            districtListe.Insert(0, new Ilce() { IlceAdi = "Seçiniz" });

            comboBoxDisctrict.DisplayMember = "IlceAdi";
            comboBoxDisctrict.ValueMember = "Id";
            comboBoxDisctrict.DataSource = districtListe;
        }
    }
}
