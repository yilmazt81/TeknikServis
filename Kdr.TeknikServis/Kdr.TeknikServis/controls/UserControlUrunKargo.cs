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

namespace Kdr.TeknikServis.controls
{
    public partial class UserControlUrunKargo : UserControl
    {
        Timer timer;
        public UserControlUrunKargo()
        {
            InitializeComponent();
            var ticks = new TimeSpan(0, 0, 10).Ticks;
            timer = new Timer()
            {
                Interval = (int)ticks
            };
            timer.Tick += Timer_Tick;
            RefreshGrid();
        }
        private void Timer_Tick(object sender, EventArgs e)
        {
            RefreshGrid();
        }
        private void RefreshGrid()
        {

            vTamirTeslimBindingSource.DataSource = TamirTeslimRepository.GetCargoSendList();
            cihazGonderimKargoBindingSource.DataSource = CargoRepository.GetLastCihazGonderim();

        }

        private void MenuItemSendCargo_Click(object sender, EventArgs e)
        {
            if (dataGridViewReady.CurrentRow == null)
                return;

            try
            {
                var tamirTeslimv = (vTamirTeslim)dataGridViewReady.CurrentRow.DataBoundItem;
                var kargoGonderim = CargoRepository.GetCihazKargoGonderim(tamirTeslimv.Id);

                forms.FormSendCargo formSendCargo = new forms.FormSendCargo()
                {
                    KargoGonderim = kargoGonderim
                };
                if (formSendCargo.ShowDialog() == DialogResult.OK)
                {
                    var cargoDelivery = formSendCargo.KargoGonderim;
                    cargoDelivery.Save();
                    var tamirTeslim = TamirTeslimRepository.GetTamirTeslim(tamirTeslimv.Id);
                    tamirTeslim.TamirDurumId = 5;

                    tamirTeslim.TeslimTarihi = DateTime.Now;
                    tamirTeslim.IadeEdenPersonelId = DBHelper.LoginPersonel.Id;

                    tamirTeslim.Save();
                    RefreshGrid();
                }

            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void MenuItemPrintAdres_Click(object sender, EventArgs e)
        {
            try
            {
                CihazGonderimKargo gridGonderim = (CihazGonderimKargo)dataGridViewCargo.CurrentRow.DataBoundItem;
                var kargoGonderim = CargoRepository.GetKargoGonderim(gridGonderim.Id);
                var tamirteslim = TamirTeslimRepository.GetTamirTeslim(kargoGonderim.TamirTeslimId);
                PrintFormCreator.CreateCargoDoc(tamirteslim, kargoGonderim);
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void MenuItemEdit_Click(object sender, EventArgs e)
        {
            try
            {
                CihazGonderimKargo gridGonderim = (CihazGonderimKargo)dataGridViewCargo.CurrentRow.DataBoundItem;

                var kargoGonderim = CargoRepository.GetKargoGonderim(gridGonderim.Id);

                forms.FormSendCargo formSendCargo = new forms.FormSendCargo()
                {
                    KargoGonderim = kargoGonderim
                };
                if (formSendCargo.ShowDialog() == DialogResult.OK)
                {
                    var cargoDelivery = formSendCargo.KargoGonderim;
                    cargoDelivery.Save();
                    var tamirTeslim = TamirTeslimRepository.GetTamirTeslim(kargoGonderim.Id);
                    tamirTeslim.TamirDurumId = 5;
                    tamirTeslim.Save();
                    RefreshGrid();
                }
            }
            catch (Exception ex)
            {

                MessageBoxHelper.ShowException(ex);
            }
        }
    }
}
