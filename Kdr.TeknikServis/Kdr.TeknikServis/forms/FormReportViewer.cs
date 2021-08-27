using CrystalDecisions.CrystalReports.Engine;
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
    public partial class FormReportViewer : Form
    {
        ReportDocument _reportDocument = null;
        public FormReportViewer(ReportDocument reportDocument)
        {
            InitializeComponent();
            _reportDocument = reportDocument;

        }

        private void FormReportViewer_Load(object sender, EventArgs e)
        {

            try
            {
                crystalReportViewer1.ReportSource = _reportDocument;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
        }
    }
}
