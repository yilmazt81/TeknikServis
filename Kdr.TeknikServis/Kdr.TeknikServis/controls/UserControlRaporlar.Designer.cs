
namespace Kdr.TeknikServis.controls
{
    partial class UserControlRaporlar
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.buttonRemove = new System.Windows.Forms.Button();
            this.buttonAddNewReport = new System.Windows.Forms.Button();
            this.buttonPrint = new System.Windows.Forms.Button();
            this.buttonQuery = new System.Windows.Forms.Button();
            this.dateTimePickerEndDate = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.dateTimePickerStart = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.comboBoxReport = new System.Windows.Forms.ComboBox();
            this.dataGridViewReport = new System.Windows.Forms.DataGridView();
            this.performansReportViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.ReportDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PersonelFullName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CihazAdet = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TamirFiyat = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewReport)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.performansReportViewBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(17, 28);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(83, 20);
            this.label1.TabIndex = 2;
            this.label1.Text = "Rapor Adı";
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Margin = new System.Windows.Forms.Padding(4);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.buttonRemove);
            this.splitContainer1.Panel1.Controls.Add(this.buttonAddNewReport);
            this.splitContainer1.Panel1.Controls.Add(this.buttonPrint);
            this.splitContainer1.Panel1.Controls.Add(this.buttonQuery);
            this.splitContainer1.Panel1.Controls.Add(this.dateTimePickerEndDate);
            this.splitContainer1.Panel1.Controls.Add(this.label3);
            this.splitContainer1.Panel1.Controls.Add(this.dateTimePickerStart);
            this.splitContainer1.Panel1.Controls.Add(this.label2);
            this.splitContainer1.Panel1.Controls.Add(this.comboBoxReport);
            this.splitContainer1.Panel1.Controls.Add(this.label1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.dataGridViewReport);
            this.splitContainer1.Size = new System.Drawing.Size(1004, 609);
            this.splitContainer1.SplitterDistance = 385;
            this.splitContainer1.SplitterWidth = 5;
            this.splitContainer1.TabIndex = 3;
            // 
            // buttonRemove
            // 
            this.buttonRemove.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonRemove.Image = global::Kdr.TeknikServis.Properties.Resources.Remove;
            this.buttonRemove.Location = new System.Drawing.Point(341, 23);
            this.buttonRemove.Name = "buttonRemove";
            this.buttonRemove.Size = new System.Drawing.Size(30, 30);
            this.buttonRemove.TabIndex = 11;
            this.buttonRemove.UseVisualStyleBackColor = true;
            this.buttonRemove.Click += new System.EventHandler(this.buttonRemove_Click);
            // 
            // buttonAddNewReport
            // 
            this.buttonAddNewReport.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonAddNewReport.Image = global::Kdr.TeknikServis.Properties.Resources.add;
            this.buttonAddNewReport.Location = new System.Drawing.Point(305, 23);
            this.buttonAddNewReport.Name = "buttonAddNewReport";
            this.buttonAddNewReport.Size = new System.Drawing.Size(30, 30);
            this.buttonAddNewReport.TabIndex = 10;
            this.buttonAddNewReport.UseVisualStyleBackColor = true;
            this.buttonAddNewReport.Click += new System.EventHandler(this.buttonAddNewReport_Click);
            // 
            // buttonPrint
            // 
            this.buttonPrint.Image = global::Kdr.TeknikServis.Properties.Resources.ScanDoc2;
            this.buttonPrint.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonPrint.Location = new System.Drawing.Point(18, 280);
            this.buttonPrint.Name = "buttonPrint";
            this.buttonPrint.Size = new System.Drawing.Size(129, 39);
            this.buttonPrint.TabIndex = 9;
            this.buttonPrint.Text = "Yazdır";
            this.buttonPrint.UseVisualStyleBackColor = true;
            this.buttonPrint.Click += new System.EventHandler(this.buttonPrint_Click);
            // 
            // buttonQuery
            // 
            this.buttonQuery.Image = global::Kdr.TeknikServis.Properties.Resources.Query;
            this.buttonQuery.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonQuery.Location = new System.Drawing.Point(156, 280);
            this.buttonQuery.Name = "buttonQuery";
            this.buttonQuery.Size = new System.Drawing.Size(129, 39);
            this.buttonQuery.TabIndex = 8;
            this.buttonQuery.Text = "Raporla";
            this.buttonQuery.UseVisualStyleBackColor = true;
            this.buttonQuery.Click += new System.EventHandler(this.buttonQuery_Click);
            // 
            // dateTimePickerEndDate
            // 
            this.dateTimePickerEndDate.Location = new System.Drawing.Point(21, 214);
            this.dateTimePickerEndDate.Name = "dateTimePickerEndDate";
            this.dateTimePickerEndDate.Size = new System.Drawing.Size(295, 27);
            this.dateTimePickerEndDate.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(17, 174);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(90, 20);
            this.label3.TabIndex = 6;
            this.label3.Text = "Bitiş Tarihi";
            // 
            // dateTimePickerStart
            // 
            this.dateTimePickerStart.Location = new System.Drawing.Point(21, 123);
            this.dateTimePickerStart.Name = "dateTimePickerStart";
            this.dateTimePickerStart.Size = new System.Drawing.Size(295, 27);
            this.dateTimePickerStart.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 83);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(130, 20);
            this.label2.TabIndex = 4;
            this.label2.Text = "Başlangıç Tarihi";
            // 
            // comboBoxReport
            // 
            this.comboBoxReport.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.comboBoxReport.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxReport.FormattingEnabled = true;
            this.comboBoxReport.Location = new System.Drawing.Point(111, 25);
            this.comboBoxReport.Name = "comboBoxReport";
            this.comboBoxReport.Size = new System.Drawing.Size(188, 28);
            this.comboBoxReport.TabIndex = 3;
            // 
            // dataGridViewReport
            // 
            this.dataGridViewReport.AutoGenerateColumns = false;
            this.dataGridViewReport.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewReport.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ReportDate,
            this.PersonelFullName,
            this.CihazAdet,
            this.TamirFiyat});
            this.dataGridViewReport.DataSource = this.performansReportViewBindingSource;
            this.dataGridViewReport.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridViewReport.Location = new System.Drawing.Point(0, 0);
            this.dataGridViewReport.Name = "dataGridViewReport";
            this.dataGridViewReport.RowHeadersWidth = 51;
            this.dataGridViewReport.RowTemplate.Height = 24;
            this.dataGridViewReport.Size = new System.Drawing.Size(614, 609);
            this.dataGridViewReport.TabIndex = 0;
            // 
            // performansReportViewBindingSource
            // 
            this.performansReportViewBindingSource.DataSource = typeof(Kdr.DBLayer.PerformansReportView);
            // 
            // ReportDate
            // 
            this.ReportDate.DataPropertyName = "ReportDate";
            this.ReportDate.HeaderText = "Rapor Tarihi";
            this.ReportDate.MinimumWidth = 6;
            this.ReportDate.Name = "ReportDate";
            this.ReportDate.Width = 200;
            // 
            // PersonelFullName
            // 
            this.PersonelFullName.DataPropertyName = "PersonelFullName";
            this.PersonelFullName.HeaderText = "Personel Adı";
            this.PersonelFullName.MinimumWidth = 6;
            this.PersonelFullName.Name = "PersonelFullName";
            this.PersonelFullName.Width = 200;
            // 
            // CihazAdet
            // 
            this.CihazAdet.DataPropertyName = "CihazAdet";
            this.CihazAdet.HeaderText = "Cihaz Sayı";
            this.CihazAdet.MinimumWidth = 6;
            this.CihazAdet.Name = "CihazAdet";
            this.CihazAdet.Width = 125;
            // 
            // TamirFiyat
            // 
            this.TamirFiyat.DataPropertyName = "TamirFiyat";
            this.TamirFiyat.HeaderText = "Tamir Fiyat";
            this.TamirFiyat.MinimumWidth = 6;
            this.TamirFiyat.Name = "TamirFiyat";
            this.TamirFiyat.Width = 125;
            // 
            // UserControlRaporlar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.splitContainer1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "UserControlRaporlar";
            this.Size = new System.Drawing.Size(1004, 609);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewReport)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.performansReportViewBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.DateTimePicker dateTimePickerStart;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox comboBoxReport;
        private System.Windows.Forms.DateTimePicker dateTimePickerEndDate;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button buttonPrint;
        private System.Windows.Forms.Button buttonQuery;
        private System.Windows.Forms.DataGridView dataGridViewReport;
        private System.Windows.Forms.Button buttonAddNewReport;
        private System.Windows.Forms.Button buttonRemove;
        private System.Windows.Forms.BindingSource performansReportViewBindingSource;
        private System.Windows.Forms.DataGridViewTextBoxColumn ReportDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn PersonelFullName;
        private System.Windows.Forms.DataGridViewTextBoxColumn CihazAdet;
        private System.Windows.Forms.DataGridViewTextBoxColumn TamirFiyat;
    }
}
