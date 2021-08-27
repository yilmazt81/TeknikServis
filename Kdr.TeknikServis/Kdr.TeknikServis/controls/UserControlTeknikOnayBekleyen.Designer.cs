
namespace Kdr.TeknikServis.controls
{
    partial class UserControlTeknikOnayBekleyen
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
            this.cMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.MenuItemCheckControl = new System.Windows.Forms.ToolStripMenuItem();
            this.TamirPersonel = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.musteriAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.markaDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.modelDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.seriNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.teslimTarihiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.barcodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tamirDurumDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.vTamirTeslimBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewWait)).BeginInit();
            this.cMenuStrip.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.vTamirTeslimBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // textBoxBarcode
            // 
            this.textBoxBarcode.Location = new System.Drawing.Point(86, 9);
            this.textBoxBarcode.Name = "textBoxBarcode";
            this.textBoxBarcode.Size = new System.Drawing.Size(242, 22);
            this.textBoxBarcode.TabIndex = 10;
            this.textBoxBarcode.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxBarcode_KeyDown);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 17);
            this.label1.TabIndex = 9;
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
            this.TamirPersonel,
            this.musteriAdiDataGridViewTextBoxColumn,
            this.markaDataGridViewTextBoxColumn,
            this.modelDataGridViewTextBoxColumn,
            this.seriNoDataGridViewTextBoxColumn,
            this.teslimTarihiDataGridViewTextBoxColumn,
            this.barcodeDataGridViewTextBoxColumn,
            this.tamirDurumDataGridViewTextBoxColumn});
            this.dataGridViewWait.ContextMenuStrip = this.cMenuStrip;
            this.dataGridViewWait.DataSource = this.vTamirTeslimBindingSource;
            this.dataGridViewWait.Location = new System.Drawing.Point(15, 40);
            this.dataGridViewWait.Name = "dataGridViewWait";
            this.dataGridViewWait.RowHeadersWidth = 51;
            this.dataGridViewWait.RowTemplate.Height = 24;
            this.dataGridViewWait.Size = new System.Drawing.Size(845, 388);
            this.dataGridViewWait.TabIndex = 8;
            // 
            // cMenuStrip
            // 
            this.cMenuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemCheckControl});
            this.cMenuStrip.Name = "cMenuStrip";
            this.cMenuStrip.Size = new System.Drawing.Size(215, 58);
            // 
            // MenuItemCheckControl
            // 
            this.MenuItemCheckControl.Image = global::Kdr.TeknikServis.Properties.Resources._11;
            this.MenuItemCheckControl.Name = "MenuItemCheckControl";
            this.MenuItemCheckControl.Size = new System.Drawing.Size(214, 26);
            this.MenuItemCheckControl.Text = "Kontrol Et";
            this.MenuItemCheckControl.Click += new System.EventHandler(this.MenuItemCheckControl_Click);
            // 
            // TamirPersonel
            // 
            this.TamirPersonel.DataPropertyName = "TamirPersonel";
            this.TamirPersonel.HeaderText = "Personel Adı";
            this.TamirPersonel.MinimumWidth = 6;
            this.TamirPersonel.Name = "TamirPersonel";
            this.TamirPersonel.Width = 130;
            // 
            // musteriAdiDataGridViewTextBoxColumn
            // 
            this.musteriAdiDataGridViewTextBoxColumn.DataPropertyName = "MusteriAdi";
            this.musteriAdiDataGridViewTextBoxColumn.HeaderText = "Müşteri Adı";
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
            this.seriNoDataGridViewTextBoxColumn.HeaderText = "Seri No";
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
            // UserControlTeknikOnayBekleyen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.textBoxBarcode);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridViewWait);
            this.Name = "UserControlTeknikOnayBekleyen";
            this.Size = new System.Drawing.Size(876, 441);
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
        private System.Windows.Forms.ToolStripMenuItem MenuItemCheckControl;
        private System.Windows.Forms.DataGridViewTextBoxColumn TamirPersonel;
        private System.Windows.Forms.DataGridViewTextBoxColumn musteriAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn markaDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn modelDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn seriNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn teslimTarihiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn barcodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tamirDurumDataGridViewTextBoxColumn;
    }
}
