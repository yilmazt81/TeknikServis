
namespace Kdr.TeknikServis.forms
{
    partial class FormSelectCustomer
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormSelectCustomer));
            this.dataGridViewCustomer = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxFullName = new System.Windows.Forms.TextBox();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.buttonOk = new System.Windows.Forms.Button();
            this.tamAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gsmNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.epostaDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.adresDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.musteriBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCustomer)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.musteriBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewCustomer
            // 
            this.dataGridViewCustomer.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewCustomer.AutoGenerateColumns = false;
            this.dataGridViewCustomer.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewCustomer.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.tamAdiDataGridViewTextBoxColumn,
            this.gsmNoDataGridViewTextBoxColumn,
            this.epostaDataGridViewTextBoxColumn,
            this.adresDataGridViewTextBoxColumn});
            this.dataGridViewCustomer.DataSource = this.musteriBindingSource;
            this.dataGridViewCustomer.Location = new System.Drawing.Point(12, 49);
            this.dataGridViewCustomer.Name = "dataGridViewCustomer";
            this.dataGridViewCustomer.RowHeadersWidth = 51;
            this.dataGridViewCustomer.RowTemplate.Height = 24;
            this.dataGridViewCustomer.Size = new System.Drawing.Size(857, 268);
            this.dataGridViewCustomer.TabIndex = 6;
            this.dataGridViewCustomer.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataGridViewCustomer_KeyDown);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(23, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(78, 17);
            this.label1.TabIndex = 7;
            this.label1.Text = "Müşteri Adı";
            // 
            // textBoxFullName
            // 
            this.textBoxFullName.Location = new System.Drawing.Point(120, 13);
            this.textBoxFullName.Name = "textBoxFullName";
            this.textBoxFullName.Size = new System.Drawing.Size(257, 22);
            this.textBoxFullName.TabIndex = 8;
            this.textBoxFullName.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxFullName_KeyDown);
            // 
            // buttonCancel
            // 
            this.buttonCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonCancel.Image = global::Kdr.TeknikServis.Properties.Resources._50;
            this.buttonCancel.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonCancel.Location = new System.Drawing.Point(457, 325);
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
            this.buttonOk.Location = new System.Drawing.Point(681, 325);
            this.buttonOk.Margin = new System.Windows.Forms.Padding(5);
            this.buttonOk.Name = "buttonOk";
            this.buttonOk.Size = new System.Drawing.Size(188, 47);
            this.buttonOk.TabIndex = 4;
            this.buttonOk.Text = "Tamam";
            this.buttonOk.UseVisualStyleBackColor = true;
            this.buttonOk.Click += new System.EventHandler(this.buttonOk_Click);
            // 
            // tamAdiDataGridViewTextBoxColumn
            // 
            this.tamAdiDataGridViewTextBoxColumn.DataPropertyName = "TamAdi";
            this.tamAdiDataGridViewTextBoxColumn.HeaderText = "TamAdi";
            this.tamAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.tamAdiDataGridViewTextBoxColumn.Name = "tamAdiDataGridViewTextBoxColumn";
            this.tamAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // gsmNoDataGridViewTextBoxColumn
            // 
            this.gsmNoDataGridViewTextBoxColumn.DataPropertyName = "GsmNo";
            this.gsmNoDataGridViewTextBoxColumn.HeaderText = "GsmNo";
            this.gsmNoDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gsmNoDataGridViewTextBoxColumn.Name = "gsmNoDataGridViewTextBoxColumn";
            this.gsmNoDataGridViewTextBoxColumn.Width = 125;
            // 
            // epostaDataGridViewTextBoxColumn
            // 
            this.epostaDataGridViewTextBoxColumn.DataPropertyName = "Eposta";
            this.epostaDataGridViewTextBoxColumn.HeaderText = "Eposta";
            this.epostaDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.epostaDataGridViewTextBoxColumn.Name = "epostaDataGridViewTextBoxColumn";
            this.epostaDataGridViewTextBoxColumn.Width = 125;
            // 
            // adresDataGridViewTextBoxColumn
            // 
            this.adresDataGridViewTextBoxColumn.DataPropertyName = "Adres";
            this.adresDataGridViewTextBoxColumn.HeaderText = "Adres";
            this.adresDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.adresDataGridViewTextBoxColumn.Name = "adresDataGridViewTextBoxColumn";
            this.adresDataGridViewTextBoxColumn.Width = 125;
            // 
            // musteriBindingSource
            // 
            this.musteriBindingSource.DataSource = typeof(Kdr.DBLayer.Musteri);
            // 
            // FormSelectCustomer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(883, 386);
            this.Controls.Add(this.textBoxFullName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridViewCustomer);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonOk);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "FormSelectCustomer";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Müşteri Seç";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCustomer)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.musteriBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonOk;
        private System.Windows.Forms.DataGridView dataGridViewCustomer;
        private System.Windows.Forms.DataGridViewTextBoxColumn tamAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gsmNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn epostaDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn adresDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource musteriBindingSource;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxFullName;
    }
}