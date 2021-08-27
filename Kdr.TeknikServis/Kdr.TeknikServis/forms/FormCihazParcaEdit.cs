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
    public partial class FormCihazParcaEdit : Form
    {
        private CihazParca cihazParca = null;
        public FormCihazParcaEdit()
        {
            InitializeComponent();

            comboBoxBrand.DataSource = TamirTeslimRepository.GetMarkaList();
        }

        public CihazParca CihazParcaProp
        {
            get
            {
                if (cihazParca == null)
                {


                    cihazParca = new CihazParca();
                }

                cihazParca.Barkod = textBoxBarcode.Text;
                cihazParca.Fiyat = (textBoxUrunFiyat.Text == string.Empty ? 0 : decimal.Parse(textBoxUrunFiyat.Text));
                cihazParca.MontajUcreti = (textBoxMontajUcret.Text == string.Empty ? 0 : decimal.Parse(textBoxMontajUcret.Text));
                cihazParca.ParcaAdi = textBoxUrunAdi.Text;
                cihazParca.Marka = comboBoxBrand.Text;
                cihazParca.Model = textBoxModel.Text;
                cihazParca.StokAdet = (textBoxUrunAdet.Text == string.Empty ? 0 : int.Parse(textBoxUrunAdet.Text));

                return cihazParca;
            }

            set
            {
                cihazParca = value;
                if (cihazParca == null)
                    return;
                textBoxBarcode.Text = cihazParca.Barkod;
                textBoxUrunFiyat.Text = (cihazParca.Fiyat == 0 ? string.Empty : textBoxUrunFiyat.Text = cihazParca.Fiyat.ToString());
                textBoxMontajUcret.Text = (cihazParca.MontajUcreti == 0 ? string.Empty : cihazParca.MontajUcreti.ToString());
                textBoxUrunAdi.Text = cihazParca.ParcaAdi;
                comboBoxBrand.Text = cihazParca.Marka;
                textBoxModel.Text = cihazParca.Model;
                textBoxUrunAdet.Text = (cihazParca.StokAdet == 0 ? string.Empty : cihazParca.StokAdet.ToString());

            }
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;

        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (textBoxBarcode.Text == string.Empty)
            {
                MessageBoxHelper.ShowInfo("Barkod bilgisi Giriniz");
                return;
            }
            if (textBoxUrunAdi.Text == string.Empty)
            {
                MessageBoxHelper.ShowInfo("Ürün Adı Giriniz");
                return;
            }

            DialogResult = DialogResult.OK;

        }
    }
}
