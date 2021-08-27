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
    public partial class UserControlParcaBekleyen : UserControl
    {
        Timer timer = null;
        public UserControlParcaBekleyen()
        {
            InitializeComponent();
            var ticks = new TimeSpan(0, 0, 10).Ticks;
            timer = new Timer()
            {
                Interval= (int)ticks
            };
            timer.Tick += Timer_Tick;
            timer.Enabled = true;
            RefreshGrid();
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            RefreshGrid();
        }

        private void RefreshGrid()
        {
            var cihazListe = TamirTeslimRepository.GetVTamirTeslimsByState(2);
            foreach (var vTamir in cihazListe)
            {
                var waitList = TamirTeslimRepository.GetTamirCihazParcaWait(vTamir.Id);
                string waitListText = "";
                foreach (var cihazParca in waitList)
                {
                    waitListText += cihazParca.ParcaAdi;
                }
                vTamir.TeknikPersonelAciklama += waitListText + " Parça Bekliyor";
            }

            vTamirTeslimBindingSource.DataSource = cihazListe;
        }

        private void textBoxBarcode_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode != Keys.Enter)
                return;
            try
            {
                if (textBoxBarcode.Text == string.Empty)
                {
                    Refresh();
                }
                else
                {
                    vTamirTeslimBindingSource.DataSource = TamirTeslimRepository.GetVTamirTeslimsByBarcode(textBoxBarcode.Text);
                }
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void MenuItemContuine_Click(object sender, EventArgs e)
        {
            if (dataGridViewWait.CurrentRow == null)
                return;

            var tamirTeslimv = (vTamirTeslim)dataGridViewWait.CurrentRow.DataBoundItem;
            var tarmiteslim = TamirTeslimRepository.GetTamirTeslim(tamirTeslimv.Id);
            
            forms.FormStartRepair formStart = new forms.FormStartRepair()
            {
                TamirTeslimProp = tarmiteslim
            };
            if (formStart.ShowDialog() == DialogResult.OK)
            {
                RefreshGrid();
            }
        }
    }
}