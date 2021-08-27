
namespace Kdr.TeknikServis.controls
{
    partial class UserControlParcaBekleyen
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
            this.textBoxBarcode = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridViewWait = new System.Windows.Forms.DataGridView();
            this.TeknikPersonelAciklama = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.musteriAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.markaDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.modelDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.seriNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.teslimTarihiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.barcodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tamirDurumDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.vTamirTeslimBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.MenuItemContuine = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewWait)).BeginInit();
            this.cMenuStrip.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.vTamirTeslimBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // textBoxBarcode
            // 
            this.textBoxBarcode.Location = new System.Drawing.Point(84, 10);
            this.textBoxBarcode.Name = "textBoxBarcode";
            this.textBoxBarcode.Size = new System.Drawing.Size(242, 22);
            this.textBoxBarcode.TabIndex = 7;
            this.textBoxBarcode.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxBarcode_KeyDown);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(10, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 17);
            this.label1.TabIndex = 6;
            this.label1.Text = "Barkod";
            // 
            // dataGridViewWait
            // 
            this.dataGridViewWait.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewWait.AutoGenerateColumns = false;
            this.dataGridViewWait.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewWait.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.musteriAdiDataGridViewTextBoxColumn,
            this.markaDataGridViewTextBoxColumn,
            this.modelDataGridViewTextBoxColumn,
            this.seriNoDataGridViewTextBoxColumn,
            this.teslimTarihiDataGridViewTextBoxColumn,
            this.barcodeDataGridViewTextBoxColumn,
            this.tamirDurumDataGridViewTextBoxColumn,
            this.TeknikPersonelAciklama});
            this.dataGridViewWait.ContextMenuStrip = this.cMenuStrip;
            this.dataGridViewWait.DataSource = this.vTamirTeslimBindingSource;
            this.dataGridViewWait.Location = new System.Drawing.Point(13, 41);
            this.dataGridViewWait.Name = "dataGridViewWait";
            this.dataGridViewWait.RowHeadersWidth = 51;
            this.dataGridViewWait.RowTemplate.Height = 24;
            this.dataGridViewWait.Size = new System.Drawing.Size(1027, 387);
            this.dataGridViewWait.TabIndex = 5;
            // 
            // TeknikPersonelAciklama
            // 
            this.TeknikPersonelAciklama.DataPropertyName = "TeknikPersonelAciklama";
            this.TeknikPersonelAciklama.HeaderText = "Aciklama";
            this.TeknikPersonelAciklama.MinimumWidth = 6;
            this.TeknikPersonelAciklama.Name = "TeknikPersonelAciklama";
            this.TeknikPersonelAciklama.Width = 125;
            // 
            // cMenuStrip
            // 
            this.cMenuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemContuine});
            this.cMenuStrip.Name = "cMenuStrip";
            this.cMenuStrip.Size = new System.Drawing.Size(215, 58);
            // 
            // musteriAdiDataGridViewTextBoxColumn
            // 
            this.musteriAdiDataGridViewTextBoxColumn.DataPropertyName = "MusteriAdi";
            this.musteriAdiDataGridViewTextBoxColumn.HeaderText = "Müşteri Adi";
            this.musteriAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.musteriAdiDataGridViewTextBoxColumn.Name = "musteriAdiDataGridViewTextBoxColumn";
            this.musteriAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // markaDataGridViewTextBoxColumn
            // 
            this.markaDataGridViewTextBoxColumn.DataPropertyName = "Marka";
            this.markaDataGridViewTextBoxColumn.HeaderText = "Marka";
            this.markaDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.markaDataGridViewTextBoxColumn.Name = "markaDataGridViewTextBoxColumn";
            this.markaDataGridViewTextBoxColumn.Width = 125;
            // 
            // modelDataGridViewTextBoxColumn
            // 
            this.modelDataGridViewTextBoxColumn.DataPropertyName = "Model";
            this.modelDataGridViewTextBoxColumn.HeaderText = "Model";
            this.modelDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.modelDataGridViewTextBoxColumn.Name = "modelDataGridViewTextBoxColumn";
            this.modelDataGridViewTextBoxColumn.Width = 125;
            // 
            // seriNoDataGridViewTextBoxColumn
            // 
            this.seriNoDataGridViewTextBoxColumn.DataPropertyName = "SeriNo";
            this.seriNoDataGridViewTextBoxColumn.HeaderText = "SeriNo";
            this.seriNoDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.seriNoDataGridViewTextBoxColumn.Name = "seriNoDataGridViewTextBoxColumn";
            this.seriNoDataGridViewTextBoxColumn.Width = 125;
            // 
            // teslimTarihiDataGridViewTextBoxColumn
            // 
            this.teslimTarihiDataGridViewTextBoxColumn.DataPropertyName = "TeslimTarihi";
            this.teslimTarihiDataGridViewTextBoxColumn.HeaderText = "Teslim Tarihi";
            this.teslimTarihiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.teslimTarihiDataGridViewTextBoxColumn.Name = "teslimTarihiDataGridViewTextBoxColumn";
            this.teslimTarihiDataGridViewTextBoxColumn.Width = 125;
            // 
            // barcodeDataGridViewTextBoxColumn
            // 
            this.barcodeDataGridViewTextBoxColumn.DataPropertyName = "Barcode";
            this.barcodeDataGridViewTextBoxColumn.HeaderText = "Barcode";
            this.barcodeDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.barcodeDataGridViewTextBoxColumn.Name = "barcodeDataGridViewTextBoxColumn";
            this.barcodeDataGridViewTextBoxColumn.Width = 125;
            // 
            // tamirDurumDataGridViewTextBoxColumn
            // 
            this.tamirDurumDataGridViewTextBoxColumn.DataPropertyName = "TamirDurum";
            this.tamirDurumDataGridViewTextBoxColumn.HeaderText = "Tamir Durum";
            this.tamirDurumDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.tamirDurumDataGridViewTextBoxColumn.Name = "tamirDurumDataGridViewTextBoxColumn";
            this.tamirDurumDataGridViewTextBoxColumn.Width = 125;
            // 
            // vTamirTeslimBindingSource
            // 
            this.vTamirTeslimBindingSource.DataSource = typeof(Kdr.DBLayer.vTamirTeslim);
            // 
            // MenuItemContuine
            // 
            this.MenuItemContuine.Image = global::Kdr.TeknikServis.Properties.Resources.Process;
            this.MenuItemContuine.Name = "MenuItemContuine";
            this.MenuItemContuine.Size = new System.Drawing.Size(214, 26);
            this.MenuItemContuine.Text = "Tamire Devam Et";
            this.MenuItemContuine.Click += new System.EventHandler(this.MenuItemContuine_Click);
            // 
            // UserControlParcaBekleyen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.textBoxBarcode);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridViewWait);
            this.Name = "UserControlParcaBekleyen";
            this.Size = new System.Drawing.Size(1043, 442);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewWait)).EndInit();
            this.cMenuStrip.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.vTamirTeslimBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxBarcode;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridViewWait;
        private System.Windows.Forms.BindingSource vTamirTeslimBindingSource;
        private System.Windows.Forms.ContextMenuStrip cMenuStrip;
        private System.Windows.Forms.DataGridViewTextBoxColumn musteriAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn markaDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn modelDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn seriNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn teslimTarihiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn barcodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tamirDurumDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn TeknikPersonelAciklama;
        private System.Windows.Forms.ToolStripMenuItem MenuItemContuine;
    }
}
