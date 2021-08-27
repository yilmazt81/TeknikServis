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
    public partial class UserControlTeknikOnayBekleyen : UserControl
    {
        Timer timer;
        public UserControlTeknikOnayBekleyen()
        {
            InitializeComponent();
            var ticks = new TimeSpan(0, 0, 10).Ticks;
            timer = new Timer()
            {
                Interval = (int)ticks
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
            vTamirTeslimBindingSource.DataSource = TamirTeslimRepository.GetVTamirTeslimsByState(3);

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

        private void MenuItemCheckControl_Click(object sender, EventArgs e)
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
