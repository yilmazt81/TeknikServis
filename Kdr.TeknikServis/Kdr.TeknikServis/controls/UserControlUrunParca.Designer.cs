
namespace Kdr.TeknikServis.controls
{
    partial class UserControlUrunParca
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
            this.dataGridViewParcaListe = new System.Windows.Forms.DataGridView();
            this.cMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.MenuItemNew = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItemEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.cihazParcaBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxBarcode = new System.Windows.Forms.TextBox();
            this.textBoxUrunAdi = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.barkodDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Marka = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Model = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.parcaAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fiyatDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MontajUcreti = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.stokAdetDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewParcaListe)).BeginInit();
            this.cMenuStrip.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cihazParcaBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewParcaListe
            // 
            this.dataGridViewParcaListe.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewParcaListe.AutoGenerateColumns = false;
            this.dataGridViewParcaListe.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewParcaListe.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.barkodDataGridViewTextBoxColumn,
            this.Marka,
            this.Model,
            this.parcaAdiDataGridViewTextBoxColumn,
            this.fiyatDataGridViewTextBoxColumn,
            this.MontajUcreti,
            this.stokAdetDataGridViewTextBoxColumn});
            this.dataGridViewParcaListe.ContextMenuStrip = this.cMenuStrip;
            this.dataGridViewParcaListe.DataSource = this.cihazParcaBindingSource;
            this.dataGridViewParcaListe.Location = new System.Drawing.Point(3, 57);
            this.dataGridViewParcaListe.Name = "dataGridViewParcaListe";
            this.dataGridViewParcaListe.RowHeadersWidth = 51;
            this.dataGridViewParcaListe.RowTemplate.Height = 24;
            this.dataGridViewParcaListe.Size = new System.Drawing.Size(778, 318);
            this.dataGridViewParcaListe.TabIndex = 0;
            // 
            // cMenuStrip
            // 
            this.cMenuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemNew,
            this.MenuItemEdit});
            this.cMenuStrip.Name = "cMenuStrip";
            this.cMenuStrip.Size = new System.Drawing.Size(135, 56);
            // 
            // MenuItemNew
            // 
            this.MenuItemNew.Image = global::Kdr.TeknikServis.Properties.Resources._21;
            this.MenuItemNew.Name = "MenuItemNew";
            this.MenuItemNew.Size = new System.Drawing.Size(134, 26);
            this.MenuItemNew.Text = "Yeni";
            this.MenuItemNew.Click += new System.EventHandler(this.MenuItemNew_Click);
            // 
            // MenuItemEdit
            // 
            this.MenuItemEdit.Image = global::Kdr.TeknikServis.Properties.Resources.Edit;
            this.MenuItemEdit.Name = "MenuItemEdit";
            this.MenuItemEdit.Size = new System.Drawing.Size(134, 26);
            this.MenuItemEdit.Text = "Değiştir";
            this.MenuItemEdit.Click += new System.EventHandler(this.MenuItemEdit_Click);
            // 
            // cihazParcaBindingSource
            // 
            this.cihazParcaBindingSource.DataSource = typeof(Kdr.DBLayer.CihazParca);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Ürün Barkod";
            // 
            // textBoxBarcode
            // 
            this.textBoxBarcode.Location = new System.Drawing.Point(115, 21);
            this.textBoxBarcode.Name = "textBoxBarcode";
            this.textBoxBarcode.Size = new System.Drawing.Size(133, 22);
            this.textBoxBarcode.TabIndex = 2;
            this.textBoxBarcode.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxBarcode_KeyDown);
            // 
            // textBoxUrunAdi
            // 
            this.textBoxUrunAdi.Location = new System.Drawing.Point(333, 21);
            this.textBoxUrunAdi.Name = "textBoxUrunAdi";
            this.textBoxUrunAdi.Size = new System.Drawing.Size(191, 22);
            this.textBoxUrunAdi.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(264, 24);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Ürün Adı";
            // 
            // buttonSearch
            // 
            this.buttonSearch.Image = global::Kdr.TeknikServis.Properties.Resources.Query;
            this.buttonSearch.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonSearch.Location = new System.Drawing.Point(549, 19);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(110, 27);
            this.buttonSearch.TabIndex = 5;
            this.buttonSearch.Text = "Ara";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // barkodDataGridViewTextBoxColumn
            // 
            this.barkodDataGridViewTextBoxColumn.DataPropertyName = "Barkod";
            this.barkodDataGridViewTextBoxColumn.HeaderText = "Barkod";
            this.barkodDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.barkodDataGridViewTextBoxColumn.Name = "barkodDataGridViewTextBoxColumn";
            this.barkodDataGridViewTextBoxColumn.Width = 125;
            // 
            // Marka
            // 
            this.Marka.DataPropertyName = "Marka";
            this.Marka.HeaderText = "Marka";
            this.Marka.MinimumWidth = 6;
            this.Marka.Name = "Marka";
            this.Marka.Width = 125;
            // 
            // Model
            // 
            this.Model.DataPropertyName = "Model";
            this.Model.HeaderText = "Model";
            this.Model.MinimumWidth = 6;
            this.Model.Name = "Model";
            this.Model.Width = 125;
            // 
            // parcaAdiDataGridViewTextBoxColumn
            // 
            this.parcaAdiDataGridViewTextBoxColumn.DataPropertyName = "ParcaAdi";
            this.parcaAdiDataGridViewTextBoxColumn.HeaderText = "Parça Adi";
            this.parcaAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.parcaAdiDataGridViewTextBoxColumn.Name = "parcaAdiDataGridViewTextBoxColumn";
            this.parcaAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // fiyatDataGridViewTextBoxColumn
            // 
            this.fiyatDataGridViewTextBoxColumn.DataPropertyName = "Fiyat";
            this.fiyatDataGridViewTextBoxColumn.HeaderText = "Fiyat";
            this.fiyatDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.fiyatDataGridViewTextBoxColumn.Name = "fiyatDataGridViewTextBoxColumn";
            this.fiyatDataGridViewTextBoxColumn.Width = 125;
            // 
            // MontajUcreti
            // 
            this.MontajUcreti.DataPropertyName = "MontajUcreti";
            this.MontajUcreti.HeaderText = "Montaj Ücreti";
            this.MontajUcreti.MinimumWidth = 6;
            this.MontajUcreti.Name = "MontajUcreti";
            this.MontajUcreti.Width = 125;
            // 
            // stokAdetDataGridViewTextBoxColumn
            // 
            this.stokAdetDataGridViewTextBoxColumn.DataPropertyName = "StokAdet";
            this.stokAdetDataGridViewTextBoxColumn.HeaderText = "Stok Adet";
            this.stokAdetDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.stokAdetDataGridViewTextBoxColumn.Name = "stokAdetDataGridViewTextBoxColumn";
            this.stokAdetDataGridViewTextBoxColumn.Width = 125;
            // 
            // UserControlUrunParca
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.textBoxUrunAdi);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBoxBarcode);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridViewParcaListe);
            this.Name = "UserControlUrunParca";
            this.Size = new System.Drawing.Size(784, 378);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewParcaListe)).EndInit();
            this.cMenuStrip.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.cihazParcaBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewParcaListe;
        private System.Windows.Forms.BindingSource cihazParcaBindingSource;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxBarcode;
        private System.Windows.Forms.TextBox textBoxUrunAdi;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.ContextMenuStrip cMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem MenuItemNew;
        private System.Windows.Forms.ToolStripMenuItem MenuItemEdit;
        private System.Windows.Forms.DataGridViewTextBoxColumn barkodDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn Marka;
        private System.Windows.Forms.DataGridViewTextBoxColumn Model;
        private System.Windows.Forms.DataGridViewTextBoxColumn parcaAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn fiyatDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn MontajUcreti;
        private System.Windows.Forms.DataGridViewTextBoxColumn stokAdetDataGridViewTextBoxColumn;
    }
}
