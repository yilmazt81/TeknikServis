
namespace Kdr.TeknikServis.controls
{
    partial class UserControlUrunTeslimAl
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
            this.dataGridViewDeliveryList = new System.Windows.Forms.DataGridView();
            this.musteriAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gsmNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.epostaDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ılAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ılceAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.markaDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.modelDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.seriNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.teslimTarihiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.barcodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TamirDurum = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.MenuItemNew = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItemEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItemPrint = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.MenuItemGiveBackCustomer = new System.Windows.Forms.ToolStripMenuItem();
            this.vTamirTeslimBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxBarcode = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxMusteriAdi = new System.Windows.Forms.TextBox();
            this.textBoxPhoneCode = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewDeliveryList)).BeginInit();
            this.cMenuStrip.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.vTamirTeslimBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewDeliveryList
            // 
            this.dataGridViewDeliveryList.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewDeliveryList.AutoGenerateColumns = false;
            this.dataGridViewDeliveryList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewDeliveryList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.musteriAdiDataGridViewTextBoxColumn,
            this.gsmNoDataGridViewTextBoxColumn,
            this.epostaDataGridViewTextBoxColumn,
            this.ılAdiDataGridViewTextBoxColumn,
            this.ılceAdiDataGridViewTextBoxColumn,
            this.markaDataGridViewTextBoxColumn,
            this.modelDataGridViewTextBoxColumn,
            this.seriNoDataGridViewTextBoxColumn,
            this.teslimTarihiDataGridViewTextBoxColumn,
            this.barcodeDataGridViewTextBoxColumn,
            this.TamirDurum});
            this.dataGridViewDeliveryList.ContextMenuStrip = this.cMenuStrip;
            this.dataGridViewDeliveryList.DataSource = this.vTamirTeslimBindingSource;
            this.dataGridViewDeliveryList.Location = new System.Drawing.Point(9, 73);
            this.dataGridViewDeliveryList.Name = "dataGridViewDeliveryList";
            this.dataGridViewDeliveryList.RowHeadersWidth = 51;
            this.dataGridViewDeliveryList.RowTemplate.Height = 24;
            this.dataGridViewDeliveryList.Size = new System.Drawing.Size(799, 489);
            this.dataGridViewDeliveryList.TabIndex = 0;
            // 
            // musteriAdiDataGridViewTextBoxColumn
            // 
            this.musteriAdiDataGridViewTextBoxColumn.DataPropertyName = "MusteriAdi";
            this.musteriAdiDataGridViewTextBoxColumn.HeaderText = "Musteri Adi";
            this.musteriAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.musteriAdiDataGridViewTextBoxColumn.Name = "musteriAdiDataGridViewTextBoxColumn";
            this.musteriAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // gsmNoDataGridViewTextBoxColumn
            // 
            this.gsmNoDataGridViewTextBoxColumn.DataPropertyName = "GsmNo";
            this.gsmNoDataGridViewTextBoxColumn.HeaderText = "Gsm No";
            this.gsmNoDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gsmNoDataGridViewTextBoxColumn.Name = "gsmNoDataGridViewTextBoxColumn";
            this.gsmNoDataGridViewTextBoxColumn.Width = 125;
            // 
            // epostaDataGridViewTextBoxColumn
            // 
            this.epostaDataGridViewTextBoxColumn.DataPropertyName = "Eposta";
            this.epostaDataGridViewTextBoxColumn.HeaderText = "E posta";
            this.epostaDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.epostaDataGridViewTextBoxColumn.Name = "epostaDataGridViewTextBoxColumn";
            this.epostaDataGridViewTextBoxColumn.Width = 125;
            // 
            // ılAdiDataGridViewTextBoxColumn
            // 
            this.ılAdiDataGridViewTextBoxColumn.DataPropertyName = "IlAdi";
            this.ılAdiDataGridViewTextBoxColumn.HeaderText = "Şehir";
            this.ılAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.ılAdiDataGridViewTextBoxColumn.Name = "ılAdiDataGridViewTextBoxColumn";
            this.ılAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // ılceAdiDataGridViewTextBoxColumn
            // 
            this.ılceAdiDataGridViewTextBoxColumn.DataPropertyName = "IlceAdi";
            this.ılceAdiDataGridViewTextBoxColumn.HeaderText = "İlçe";
            this.ılceAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.ılceAdiDataGridViewTextBoxColumn.Name = "ılceAdiDataGridViewTextBoxColumn";
            this.ılceAdiDataGridViewTextBoxColumn.Width = 125;
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
            // TamirDurum
            // 
            this.TamirDurum.DataPropertyName = "TamirDurum";
            this.TamirDurum.HeaderText = "Tamir Durum";
            this.TamirDurum.MinimumWidth = 6;
            this.TamirDurum.Name = "TamirDurum";
            this.TamirDurum.Width = 125;
            // 
            // cMenuStrip
            // 
            this.cMenuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemNew,
            this.MenuItemEdit,
            this.MenuItemPrint,
            this.toolStripMenuItem1,
            this.MenuItemGiveBackCustomer});
            this.cMenuStrip.Name = "cMenuStrip";
            this.cMenuStrip.Size = new System.Drawing.Size(210, 114);
            // 
            // MenuItemNew
            // 
            this.MenuItemNew.Image = global::Kdr.TeknikServis.Properties.Resources._21;
            this.MenuItemNew.Name = "MenuItemNew";
            this.MenuItemNew.Size = new System.Drawing.Size(209, 26);
            this.MenuItemNew.Text = "Yeni";
            this.MenuItemNew.Click += new System.EventHandler(this.MenuItemNew_Click);
            // 
            // MenuItemEdit
            // 
            this.MenuItemEdit.Image = global::Kdr.TeknikServis.Properties.Resources.Edit;
            this.MenuItemEdit.Name = "MenuItemEdit";
            this.MenuItemEdit.Size = new System.Drawing.Size(209, 26);
            this.MenuItemEdit.Text = "Değiştir";
            this.MenuItemEdit.Click += new System.EventHandler(this.MenuItemEdit_Click);
            // 
            // MenuItemPrint
            // 
            this.MenuItemPrint.Image = global::Kdr.TeknikServis.Properties.Resources._23;
            this.MenuItemPrint.Name = "MenuItemPrint";
            this.MenuItemPrint.Size = new System.Drawing.Size(209, 26);
            this.MenuItemPrint.Text = "Tutanak Yazdır";
            this.MenuItemPrint.Click += new System.EventHandler(this.MenuItemPrint_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(206, 6);
            // 
            // MenuItemGiveBackCustomer
            // 
            this.MenuItemGiveBackCustomer.Image = global::Kdr.TeknikServis.Properties.Resources.UserBlue;
            this.MenuItemGiveBackCustomer.Name = "MenuItemGiveBackCustomer";
            this.MenuItemGiveBackCustomer.Size = new System.Drawing.Size(209, 26);
            this.MenuItemGiveBackCustomer.Text = "Müşteriye Teslim Et";
            this.MenuItemGiveBackCustomer.Click += new System.EventHandler(this.MenuItemGiveBackCustomer_Click);
            // 
            // vTamirTeslimBindingSource
            // 
            this.vTamirTeslimBindingSource.DataSource = typeof(Kdr.DBLayer.vTamirTeslim);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(23, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Barkod";
            // 
            // textBoxBarcode
            // 
            this.textBoxBarcode.Location = new System.Drawing.Point(82, 21);
            this.textBoxBarcode.Name = "textBoxBarcode";
            this.textBoxBarcode.Size = new System.Drawing.Size(162, 22);
            this.textBoxBarcode.TabIndex = 2;
            this.textBoxBarcode.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxBarcode_KeyDown);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(261, 26);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(78, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Müşteri Adı";
            // 
            // textBoxMusteriAdi
            // 
            this.textBoxMusteriAdi.Location = new System.Drawing.Point(345, 21);
            this.textBoxMusteriAdi.Name = "textBoxMusteriAdi";
            this.textBoxMusteriAdi.Size = new System.Drawing.Size(242, 22);
            this.textBoxMusteriAdi.TabIndex = 4;
            this.textBoxMusteriAdi.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxMusteriAdi_KeyDown);
            // 
            // textBoxPhoneCode
            // 
            this.textBoxPhoneCode.Location = new System.Drawing.Point(675, 23);
            this.textBoxPhoneCode.Name = "textBoxPhoneCode";
            this.textBoxPhoneCode.Size = new System.Drawing.Size(140, 22);
            this.textBoxPhoneCode.TabIndex = 6;
            this.textBoxPhoneCode.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxPhoneCode_KeyDown);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(591, 24);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(78, 17);
            this.label3.TabIndex = 5;
            this.label3.Text = "Telefon No";
            // 
            // UserControlUrunTeslimAl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.textBoxPhoneCode);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBoxMusteriAdi);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBoxBarcode);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridViewDeliveryList);
            this.Name = "UserControlUrunTeslimAl";
            this.Size = new System.Drawing.Size(818, 574);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewDeliveryList)).EndInit();
            this.cMenuStrip.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.vTamirTeslimBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewDeliveryList;
        private System.Windows.Forms.ContextMenuStrip cMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem MenuItemNew;
        private System.Windows.Forms.BindingSource vTamirTeslimBindingSource;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxBarcode;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxMusteriAdi;
        private System.Windows.Forms.DataGridViewTextBoxColumn musteriAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gsmNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn epostaDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ılAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ılceAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn markaDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn modelDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn seriNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn teslimTarihiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn barcodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn TamirDurum;
        private System.Windows.Forms.ToolStripMenuItem MenuItemEdit;
        private System.Windows.Forms.ToolStripMenuItem MenuItemPrint;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem MenuItemGiveBackCustomer;
        private System.Windows.Forms.TextBox textBoxPhoneCode;
        private System.Windows.Forms.Label label3;
    }
}
