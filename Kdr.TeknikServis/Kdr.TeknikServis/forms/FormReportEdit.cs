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
    public partial class FormReportEdit : Form
    {
        PerformansRapor performansRapor = null;
        public FormReportEdit()
        {
            InitializeComponent();
        }


        public PerformansRapor Performans
        {
            get
            {
                if (performansRapor == null)
                {
                    performansRapor = new PerformansRapor();
                }

                 performansRapor.RaportAdi= textBoxReportName.Text;
                performansRapor.ProcedureName= textBoxReportProcedure.Text;


                return performansRapor;
            }
            set
            {
                performansRapor = value;
                textBoxReportName.Text = performansRapor.RaportAdi;
                textBoxReportProcedure.Text = performansRapor.ProcedureName;

            }
        }
        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textBoxReportName.Text))
            {
                MessageBoxHelper.ShowInfo("Raport Adı girmediniz");
                return;
            }
            if (string.IsNullOrEmpty(textBoxReportProcedure.Text))
            {
                MessageBoxHelper.ShowInfo("Raport Procedur Adı girmediniz");
                return;
            }

            DialogResult = DialogResult.OK;
        }
    }
}
