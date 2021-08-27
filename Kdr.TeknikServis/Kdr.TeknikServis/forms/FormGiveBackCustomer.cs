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
    public partial class FormGiveBackCustomer : Form
    {
        private Musteri currentMusteri = null;
        private TamirTeslim tamirTeslim = null;

        public FormGiveBackCustomer()
        {
            InitializeComponent();
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

                tamirTeslim.TeslimAlan = textBoxGivePersonName.Text;
                return tamirTeslim;
            }
            set
            {
                tamirTeslim = value;

                currentMusteri = MemberRepository.GetMusteri(tamirTeslim.MusteriId);
                textBoxCustomerName.Text = currentMusteri.TamAdi;

                textBoxBrand.Text = tamirTeslim.Marka;

                textBoxModel.Text = tamirTeslim.Model;
                textBoxSeriesId.Text = tamirTeslim.SeriNo;
                textBoxTamirUcret.Text = (tamirTeslim.TamirFiyat == 0 ? string.Empty : tamirTeslim.TamirFiyat.ToString());
                // textBoxArizaNotu.Text = tamirTeslim.MusteriSorunAciklama;
                textBoxTeslimAlinanAksesuar.Text = tamirTeslim.TeslimAlinanAksesuar;
                textBoxGivePersonName.Text = tamirTeslim.TeslimAlan;
            }
        }
        private void FormGiveBackCustomer_Load(object sender, EventArgs e)
        {

        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textBoxGivePersonName.Text))
            {
                MessageBoxHelper.ShowInfo("Teslim Edilen kişi bilgisi girmelisiniz.");
                return;
            }

            DialogResult = DialogResult.OK;
        }
    }
}
