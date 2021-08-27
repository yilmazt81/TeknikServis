using Kdr.DBLayer;
using Kdr.TeknikServis.forms;
using Kdr.TeknikServis.ReportForm;
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
    public partial class UserControlRaporlar : UserControl
    {
        public UserControlRaporlar()
        {
            InitializeComponent();

            RefreshCombobox();
        }

        private void RefreshCombobox()
        {

            comboBoxReport.DisplayMember = "RaportAdi";
            comboBoxReport.ValueMember = "Id";
            comboBoxReport.DataSource = ReportRepository.GetPerformansRapors();

        }

        private void buttonQuery_Click(object sender, EventArgs e)
        {
            try
            {
                var report = (PerformansRapor)comboBoxReport.SelectedItem;
                dataGridViewReport.DataSource = ReportRepository.GetPerformansReportViews(report.ProcedureName, dateTimePickerStart.Value, dateTimePickerEndDate.Value);

            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void buttonPrint_Click(object sender, EventArgs e)
        {
            try
            {
                CrystalReportPerformans crystalReportPerformans = new CrystalReportPerformans();

                List<PerformansReportView> tutanakPrints = (List<PerformansReportView>) dataGridViewReport.DataSource;
                crystalReportPerformans.SetDataSource(tutanakPrints);
                FormReportViewer formReportViewer = new FormReportViewer(crystalReportPerformans);
                formReportViewer.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void buttonAddNewReport_Click(object sender, EventArgs e)
        {
            forms.FormReportEdit formReportEdit = new forms.FormReportEdit();

            if (formReportEdit.ShowDialog() == DialogResult.OK)
            {
                ReportRepository.Save(formReportEdit.Performans);
                RefreshCombobox();
            }
        }

        private void buttonRemove_Click(object sender, EventArgs e)
        {
            var report = (PerformansRapor)comboBoxReport.SelectedItem;
            if (MessageBoxHelper.ShowQuestion($"{report.RaportAdi} Silmek istediğinizden emin misiniz ? ") == DialogResult.Yes)
            {
                ReportRepository.Delete(report);
                RefreshCombobox();
            }
        }
    }
}
