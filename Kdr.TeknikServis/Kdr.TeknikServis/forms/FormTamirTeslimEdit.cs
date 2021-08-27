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
    public partial class FormTamirTeslimEdit : Form
    {
        private Musteri currentMusteri = null;
        private TamirTeslim tamirTeslim = null;
        public FormTamirTeslimEdit()
        {
            InitializeComponent();

            comboBoxBrand.DataSource = TamirTeslimRepository.GetMarkaList();
        }


        public TamirTeslim TamirTeslimProp
        {
            get
            {
                if (tamirTeslim == null)
                {
                    tamirTeslim = new TamirTeslim()
                    {
                        TeslimTarihi = DateTime.Now,
                        Barcode = Guid.NewGuid().ToString(),
                        MusteriId = currentMusteri.Id,
                        TeslimAlanPersonelId = DBHelper.LoginPersonel.Id,
                        TamirDurumId = 0,

                    };
                }

                tamirTeslim.Marka = comboBoxBrand.Text;
                tamirTeslim.KargoIleGeldi = checkBoxCargo.Checked;
                tamirTeslim.Model = textBoxModel.Text;
                tamirTeslim.SeriNo = textBoxSeriesId.Text;
                tamirTeslim.TamirFiyat = (textBoxTamirUcret.Text == string.Empty ? 0 : decimal.Parse(textBoxTamirUcret.Text));
                tamirTeslim.MusteriSorunAciklama = textBoxArizaNotu.Text;
                tamirTeslim.TeslimAlinanAksesuar = textBoxTeslimAlinanAksesuar.Text;
                tamirTeslim.KargoIleGonderilecek = checkBoxReturnWithCargo.Checked;
                return tamirTeslim;
            }
            set
            {
                tamirTeslim = value;

                currentMusteri = MemberRepository.GetMusteri(tamirTeslim.MusteriId);
                textBoxCustomerName.Text = currentMusteri.TamAdi;

                comboBoxBrand.Text = tamirTeslim.Marka;
                checkBoxCargo.Checked = tamirTeslim.KargoIleGeldi.Value;
                textBoxModel.Text = tamirTeslim.Model;
                textBoxSeriesId.Text = tamirTeslim.SeriNo;
                textBoxTamirUcret.Text = (tamirTeslim.TamirFiyat == 0 ? string.Empty : tamirTeslim.TamirFiyat.ToString());
                textBoxArizaNotu.Text = tamirTeslim.MusteriSorunAciklama;
                textBoxTeslimAlinanAksesuar.Text = tamirTeslim.TeslimAlinanAksesuar;
                checkBoxReturnWithCargo.Checked = tamirTeslim.KargoIleGonderilecek.Value;
                RefreshGrid();
            }
        }

        private void buttonCustomer_Click(object sender, EventArgs e)
        {
            FormSelectCustomer formSelect = new FormSelectCustomer();
            if (formSelect.ShowDialog() == DialogResult.OK)
            {
                currentMusteri = formSelect.SelectedCustomer;
                textBoxCustomerName.Text = currentMusteri.TamAdi;

            }
        }

        private void buttonAddCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                FormMusteriEdit formMusteri = new FormMusteriEdit();
                if (formMusteri.ShowDialog() == DialogResult.OK)
                {
                    currentMusteri = formMusteri.MusterProp;
                    currentMusteri.SaveMusteri();
                    textBoxCustomerName.Text = currentMusteri.TamAdi;


                }

            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            try
            {
                if (currentMusteri == null)
                {
                    MessageBoxHelper.ShowInfo("Bir müşteri seçmeniz gereklidir");
                    return;
                }

                var musteriProp = TamirTeslimProp;
                TamirTeslimRepository.Save(musteriProp);
                PrintFormCreator.CreateMinites(musteriProp);


                DialogResult = DialogResult.OK;
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {

            DialogResult = DialogResult.Cancel;
        }
        private void RefreshGrid()
        {
            var cihazListe = CihazParcaHelper.GetCihazTamirParcas(tamirTeslim.Id);

            cihazTamirAddCihazPersonelInfoBindingSource.DataSource = cihazListe;
            var totalFiyat = cihazListe.Sum(s => s.ParcaFiyat);


            textBoxTamirUcret.Text = totalFiyat.ToString();



        }
        private void buttonAddItem_Click(object sender, EventArgs e)
        {
            forms.FormSelectDeviceItem formSelectDevice = new FormSelectDeviceItem(comboBoxBrand.Text, textBoxModel.Text);
            if (formSelectDevice.ShowDialog() == DialogResult.OK)
            {
                if (tamirTeslim == null)
                {
                    var tamirProp = this.TamirTeslimProp;
                    tamirProp.Save();
                }
                var tamirCihaz = new CihazTamirParca()
                {
                    TamirTeslimId = tamirTeslim.Id,
                    CihazParcaId = formSelectDevice.CihazParcaProp.Id,
                    EkleyenPersonel = DBHelper.LoginPersonel.Id,
                    ParcaBekliyor = (formSelectDevice.CihazParcaProp.StokAdet.Value == 0),
                    EklemeTarihi = DateTime.Now,
                };
                CihazParcaHelper.Save(tamirCihaz);


                this.TamirTeslimProp.TamirFiyat += formSelectDevice.CihazParcaProp.Fiyat + formSelectDevice.CihazParcaProp.MontajUcreti;
                RefreshGrid();
            }
        }
    }
}
