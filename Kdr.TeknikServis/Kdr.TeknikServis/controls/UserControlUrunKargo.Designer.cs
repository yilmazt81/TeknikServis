
namespace Kdr.TeknikServis.controls
{
    partial class UserControlUrunKargo
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
            this.dataGridViewReady = new System.Windows.Forms.DataGridView();
            this.IlAdi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.MenuItemSendCargo = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.textBoxBarcode = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dataGridViewCargo = new System.Windows.Forms.DataGridView();
            this.cMenuStripcargo = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.MenuItemPrintAdres = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItemEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.musteriAdiDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ılAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ılceAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.adresDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kargoAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gonderiNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cihazGonderimKargoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.musteriAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.markaDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.modelDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.vTamirTeslimBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewReady)).BeginInit();
            this.cMenuStrip.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCargo)).BeginInit();
            this.cMenuStripcargo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cihazGonderimKargoBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.vTamirTeslimBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewReady
            // 
            this.dataGridViewReady.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewReady.AutoGenerateColumns = false;
            this.dataGridViewReady.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewReady.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.musteriAdiDataGridViewTextBoxColumn,
            this.IlAdi,
            this.markaDataGridViewTextBoxColumn,
            this.modelDataGridViewTextBoxColumn});
            this.dataGridViewReady.ContextMenuStrip = this.cMenuStrip;
            this.dataGridViewReady.DataSource = this.vTamirTeslimBindingSource;
            this.dataGridViewReady.Location = new System.Drawing.Point(6, 48);
            this.dataGridViewReady.Name = "dataGridViewReady";
            this.dataGridViewReady.RowHeadersWidth = 51;
            this.dataGridViewReady.RowTemplate.Height = 24;
            this.dataGridViewReady.Size = new System.Drawing.Size(576, 490);
            this.dataGridViewReady.TabIndex = 0;
            // 
            // IlAdi
            // 
            this.IlAdi.DataPropertyName = "IlAdi";
            this.IlAdi.HeaderText = "Şehir";
            this.IlAdi.MinimumWidth = 6;
            this.IlAdi.Name = "IlAdi";
            this.IlAdi.Width = 125;
            // 
            // cMenuStrip
            // 
            this.cMenuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemSendCargo});
            this.cMenuStrip.Name = "cMenuStrip";
            this.cMenuStrip.Size = new System.Drawing.Size(176, 30);
            // 
            // MenuItemSendCargo
            // 
            this.MenuItemSendCargo.Image = global::Kdr.TeknikServis.Properties.Resources._05;
            this.MenuItemSendCargo.Name = "MenuItemSendCargo";
            this.MenuItemSendCargo.Size = new System.Drawing.Size(175, 26);
            this.MenuItemSendCargo.Text = "Kargo Gönder";
            this.MenuItemSendCargo.Click += new System.EventHandler(this.MenuItemSendCargo_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox1.Controls.Add(this.textBoxBarcode);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.dataGridViewReady);
            this.groupBox1.Location = new System.Drawing.Point(14, 4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(589, 544);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Gönderilecek Cihazlar";
            // 
            // textBoxBarcode
            // 
            this.textBoxBarcode.Location = new System.Drawing.Point(88, 20);
            this.textBoxBarcode.Name = "textBoxBarcode";
            this.textBoxBarcode.Size = new System.Drawing.Size(242, 22);
            this.textBoxBarcode.TabIndex = 9;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 17);
            this.label1.TabIndex = 8;
            this.label1.Text = "Barkod";
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.dataGridViewCargo);
            this.groupBox2.Location = new System.Drawing.Point(609, 4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(417, 538);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Kargoya Verilenler";
            // 
            // dataGridViewCargo
            // 
            this.dataGridViewCargo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewCargo.AutoGenerateColumns = false;
            this.dataGridViewCargo.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewCargo.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.musteriAdiDataGridViewTextBoxColumn1,
            this.ılAdiDataGridViewTextBoxColumn,
            this.ılceAdiDataGridViewTextBoxColumn,
            this.adresDataGridViewTextBoxColumn,
            this.kargoAdiDataGridViewTextBoxColumn,
            this.gonderiNoDataGridViewTextBoxColumn});
            this.dataGridViewCargo.ContextMenuStrip = this.cMenuStripcargo;
            this.dataGridViewCargo.DataSource = this.cihazGonderimKargoBindingSource;
            this.dataGridViewCargo.Location = new System.Drawing.Point(7, 57);
            this.dataGridViewCargo.Name = "dataGridViewCargo";
            this.dataGridViewCargo.RowHeadersWidth = 51;
            this.dataGridViewCargo.RowTemplate.Height = 24;
            this.dataGridViewCargo.Size = new System.Drawing.Size(404, 475);
            this.dataGridViewCargo.TabIndex = 0;
            // 
            // cMenuStripcargo
            // 
            this.cMenuStripcargo.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStripcargo.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemPrintAdres,
            this.MenuItemEdit});
            this.cMenuStripcargo.Name = "cMenuStripcargo";
            this.cMenuStripcargo.Size = new System.Drawing.Size(215, 84);
            // 
            // MenuItemPrintAdres
            // 
            this.MenuItemPrintAdres.Image = global::Kdr.TeknikServis.Properties.Resources.ScanDoc2;
            this.MenuItemPrintAdres.Name = "MenuItemPrintAdres";
            this.MenuItemPrintAdres.Size = new System.Drawing.Size(214, 26);
            this.MenuItemPrintAdres.Text = "Adres Çıktısı Al";
            this.MenuItemPrintAdres.Click += new System.EventHandler(this.MenuItemPrintAdres_Click);
            // 
            // MenuItemEdit
            // 
            this.MenuItemEdit.Image = global::Kdr.TeknikServis.Properties.Resources.Edit;
            this.MenuItemEdit.Name = "MenuItemEdit";
            this.MenuItemEdit.Size = new System.Drawing.Size(214, 26);
            this.MenuItemEdit.Text = "Değiştir";
            this.MenuItemEdit.Click += new System.EventHandler(this.MenuItemEdit_Click);
            // 
            // musteriAdiDataGridViewTextBoxColumn1
            // 
            this.musteriAdiDataGridViewTextBoxColumn1.DataPropertyName = "MusteriAdi";
            this.musteriAdiDataGridViewTextBoxColumn1.HeaderText = "Müşteri Adi";
            this.musteriAdiDataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.musteriAdiDataGridViewTextBoxColumn1.Name = "musteriAdiDataGridViewTextBoxColumn1";
            this.musteriAdiDataGridViewTextBoxColumn1.Width = 125;
            // 
            // ılAdiDataGridViewTextBoxColumn
            // 
            this.ılAdiDataGridViewTextBoxColumn.DataPropertyName = "IlAdi";
            this.ılAdiDataGridViewTextBoxColumn.HeaderText = "İl Adi";
            this.ılAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.ılAdiDataGridViewTextBoxColumn.Name = "ılAdiDataGridViewTextBoxColumn";
            this.ılAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // ılceAdiDataGridViewTextBoxColumn
            // 
            this.ılceAdiDataGridViewTextBoxColumn.DataPropertyName = "IlceAdi";
            this.ılceAdiDataGridViewTextBoxColumn.HeaderText = "İlçe Adi";
            this.ılceAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.ılceAdiDataGridViewTextBoxColumn.Name = "ılceAdiDataGridViewTextBoxColumn";
            this.ılceAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // adresDataGridViewTextBoxColumn
            // 
            this.adresDataGridViewTextBoxColumn.DataPropertyName = "Adres";
            this.adresDataGridViewTextBoxColumn.HeaderText = "Adres";
            this.adresDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.adresDataGridViewTextBoxColumn.Name = "adresDataGridViewTextBoxColumn";
            this.adresDataGridViewTextBoxColumn.Width = 125;
            // 
            // kargoAdiDataGridViewTextBoxColumn
            // 
            this.kargoAdiDataGridViewTextBoxColumn.DataPropertyName = "KargoAdi";
            this.kargoAdiDataGridViewTextBoxColumn.HeaderText = "Kargo Adi";
            this.kargoAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kargoAdiDataGridViewTextBoxColumn.Name = "kargoAdiDataGridViewTextBoxColumn";
            this.kargoAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // gonderiNoDataGridViewTextBoxColumn
            // 
            this.gonderiNoDataGridViewTextBoxColumn.DataPropertyName = "GonderiNo";
            this.gonderiNoDataGridViewTextBoxColumn.HeaderText = "Gönderi No";
            this.gonderiNoDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gonderiNoDataGridViewTextBoxColumn.Name = "gonderiNoDataGridViewTextBoxColumn";
            this.gonderiNoDataGridViewTextBoxColumn.Width = 125;
            // 
            // cihazGonderimKargoBindingSource
            // 
            this.cihazGonderimKargoBindingSource.DataSource = typeof(Kdr.DBLayer.CihazGonderimKargo);
            // 
            // musteriAdiDataGridViewTextBoxColumn
            // 
            this.musteriAdiDataGridViewTextBoxColumn.DataPropertyName = "MusteriAdi";
            this.musteriAdiDataGridViewTextBoxColumn.HeaderText = "Muşteri Adı";
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
            // vTamirTeslimBindingSource
            // 
            this.vTamirTeslimBindingSource.DataSource = typeof(Kdr.DBLayer.vTamirTeslim);
            // 
            // UserControlUrunKargo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "UserControlUrunKargo";
            this.Size = new System.Drawing.Size(1042, 551);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewReady)).EndInit();
            this.cMenuStrip.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCargo)).EndInit();
            this.cMenuStripcargo.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.cihazGonderimKargoBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.vTamirTeslimBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewReady;
        private System.Windows.Forms.BindingSource vTamirTeslimBindingSource;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridViewTextBoxColumn musteriAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn IlAdi;
        private System.Windows.Forms.DataGridViewTextBoxColumn markaDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn modelDataGridViewTextBoxColumn;
        private System.Windows.Forms.TextBox textBoxBarcode;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ContextMenuStrip cMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem MenuItemSendCargo;
        private System.Windows.Forms.DataGridView dataGridViewCargo;
        private System.Windows.Forms.BindingSource cihazGonderimKargoBindingSource;
        private System.Windows.Forms.DataGridViewTextBoxColumn musteriAdiDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn ılAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ılceAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn adresDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kargoAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gonderiNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.ContextMenuStrip cMenuStripcargo;
        private System.Windows.Forms.ToolStripMenuItem MenuItemPrintAdres;
        private System.Windows.Forms.ToolStripMenuItem MenuItemEdit;
    }
}
