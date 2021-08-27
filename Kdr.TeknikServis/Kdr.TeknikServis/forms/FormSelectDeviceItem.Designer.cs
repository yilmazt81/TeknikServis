
namespace Kdr.TeknikServis.forms
{
    partial class FormSelectDeviceItem
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormSelectDeviceItem));
            this.buttonCancel = new System.Windows.Forms.Button();
            this.buttonOk = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.dataGridViewItem = new System.Windows.Forms.DataGridView();
            this.cihazParcaBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.parcaAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.barkodDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.stokAdetDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.markaDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.modelDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewItem)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cihazParcaBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // buttonCancel
            // 
            this.buttonCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonCancel.Image = global::Kdr.TeknikServis.Properties.Resources._50;
            this.buttonCancel.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonCancel.Location = new System.Drawing.Point(309, 316);
            this.buttonCancel.Margin = new System.Windows.Forms.Padding(5);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(188, 47);
            this.buttonCancel.TabIndex = 5;
            this.buttonCancel.Text = "İptal";
            this.buttonCancel.UseVisualStyleBackColor = true;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
            // 
            // buttonOk
            // 
            this.buttonOk.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonOk.Image = global::Kdr.TeknikServis.Properties.Resources.Accept;
            this.buttonOk.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonOk.Location = new System.Drawing.Point(533, 316);
            this.buttonOk.Margin = new System.Windows.Forms.Padding(5);
            this.buttonOk.Name = "buttonOk";
            this.buttonOk.Size = new System.Drawing.Size(188, 47);
            this.buttonOk.TabIndex = 4;
            this.buttonOk.Text = "Tamam";
            this.buttonOk.UseVisualStyleBackColor = true;
            this.buttonOk.Click += new System.EventHandler(this.buttonOk_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(13, 23);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(133, 124);
            this.pictureBox1.TabIndex = 6;
            this.pictureBox1.TabStop = false;
            // 
            // dataGridViewItem
            // 
            this.dataGridViewItem.AutoGenerateColumns = false;
            this.dataGridViewItem.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewItem.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.parcaAdiDataGridViewTextBoxColumn,
            this.barkodDataGridViewTextBoxColumn,
            this.stokAdetDataGridViewTextBoxColumn,
            this.markaDataGridViewTextBoxColumn,
            this.modelDataGridViewTextBoxColumn});
            this.dataGridViewItem.DataSource = this.cihazParcaBindingSource;
            this.dataGridViewItem.Location = new System.Drawing.Point(152, 12);
            this.dataGridViewItem.Name = "dataGridViewItem";
            this.dataGridViewItem.RowHeadersWidth = 51;
            this.dataGridViewItem.RowTemplate.Height = 24;
            this.dataGridViewItem.Size = new System.Drawing.Size(569, 284);
            this.dataGridViewItem.TabIndex = 7;
            // 
            // cihazParcaBindingSource
            // 
            this.cihazParcaBindingSource.DataSource = typeof(Kdr.DBLayer.CihazParca);
            // 
            // parcaAdiDataGridViewTextBoxColumn
            // 
            this.parcaAdiDataGridViewTextBoxColumn.DataPropertyName = "ParcaAdi";
            this.parcaAdiDataGridViewTextBoxColumn.HeaderText = "Parça Adi";
            this.parcaAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.parcaAdiDataGridViewTextBoxColumn.Name = "parcaAdiDataGridViewTextBoxColumn";
            this.parcaAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // barkodDataGridViewTextBoxColumn
            // 
            this.barkodDataGridViewTextBoxColumn.DataPropertyName = "Barkod";
            this.barkodDataGridViewTextBoxColumn.HeaderText = "Barkod";
            this.barkodDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.barkodDataGridViewTextBoxColumn.Name = "barkodDataGridViewTextBoxColumn";
            this.barkodDataGridViewTextBoxColumn.Width = 125;
            // 
            // stokAdetDataGridViewTextBoxColumn
            // 
            this.stokAdetDataGridViewTextBoxColumn.DataPropertyName = "StokAdet";
            this.stokAdetDataGridViewTextBoxColumn.HeaderText = "Stok Adet";
            this.stokAdetDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.stokAdetDataGridViewTextBoxColumn.Name = "stokAdetDataGridViewTextBoxColumn";
            this.stokAdetDataGridViewTextBoxColumn.Width = 125;
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
            // FormSelectDeviceItem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(735, 377);
            this.Controls.Add(this.dataGridViewItem);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonOk);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximizeBox = false;
            this.Name = "FormSelectDeviceItem";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Parça Seçim";
            this.Load += new System.EventHandler(this.FormSelectDeviceItem_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewItem)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cihazParcaBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonOk;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.DataGridView dataGridViewItem;
        private System.Windows.Forms.DataGridViewTextBoxColumn parcaAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn barkodDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn stokAdetDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn markaDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn modelDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource cihazParcaBindingSource;
    }
}