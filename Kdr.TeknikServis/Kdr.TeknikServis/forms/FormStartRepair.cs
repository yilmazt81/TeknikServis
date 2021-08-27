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
    public partial class FormStartRepair : Form
    {
        TamirTeslim tamirTeslim = null;
        public FormStartRepair()
        {
            InitializeComponent();
        }

        public TamirTeslim TamirTeslimProp
        {
            get
            {

                tamirTeslim.TeknikPersonelAciklama = textBoxTeknikPersonelNot.Text;
                tamirTeslim.TamirEdenPersonelId = DBHelper.LoginPersonel.Id;
                tamirTeslim.TamirTarihi = DateTime.Now;

                return tamirTeslim;
            }
            set
            {
                tamirTeslim = value;
                textBoxMarka.Text = tamirTeslim.Marka;
                textBoxModel.Text = tamirTeslim.Model;
                textBoxSeriesId.Text = tamirTeslim.SeriNo;
                textBoxArizaNotu.Text = tamirTeslim.MusteriSorunAciklama;

                textBoxTeknikPersonelNot.Text = tamirTeslim.TeknikPersonelAciklama;
                if (tamirTeslim.TamirEdenPersonelId.HasValue)
                {
                    var tamirPersonel = UserRepository.GetPersonel(tamirTeslim.TamirEdenPersonelId.Value);
                    groupBoxTamirPersonel.Visible = true;
                    textBoxTamirPersonel.Text = tamirPersonel.Adi + " " + tamirPersonel.Soyadi;
                    textBoxTamirTarih.Text = tamirTeslim.TamirTarihi.Value.Date.ToString("dd.MM.yyyy");
                }
                RefreshGrid();
            }
        }

        private void RefreshGrid()
        {

            cihazTamirAddCihazPersonelInfoBindingSource.DataSource = CihazParcaHelper.GetCihazTamirParcas(tamirTeslim.Id);
        }

        private void buttonAddItem_Click(object sender, EventArgs e)
        {
            forms.FormSelectDeviceItem formSelectDevice = new FormSelectDeviceItem(tamirTeslim.Marka, tamirTeslim.Model);
            if (formSelectDevice.ShowDialog() == DialogResult.OK)
            {
                var tamirCihaz = new CihazTamirParca()
                {
                    TamirTeslimId = tamirTeslim.Id,
                    CihazParcaId = formSelectDevice.CihazParcaProp.Id,
                    EkleyenPersonel = DBHelper.LoginPersonel.Id,
                    ParcaBekliyor = (formSelectDevice.CihazParcaProp.StokAdet.Value == 0),
                    EklemeTarihi = DateTime.Now,
                };
                CihazParcaHelper.Save(tamirCihaz);

                tamirTeslim.TamirFiyat += formSelectDevice.CihazParcaProp.Fiyat + formSelectDevice.CihazParcaProp.MontajUcreti;
                RefreshGrid();
            }
        }

        private void MenuItemDelete_Click(object sender, EventArgs e)
        {
            if (dataGridViewChangeItems.CurrentRow == null)
                return;

            var cihazTamirParca = (CihazTamirAddCihazPersonelInfo)dataGridViewChangeItems.CurrentRow.DataBoundItem;
            if (MessageBox.Show($"{cihazTamirParca.ParcaAdi} Parçayı silmek istediğinizden emin misiniz ? ", "Soru", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
                return;
            try
            {

                cihazTamirParca.Delete();


                tamirTeslim.TamirFiyat -= cihazTamirParca.ParcaFiyat;

                RefreshGrid();
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

        private void buttonOk_Click(object sender, EventArgs e)
        {

            string quMessage = "  ";


            if (tamirTeslim.TamirDurumId == 1)
            {
                var cihazListe = CihazParcaHelper.GetCihazTamirParcas(tamirTeslim.Id);
                var waitCihaz = cihazListe.Any(s => s.ParcaBekliyor);
                var cihazDurumu = (waitCihaz ? "Parça Bekliyor" : "Kalite Kontrol");

                quMessage = $"Cihazın durumunu {cihazDurumu} olarak değiştirmek istediğinizden emin misiniz ?  ";
                tamirTeslim.TamirDurumId = (waitCihaz ? (byte)2 : (byte)3);
                tamirTeslim.TamirEdenPersonelId = DBHelper.LoginPersonel.Id;
                tamirTeslim.TamirTarihi = DateTime.Now;

                if (tamirTeslim.TamirDurumId == 3 && !DBHelper.LoginPersonel.UstPersonelId.HasValue)
                {
                    tamirTeslim.TamirDurumId = 4;
                    tamirTeslim.KontrolEdenPersonelId = DBHelper.LoginPersonel.Id;
                    tamirTeslim.KontrolTarihi = DateTime.Now;

                }


            }
            else if (tamirTeslim.TamirDurumId == 2)
            {
                var cihazListes = CihazParcaHelper.GetCihazTamirParcas(tamirTeslim.Id);
                bool waitCihaz = false;
                foreach (var cihazParca in cihazListes.Where(s => s.ParcaBekliyor))
                {
                    var dbChaz = CihazParcaHelper.GetCihazParca(cihazParca.ParcaId);
                    if (dbChaz.StokAdet > 0)
                    {
                        cihazParca.ParcaBekliyor = false;
                        tamirTeslim.TamirDurumId = 3;
                        dbChaz.StokAdet--;
                        dbChaz.Save();
                        cihazParca.ParcaBekliyor = false;
                        CihazParcaHelper.Save(new CihazTamirParca() { Id = cihazParca.Id, ParcaBekliyor = false });

                    }
                    else
                    {
                        tamirTeslim.TamirDurumId = 2;
                        waitCihaz = true;

                    }
                }
                var cihazDurumu = (waitCihaz ? "Parça Bekliyor" : "Kalite Kontrol");
                quMessage = $"Cihazın durumunu {cihazDurumu} olarak değiştirmek istediğinizden emin misiniz ?  ";
                tamirTeslim.TamirDurumId = (waitCihaz ? (byte)2 : (byte)3);
                tamirTeslim.TamirEdenPersonelId = DBHelper.LoginPersonel.Id;
                tamirTeslim.TamirTarihi = DateTime.Now;
                //üst Personeli yoksa kendi kontrol etmiş olacak
                if (tamirTeslim.TamirDurumId == 3 && !DBHelper.LoginPersonel.UstPersonelId.HasValue)
                {
                    tamirTeslim.TamirDurumId = 4;
                    tamirTeslim.KontrolEdenPersonelId = DBHelper.LoginPersonel.Id;
                    tamirTeslim.KontrolTarihi = DateTime.Now;

                }
                tamirTeslim.TamirTarihi = DateTime.Now;

            }
            else if (tamirTeslim.TamirDurumId == 3)
            {
                tamirTeslim.KontrolEdenPersonelId = DBHelper.LoginPersonel.Id;
                tamirTeslim.KontrolTarihi = DateTime.Now;
                tamirTeslim.TamirDurumId = 4;
                quMessage = $"Cihazın durumunu Kontrol edildi olarak değiştirmek istediğinizden emin misiniz ?  ";
            }

            if (MessageBoxHelper.ShowQuestion(quMessage) == DialogResult.No)
                return;
            TamirTeslimProp.Save();
            DialogResult = DialogResult.OK;

        }
    }
}
