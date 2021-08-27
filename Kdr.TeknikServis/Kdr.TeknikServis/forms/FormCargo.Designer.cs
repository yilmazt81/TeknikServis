
namespace Kdr.TeknikServis.forms
{
    partial class FormCargo
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormCargo));
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxCargoName = new System.Windows.Forms.TextBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxBranchName = new System.Windows.Forms.TextBox();
            this.buttonImport = new System.Windows.Forms.Button();
            this.buttonAddSube = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.buttonOk = new System.Windows.Forms.Button();
            this.textBoxPhone = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.subeAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.telefonNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kargoSubeBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kargoSubeBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(177, 47);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 20);
            this.label1.TabIndex = 11;
            this.label1.Text = "Kargo Adı";
            // 
            // textBoxCargoName
            // 
            this.textBoxCargoName.Location = new System.Drawing.Point(288, 40);
            this.textBoxCargoName.Name = "textBoxCargoName";
            this.textBoxCargoName.Size = new System.Drawing.Size(277, 27);
            this.textBoxCargoName.TabIndex = 0;
            // 
            // dataGridView1
            // 
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.subeAdiDataGridViewTextBoxColumn,
            this.telefonNoDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.kargoSubeBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(181, 182);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(445, 334);
            this.dataGridView1.TabIndex = 13;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(177, 98);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(76, 20);
            this.label2.TabIndex = 14;
            this.label2.Text = "Şube Adı";
            // 
            // textBoxBranchName
            // 
            this.textBoxBranchName.Location = new System.Drawing.Point(288, 91);
            this.textBoxBranchName.Name = "textBoxBranchName";
            this.textBoxBranchName.Size = new System.Drawing.Size(272, 27);
            this.textBoxBranchName.TabIndex = 1;
            // 
            // buttonImport
            // 
            this.buttonImport.Image = global::Kdr.TeknikServis.Properties.Resources.BatchSelect;
            this.buttonImport.Location = new System.Drawing.Point(602, 136);
            this.buttonImport.Name = "buttonImport";
            this.buttonImport.Size = new System.Drawing.Size(26, 23);
            this.buttonImport.TabIndex = 4;
            this.buttonImport.UseVisualStyleBackColor = true;
            this.buttonImport.Click += new System.EventHandler(this.buttonImport_Click);
            // 
            // buttonAddSube
            // 
            this.buttonAddSube.Image = global::Kdr.TeknikServis.Properties.Resources.add;
            this.buttonAddSube.Location = new System.Drawing.Point(566, 136);
            this.buttonAddSube.Name = "buttonAddSube";
            this.buttonAddSube.Size = new System.Drawing.Size(26, 23);
            this.buttonAddSube.TabIndex = 3;
            this.buttonAddSube.UseVisualStyleBackColor = true;
            this.buttonAddSube.Click += new System.EventHandler(this.buttonAddSube_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(26, 40);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(109, 107);
            this.pictureBox1.TabIndex = 10;
            this.pictureBox1.TabStop = false;
            // 
            // buttonCancel
            // 
            this.buttonCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonCancel.Image = global::Kdr.TeknikServis.Properties.Resources._50;
            this.buttonCancel.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonCancel.Location = new System.Drawing.Point(214, 524);
            this.buttonCancel.Margin = new System.Windows.Forms.Padding(5);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(188, 47);
            this.buttonCancel.TabIndex = 9;
            this.buttonCancel.Text = "İptal";
            this.buttonCancel.UseVisualStyleBackColor = true;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
            // 
            // buttonOk
            // 
            this.buttonOk.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonOk.Image = global::Kdr.TeknikServis.Properties.Resources.Accept;
            this.buttonOk.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonOk.Location = new System.Drawing.Point(438, 524);
            this.buttonOk.Margin = new System.Windows.Forms.Padding(5);
            this.buttonOk.Name = "buttonOk";
            this.buttonOk.Size = new System.Drawing.Size(188, 47);
            this.buttonOk.TabIndex = 8;
            this.buttonOk.Text = "Tamam";
            this.buttonOk.UseVisualStyleBackColor = true;
            this.buttonOk.Click += new System.EventHandler(this.buttonOk_Click);
            // 
            // textBoxPhone
            // 
            this.textBoxPhone.Location = new System.Drawing.Point(288, 134);
            this.textBoxPhone.Name = "textBoxPhone";
            this.textBoxPhone.Size = new System.Drawing.Size(272, 27);
            this.textBoxPhone.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(177, 141);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(107, 20);
            this.label3.TabIndex = 18;
            this.label3.Text = "Şube Telefon";
            // 
            // subeAdiDataGridViewTextBoxColumn
            // 
            this.subeAdiDataGridViewTextBoxColumn.DataPropertyName = "SubeAdi";
            this.subeAdiDataGridViewTextBoxColumn.HeaderText = "SubeAdi";
            this.subeAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.subeAdiDataGridViewTextBoxColumn.Name = "subeAdiDataGridViewTextBoxColumn";
            this.subeAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // telefonNoDataGridViewTextBoxColumn
            // 
            this.telefonNoDataGridViewTextBoxColumn.DataPropertyName = "TelefonNo";
            this.telefonNoDataGridViewTextBoxColumn.HeaderText = "TelefonNo";
            this.telefonNoDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.telefonNoDataGridViewTextBoxColumn.Name = "telefonNoDataGridViewTextBoxColumn";
            this.telefonNoDataGridViewTextBoxColumn.Width = 125;
            // 
            // kargoSubeBindingSource
            // 
            this.kargoSubeBindingSource.DataSource = typeof(Kdr.DBLayer.KargoSube);
            // 
            // FormCargo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(640, 585);
            this.Controls.Add(this.textBoxPhone);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.buttonImport);
            this.Controls.Add(this.buttonAddSube);
            this.Controls.Add(this.textBoxBranchName);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.textBoxCargoName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonOk);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "FormCargo";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Kargo";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kargoSubeBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonOk;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxCargoName;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxBranchName;
        private System.Windows.Forms.Button buttonAddSube;
        private System.Windows.Forms.Button buttonImport;
        private System.Windows.Forms.DataGridViewTextBoxColumn subeAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn telefonNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource kargoSubeBindingSource;
        private System.Windows.Forms.TextBox textBoxPhone;
        private System.Windows.Forms.Label label3;
    }
}