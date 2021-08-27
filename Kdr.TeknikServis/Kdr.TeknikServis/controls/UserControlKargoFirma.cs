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
    public partial class UserControlKargoFirma : UserControl
    {
        public UserControlKargoFirma()
        {
            InitializeComponent();

            Refresh();
        }
        private void Refresh()
        {
            kargoFirmaBindingSource.DataSource = CargoRepository.GetKargoFirmas();
        }

        private void MenuItemNew_Click(object sender, EventArgs e)
        {
            forms.FormCargo formCargo = new forms.FormCargo();
            if (formCargo.ShowDialog()== DialogResult.OK)
            {
                formCargo.KargoFirmaProp.Save();
                Refresh();
            }
        }

        private void MenuItemEdit_Click(object sender, EventArgs e)
        {
            if (dataGridViewKargo.CurrentRow == null)
            {
                return;
            }
            var kargo = (KargoFirma)dataGridViewKargo.CurrentRow.DataBoundItem;

            forms.FormCargo formCargo = new forms.FormCargo()
            {
                KargoFirmaProp = kargo
            };
            if (formCargo.ShowDialog() == DialogResult.OK)
            {
                formCargo.KargoFirmaProp.Save();
                Refresh();
            }
        }
    }
}
