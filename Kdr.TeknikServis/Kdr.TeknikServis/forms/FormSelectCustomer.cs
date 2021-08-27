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
    public partial class FormSelectCustomer : Form
    {
        public FormSelectCustomer()
        {
            InitializeComponent();
        }

        public Musteri SelectedCustomer
        {
            get { return (dataGridViewCustomer.CurrentRow == null ? null : (Musteri)dataGridViewCustomer.CurrentRow.DataBoundItem); }
        }
        private void textBoxFullName_KeyDown(object sender, KeyEventArgs e)
        {
            try
            {
                if (e.KeyCode == Keys.Enter)
                {
                    var liste = MemberRepository.GetMusteris(textBoxFullName.Text);

                    musteriBindingSource.DataSource = liste;
                }
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void dataGridViewCustomer_KeyDown(object sender, KeyEventArgs e)
        {

            if (e.KeyCode == Keys.Enter)
            {

                DialogResult = DialogResult.OK;


            }
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (SelectedCustomer == null)
            {
                MessageBoxHelper.ShowInfo("Müşteri Seçiniz");
                return;
            }
            DialogResult = DialogResult.OK;

        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;

        }
    }
}
