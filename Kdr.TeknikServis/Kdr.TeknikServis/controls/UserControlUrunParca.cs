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


namespace Kdr.TeknikServis.controls
{
    public partial class UserControlUrunParca : UserControl
    {
        public UserControlUrunParca()
        {
            InitializeComponent();
            RefreshData();
        }

        private void RefreshData()
        {
            cihazParcaBindingSource.DataSource = CihazParcaHelper.GetCihazParcas();
        }
        private void MenuItemNew_Click(object sender, EventArgs e)
        {
            forms.FormCihazParcaEdit cihazParcaEdit = new forms.FormCihazParcaEdit();

            if (cihazParcaEdit.ShowDialog() == DialogResult.OK)
            {
                var cihazParca = cihazParcaEdit.CihazParcaProp;
                cihazParca.Save();
                RefreshData();
            }
        }

        private void textBoxBarcode_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                if (textBoxBarcode.Text == string.Empty)
                {
                    RefreshData();
                }
                else
                {
                    cihazParcaBindingSource.DataSource = CihazParcaHelper.GetCihazParcaByBarcode(textBoxBarcode.Text);
                }
            }
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            if (textBoxUrunAdi.Text == string.Empty)
            {
                RefreshData();
            }
            else
            {
                cihazParcaBindingSource.DataSource = CihazParcaHelper.GetCihazParcaByName(textBoxUrunAdi.Text);
            }
        }

        private void MenuItemEdit_Click(object sender, EventArgs e)
        {
            if (dataGridViewParcaListe.CurrentRow == null)
                return;
            var parcaListe = (CihazParca)dataGridViewParcaListe.CurrentRow.DataBoundItem;

            forms.FormCihazParcaEdit cihazParcaEdit = new forms.FormCihazParcaEdit()
            {
                CihazParcaProp = parcaListe
            };

            if (cihazParcaEdit.ShowDialog() == DialogResult.OK)
            {
                var cihazParca = cihazParcaEdit.CihazParcaProp;
                cihazParca.Save();
                RefreshData();
            }
        }
    }
}
