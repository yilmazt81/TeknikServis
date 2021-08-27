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
    public partial class FormSelectDeviceItem : Form
    {
        public FormSelectDeviceItem(string brand, string model)
        {
            InitializeComponent();

            cihazParcaBindingSource.DataSource = CihazParcaHelper.GetCihazParcaByBrandModel(brand, model);
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }
        public CihazParca CihazParcaProp
        {
            get { return (dataGridViewItem.CurrentRow == null ? null : (CihazParca)dataGridViewItem.CurrentRow.DataBoundItem); }
        }
        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (CihazParcaProp == null)
            {
                MessageBoxHelper.ShowInfo("Değişim yapılacak parça seçmediniz");
                return;
            }

            if (CihazParcaProp.StokAdet == 0)
            {
                if (MessageBoxHelper.ShowQuestion("Bu ürün Stokta bitmiş devam etmek istiyorsanız Cihaz durumu parça bekliyor olacaktır") == DialogResult.No)
                    return;
            }
            DialogResult = DialogResult.OK;
        }

        private void FormSelectDeviceItem_Load(object sender, EventArgs e)
        {

        }
    }
}
