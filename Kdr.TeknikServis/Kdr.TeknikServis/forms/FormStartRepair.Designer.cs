
namespace Kdr.TeknikServis.forms
{
    partial class FormStartRepair
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormStartRepair));
            this.sContainerMain = new System.Windows.Forms.SplitContainer();
            this.groupBoxTamirPersonel = new System.Windows.Forms.GroupBox();
            this.textBoxTamirTarih = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.textBoxTamirPersonel = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.textBoxMarka = new System.Windows.Forms.TextBox();
            this.textBoxArizaNotu = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.textBoxSeriesId = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.textBoxModel = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.buttonAddItem = new System.Windows.Forms.Button();
            this.dataGridViewChangeItems = new System.Windows.Forms.DataGridView();
            this.cMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.MenuItemDelete = new System.Windows.Forms.ToolStripMenuItem();
            this.cihazTamirAddCihazPersonelInfoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label6 = new System.Windows.Forms.Label();
            this.textBoxTeknikPersonelNot = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.buttonOk = new System.Windows.Forms.Button();
            this.personelNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.addDateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.parcaAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.parcaBekliyorDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.sContainerMain)).BeginInit();
            this.sContainerMain.Panel1.SuspendLayout();
            this.sContainerMain.Panel2.SuspendLayout();
            this.sContainerMain.SuspendLayout();
            this.groupBoxTamirPersonel.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewChangeItems)).BeginInit();
            this.cMenuStrip.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cihazTamirAddCihazPersonelInfoBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // sContainerMain
            // 
            this.sContainerMain.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.sContainerMain.Location = new System.Drawing.Point(12, 12);
            this.sContainerMain.Name = "sContainerMain";
            // 
            // sContainerMain.Panel1
            // 
            this.sContainerMain.Panel1.Controls.Add(this.groupBoxTamirPersonel);
            this.sContainerMain.Panel1.Controls.Add(this.groupBox1);
            // 
            // sContainerMain.Panel2
            // 
            this.sContainerMain.Panel2.Controls.Add(this.groupBox2);
            this.sContainerMain.Size = new System.Drawing.Size(947, 529);
            this.sContainerMain.SplitterDistance = 315;
            this.sContainerMain.TabIndex = 8;
            // 
            // groupBoxTamirPersonel
            // 
            this.groupBoxTamirPersonel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBoxTamirPersonel.Controls.Add(this.textBoxTamirTarih);
            this.groupBoxTamirPersonel.Controls.Add(this.label8);
            this.groupBoxTamirPersonel.Controls.Add(this.textBoxTamirPersonel);
            this.groupBoxTamirPersonel.Controls.Add(this.label7);
            this.groupBoxTamirPersonel.Location = new System.Drawing.Point(4, 317);
            this.groupBoxTamirPersonel.Name = "groupBoxTamirPersonel";
            this.groupBoxTamirPersonel.Size = new System.Drawing.Size(308, 122);
            this.groupBoxTamirPersonel.TabIndex = 1;
            this.groupBoxTamirPersonel.TabStop = false;
            this.groupBoxTamirPersonel.Text = "Tamir Eden Personel";
            this.groupBoxTamirPersonel.Visible = false;
            // 
            // textBoxTamirTarih
            // 
            this.textBoxTamirTarih.BackColor = System.Drawing.Color.White;
            this.textBoxTamirTarih.Location = new System.Drawing.Point(115, 77);
            this.textBoxTamirTarih.Name = "textBoxTamirTarih";
            this.textBoxTamirTarih.ReadOnly = true;
            this.textBoxTamirTarih.Size = new System.Drawing.Size(190, 27);
            this.textBoxTamirTarih.TabIndex = 30;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(11, 80);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(47, 20);
            this.label8.TabIndex = 29;
            this.label8.Text = "Tarih";
            // 
            // textBoxTamirPersonel
            // 
            this.textBoxTamirPersonel.BackColor = System.Drawing.Color.White;
            this.textBoxTamirPersonel.Location = new System.Drawing.Point(115, 35);
            this.textBoxTamirPersonel.Name = "textBoxTamirPersonel";
            this.textBoxTamirPersonel.ReadOnly = true;
            this.textBoxTamirPersonel.Size = new System.Drawing.Size(190, 27);
            this.textBoxTamirPersonel.TabIndex = 28;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(11, 38);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(98, 20);
            this.label7.TabIndex = 27;
            this.label7.Text = "Adı / Soyadı";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.textBoxMarka);
            this.groupBox1.Controls.Add(this.textBoxArizaNotu);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.textBoxSeriesId);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.textBoxModel);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(315, 311);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Cihaz Bilgileri";
            // 
            // textBoxMarka
            // 
            this.textBoxMarka.BackColor = System.Drawing.Color.White;
            this.textBoxMarka.Location = new System.Drawing.Point(119, 32);
            this.textBoxMarka.Name = "textBoxMarka";
            this.textBoxMarka.ReadOnly = true;
            this.textBoxMarka.Size = new System.Drawing.Size(190, 27);
            this.textBoxMarka.TabIndex = 26;
            // 
            // textBoxArizaNotu
            // 
            this.textBoxArizaNotu.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxArizaNotu.BackColor = System.Drawing.Color.White;
            this.textBoxArizaNotu.Location = new System.Drawing.Point(119, 183);
            this.textBoxArizaNotu.Multiline = true;
            this.textBoxArizaNotu.Name = "textBoxArizaNotu";
            this.textBoxArizaNotu.ReadOnly = true;
            this.textBoxArizaNotu.Size = new System.Drawing.Size(190, 112);
            this.textBoxArizaNotu.TabIndex = 25;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 183);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(88, 20);
            this.label5.TabIndex = 24;
            this.label5.Text = "Arıza Notu";
            // 
            // textBoxSeriesId
            // 
            this.textBoxSeriesId.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxSeriesId.BackColor = System.Drawing.Color.White;
            this.textBoxSeriesId.Location = new System.Drawing.Point(119, 127);
            this.textBoxSeriesId.Name = "textBoxSeriesId";
            this.textBoxSeriesId.ReadOnly = true;
            this.textBoxSeriesId.Size = new System.Drawing.Size(190, 27);
            this.textBoxSeriesId.TabIndex = 23;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(10, 127);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(65, 20);
            this.label4.TabIndex = 22;
            this.label4.Text = "Seri No";
            // 
            // textBoxModel
            // 
            this.textBoxModel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxModel.BackColor = System.Drawing.Color.White;
            this.textBoxModel.Location = new System.Drawing.Point(119, 79);
            this.textBoxModel.Name = "textBoxModel";
            this.textBoxModel.ReadOnly = true;
            this.textBoxModel.Size = new System.Drawing.Size(190, 27);
            this.textBoxModel.TabIndex = 21;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 79);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 20);
            this.label3.TabIndex = 20;
            this.label3.Text = "Model";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 32);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(55, 20);
            this.label2.TabIndex = 18;
            this.label2.Text = "Marka";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.buttonAddItem);
            this.groupBox2.Controls.Add(this.dataGridViewChangeItems);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.textBoxTeknikPersonelNot);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox2.Location = new System.Drawing.Point(0, 0);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(628, 526);
            this.groupBox2.TabIndex = 0;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Teknisyen Çalışması";
            // 
            // buttonAddItem
            // 
            this.buttonAddItem.Image = global::Kdr.TeknikServis.Properties.Resources.add;
            this.buttonAddItem.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonAddItem.Location = new System.Drawing.Point(214, 218);
            this.buttonAddItem.Name = "buttonAddItem";
            this.buttonAddItem.Size = new System.Drawing.Size(176, 34);
            this.buttonAddItem.TabIndex = 31;
            this.buttonAddItem.Text = "Parça ekle";
            this.buttonAddItem.UseVisualStyleBackColor = true;
            this.buttonAddItem.Click += new System.EventHandler(this.buttonAddItem_Click);
            // 
            // dataGridViewChangeItems
            // 
            this.dataGridViewChangeItems.AutoGenerateColumns = false;
            this.dataGridViewChangeItems.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewChangeItems.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.personelNameDataGridViewTextBoxColumn,
            this.addDateDataGridViewTextBoxColumn,
            this.parcaAdiDataGridViewTextBoxColumn,
            this.parcaBekliyorDataGridViewCheckBoxColumn});
            this.dataGridViewChangeItems.ContextMenuStrip = this.cMenuStrip;
            this.dataGridViewChangeItems.DataSource = this.cihazTamirAddCihazPersonelInfoBindingSource;
            this.dataGridViewChangeItems.Location = new System.Drawing.Point(11, 265);
            this.dataGridViewChangeItems.Name = "dataGridViewChangeItems";
            this.dataGridViewChangeItems.RowHeadersWidth = 51;
            this.dataGridViewChangeItems.RowTemplate.Height = 24;
            this.dataGridViewChangeItems.Size = new System.Drawing.Size(601, 255);
            this.dataGridViewChangeItems.TabIndex = 30;
            // 
            // cMenuStrip
            // 
            this.cMenuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemDelete});
            this.cMenuStrip.Name = "cMenuStrip";
            this.cMenuStrip.Size = new System.Drawing.Size(99, 30);
            // 
            // MenuItemDelete
            // 
            this.MenuItemDelete.Image = global::Kdr.TeknikServis.Properties.Resources.Remove;
            this.MenuItemDelete.Name = "MenuItemDelete";
            this.MenuItemDelete.Size = new System.Drawing.Size(98, 26);
            this.MenuItemDelete.Text = "Sil";
            this.MenuItemDelete.Click += new System.EventHandler(this.MenuItemDelete_Click);
            // 
            // cihazTamirAddCihazPersonelInfoBindingSource
            // 
            this.cihazTamirAddCihazPersonelInfoBindingSource.DataSource = typeof(Kdr.DBLayer.CihazTamirAddCihazPersonelInfo);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(7, 225);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(143, 20);
            this.label6.TabIndex = 29;
            this.label6.Text = "Parça Değişimleri";
            // 
            // textBoxTeknikPersonelNot
            // 
            this.textBoxTeknikPersonelNot.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxTeknikPersonelNot.Location = new System.Drawing.Point(6, 58);
            this.textBoxTeknikPersonelNot.Multiline = true;
            this.textBoxTeknikPersonelNot.Name = "textBoxTeknikPersonelNot";
            this.textBoxTeknikPersonelNot.Size = new System.Drawing.Size(616, 145);
            this.textBoxTeknikPersonelNot.TabIndex = 28;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(124, 20);
            this.label1.TabIndex = 27;
            this.label1.Text = "Teknisyen Notu";
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.DataPropertyName = "CihazParca";
            this.dataGridViewTextBoxColumn1.HeaderText = "CihazParca";
            this.dataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            this.dataGridViewTextBoxColumn1.Width = 125;
            // 
            // buttonCancel
            // 
            this.buttonCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonCancel.Image = global::Kdr.TeknikServis.Properties.Resources._50;
            this.buttonCancel.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonCancel.Location = new System.Drawing.Point(545, 549);
            this.buttonCancel.Margin = new System.Windows.Forms.Padding(5);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(188, 47);
            this.buttonCancel.TabIndex = 7;
            this.buttonCancel.Text = "İptal";
            this.buttonCancel.UseVisualStyleBackColor = true;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
            // 
            // buttonOk
            // 
            this.buttonOk.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonOk.Image = global::Kdr.TeknikServis.Properties.Resources.Accept;
            this.buttonOk.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonOk.Location = new System.Drawing.Point(769, 549);
            this.buttonOk.Margin = new System.Windows.Forms.Padding(5);
            this.buttonOk.Name = "buttonOk";
            this.buttonOk.Size = new System.Drawing.Size(188, 47);
            this.buttonOk.TabIndex = 6;
            this.buttonOk.Text = "Tamam";
            this.buttonOk.UseVisualStyleBackColor = true;
            this.buttonOk.Click += new System.EventHandler(this.buttonOk_Click);
            // 
            // personelNameDataGridViewTextBoxColumn
            // 
            this.personelNameDataGridViewTextBoxColumn.DataPropertyName = "PersonelName";
            this.personelNameDataGridViewTextBoxColumn.FillWeight = 150F;
            this.personelNameDataGridViewTextBoxColumn.HeaderText = "Ekleyen Personel";
            this.personelNameDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.personelNameDataGridViewTextBoxColumn.Name = "personelNameDataGridViewTextBoxColumn";
            this.personelNameDataGridViewTextBoxColumn.Width = 200;
            // 
            // addDateDataGridViewTextBoxColumn
            // 
            this.addDateDataGridViewTextBoxColumn.DataPropertyName = "AddDate";
            this.addDateDataGridViewTextBoxColumn.FillWeight = 150F;
            this.addDateDataGridViewTextBoxColumn.HeaderText = "Ekleme Tarihi";
            this.addDateDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.addDateDataGridViewTextBoxColumn.Name = "addDateDataGridViewTextBoxColumn";
            this.addDateDataGridViewTextBoxColumn.Width = 150;
            // 
            // parcaAdiDataGridViewTextBoxColumn
            // 
            this.parcaAdiDataGridViewTextBoxColumn.DataPropertyName = "ParcaAdi";
            this.parcaAdiDataGridViewTextBoxColumn.HeaderText = "Parça Adi";
            this.parcaAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.parcaAdiDataGridViewTextBoxColumn.Name = "parcaAdiDataGridViewTextBoxColumn";
            this.parcaAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // parcaBekliyorDataGridViewCheckBoxColumn
            // 
            this.parcaBekliyorDataGridViewCheckBoxColumn.DataPropertyName = "ParcaBekliyor";
            this.parcaBekliyorDataGridViewCheckBoxColumn.HeaderText = "Parça Bekliyor";
            this.parcaBekliyorDataGridViewCheckBoxColumn.MinimumWidth = 6;
            this.parcaBekliyorDataGridViewCheckBoxColumn.Name = "parcaBekliyorDataGridViewCheckBoxColumn";
            this.parcaBekliyorDataGridViewCheckBoxColumn.Width = 125;
            // 
            // FormStartRepair
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(971, 610);
            this.Controls.Add(this.sContainerMain);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonOk);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FormStartRepair";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cihaz Tamir Ekranı";
            this.sContainerMain.Panel1.ResumeLayout(false);
            this.sContainerMain.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.sContainerMain)).EndInit();
            this.sContainerMain.ResumeLayout(false);
            this.groupBoxTamirPersonel.ResumeLayout(false);
            this.groupBoxTamirPersonel.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewChangeItems)).EndInit();
            this.cMenuStrip.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.cihazTamirAddCihazPersonelInfoBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonOk;
        private System.Windows.Forms.SplitContainer sContainerMain;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox textBoxMarka;
        private System.Windows.Forms.TextBox textBoxArizaNotu;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBoxSeriesId;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBoxModel;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox textBoxTeknikPersonelNot;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridViewChangeItems;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button buttonAddItem;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.ContextMenuStrip cMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem MenuItemDelete;
        private System.Windows.Forms.BindingSource cihazTamirAddCihazPersonelInfoBindingSource;
        private System.Windows.Forms.GroupBox groupBoxTamirPersonel;
        private System.Windows.Forms.TextBox textBoxTamirTarih;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox textBoxTamirPersonel;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DataGridViewTextBoxColumn personelNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn addDateDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn parcaAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn parcaBekliyorDataGridViewCheckBoxColumn;
    }
}