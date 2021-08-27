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
    public partial class UserControlUrunTeslimAl : UserControl
    {
        public UserControlUrunTeslimAl()
        {
            InitializeComponent();
            RefreshGrid();
        }

        private void RefreshGrid()
        {
            vTamirTeslimBindingSource.DataSource= TamirTeslimRepository.GetVTamirTeslimsByState(0);

        }

        private void MenuItemNew_Click(object sender, EventArgs e)
        {
            forms.FormTamirTeslimEdit formCihazParca = new forms.FormTamirTeslimEdit();
            if (formCihazParca.ShowDialog() == DialogResult.OK)
            {
                RefreshGrid();
            }
        }

        private void textBoxBarcode_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                if (!string.IsNullOrEmpty(textBoxBarcode.Text))
                {
                    vTamirTeslimBindingSource.DataSource = TamirTeslimRepository.GetVTamirTeslimsByBarcode(textBoxBarcode.Text);
                }
            }
        }

        private void textBoxMusteriAdi_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                if (!string.IsNullOrEmpty(textBoxMusteriAdi.Text))
                {
                    vTamirTeslimBindingSource.DataSource = TamirTeslimRepository.GetVTamirTeslimsByName(textBoxMusteriAdi.Text);  
                }
                else
                {

                    RefreshGrid();
                }
            }
        }

        private void MenuItemEdit_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridViewDeliveryList.CurrentRow == null)
                    return;

                var cihazParca = (vTamirTeslim)dataGridViewDeliveryList.CurrentRow.DataBoundItem;
                var cihazTeslim = TamirTeslimRepository.GetTamirTeslim(cihazParca.Id);

                forms.FormTamirTeslimEdit formCihazParca = new forms.FormTamirTeslimEdit()
                {
                    TamirTeslimProp = cihazTeslim
                };
                if (formCihazParca.ShowDialog() == DialogResult.OK)
                {
                    RefreshGrid();
                }
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void MenuItemPrint_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridViewDeliveryList.CurrentRow == null)
                    return;
                var vcihazParca = (vTamirTeslim)dataGridViewDeliveryList.CurrentRow.DataBoundItem;
                var cihazTeslim = TamirTeslimRepository.GetTamirTeslim(vcihazParca.Id);

                PrintFormCreator.CreateMinites(cihazTeslim);
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }

        }

        private void MenuItemGiveBackCustomer_Click(object sender, EventArgs e)
        {
            if (dataGridViewDeliveryList.CurrentRow == null)
                return;
            try
            {
                var vcihazParca = (vTamirTeslim)dataGridViewDeliveryList.CurrentRow.DataBoundItem;
                var cihazTeslim = TamirTeslimRepository.GetTamirTeslim(vcihazParca.Id);
                forms.FormGiveBackCustomer formGiveBackCustomer = new forms.FormGiveBackCustomer()
                {
                    TamirTeslimProp = cihazTeslim
                };
                if (formGiveBackCustomer.ShowDialog() == DialogResult.OK)
                {
                    cihazTeslim = formGiveBackCustomer.TamirTeslimProp;
                    cihazTeslim.TeslimTarihi = DateTime.Now;
                    cihazTeslim.IadeEdenPersonelId = DBHelper.LoginPersonel.Id;
                    cihazTeslim.TamirDurumId = 5;
                    cihazTeslim.Save();
                }
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void textBoxPhoneCode_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                if (!string.IsNullOrEmpty(textBoxMusteriAdi.Text))
                {
                    vTamirTeslimBindingSource.DataSource = TamirTeslimRepository.GetVTamirTeslimsByName(textBoxPhoneCode.Text);
                }
                else
                {
                    RefreshGrid();
                }
            }
        }
    }
}
