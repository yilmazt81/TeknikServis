
namespace Kdr.TeknikServis.controls
{
    partial class UserControlPersonel
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
            this.dataGridViewUserList = new System.Windows.Forms.DataGridView();
            this.cMenuStripPersonel = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.MenuItemNewUser = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.personelBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxQuery = new System.Windows.Forms.TextBox();
            this.buttonQuery = new System.Windows.Forms.Button();
            this.kullaniciAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.adiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.soyadiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pasifDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.gorevDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewUserList)).BeginInit();
            this.cMenuStripPersonel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.personelBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewUserList
            // 
            this.dataGridViewUserList.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewUserList.AutoGenerateColumns = false;
            this.dataGridViewUserList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewUserList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.kullaniciAdiDataGridViewTextBoxColumn,
            this.adiDataGridViewTextBoxColumn,
            this.soyadiDataGridViewTextBoxColumn,
            this.pasifDataGridViewCheckBoxColumn,
            this.gorevDataGridViewTextBoxColumn});
            this.dataGridViewUserList.ContextMenuStrip = this.cMenuStripPersonel;
            this.dataGridViewUserList.DataSource = this.personelBindingSource;
            this.dataGridViewUserList.Location = new System.Drawing.Point(10, 47);
            this.dataGridViewUserList.Name = "dataGridViewUserList";
            this.dataGridViewUserList.RowHeadersWidth = 51;
            this.dataGridViewUserList.RowTemplate.Height = 24;
            this.dataGridViewUserList.Size = new System.Drawing.Size(781, 495);
            this.dataGridViewUserList.TabIndex = 0;
            // 
            // cMenuStripPersonel
            // 
            this.cMenuStripPersonel.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStripPersonel.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemNewUser,
            this.MenuEdit});
            this.cMenuStripPersonel.Name = "cMenuStripPersonel";
            this.cMenuStripPersonel.Size = new System.Drawing.Size(140, 56);
            // 
            // MenuItemNewUser
            // 
            this.MenuItemNewUser.Image = global::Kdr.TeknikServis.Properties.Resources._21;
            this.MenuItemNewUser.Name = "MenuItemNewUser";
            this.MenuItemNewUser.Size = new System.Drawing.Size(139, 26);
            this.MenuItemNewUser.Text = "Yeni";
            this.MenuItemNewUser.Click += new System.EventHandler(this.MenuItemNewUser_Click);
            // 
            // MenuEdit
            // 
            this.MenuEdit.Image = global::Kdr.TeknikServis.Properties.Resources.Edit;
            this.MenuEdit.Name = "MenuEdit";
            this.MenuEdit.Size = new System.Drawing.Size(139, 26);
            this.MenuEdit.Text = "Güncelle";
            this.MenuEdit.Click += new System.EventHandler(this.MenuEdit_Click);
            // 
            // personelBindingSource
            // 
            this.personelBindingSource.DataSource = typeof(Kdr.DBLayer.Personel);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "Personel Adı";
            // 
            // textBoxQuery
            // 
            this.textBoxQuery.Location = new System.Drawing.Point(111, 13);
            this.textBoxQuery.Name = "textBoxQuery";
            this.textBoxQuery.Size = new System.Drawing.Size(158, 22);
            this.textBoxQuery.TabIndex = 3;
            // 
            // buttonQuery
            // 
            this.buttonQuery.Image = global::Kdr.TeknikServis.Properties.Resources.Query;
            this.buttonQuery.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonQuery.Location = new System.Drawing.Point(296, 9);
            this.buttonQuery.Name = "buttonQuery";
            this.buttonQuery.Size = new System.Drawing.Size(137, 30);
            this.buttonQuery.TabIndex = 4;
            this.buttonQuery.Text = "Sorgula";
            this.buttonQuery.UseVisualStyleBackColor = true;
            this.buttonQuery.Click += new System.EventHandler(this.buttonQuery_Click);
            // 
            // kullaniciAdiDataGridViewTextBoxColumn
            // 
            this.kullaniciAdiDataGridViewTextBoxColumn.DataPropertyName = "KullaniciAdi";
            this.kullaniciAdiDataGridViewTextBoxColumn.HeaderText = "Kullanici Adi";
            this.kullaniciAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kullaniciAdiDataGridViewTextBoxColumn.Name = "kullaniciAdiDataGridViewTextBoxColumn";
            this.kullaniciAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // adiDataGridViewTextBoxColumn
            // 
            this.adiDataGridViewTextBoxColumn.DataPropertyName = "Adi";
            this.adiDataGridViewTextBoxColumn.HeaderText = "Adi";
            this.adiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.adiDataGridViewTextBoxColumn.Name = "adiDataGridViewTextBoxColumn";
            this.adiDataGridViewTextBoxColumn.Width = 125;
            // 
            // soyadiDataGridViewTextBoxColumn
            // 
            this.soyadiDataGridViewTextBoxColumn.DataPropertyName = "Soyadi";
            this.soyadiDataGridViewTextBoxColumn.HeaderText = "Soyadi";
            this.soyadiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.soyadiDataGridViewTextBoxColumn.Name = "soyadiDataGridViewTextBoxColumn";
            this.soyadiDataGridViewTextBoxColumn.Width = 125;
            // 
            // pasifDataGridViewCheckBoxColumn
            // 
            this.pasifDataGridViewCheckBoxColumn.DataPropertyName = "Pasif";
            this.pasifDataGridViewCheckBoxColumn.HeaderText = "Pasif";
            this.pasifDataGridViewCheckBoxColumn.MinimumWidth = 6;
            this.pasifDataGridViewCheckBoxColumn.Name = "pasifDataGridViewCheckBoxColumn";
            this.pasifDataGridViewCheckBoxColumn.Width = 125;
            // 
            // gorevDataGridViewTextBoxColumn
            // 
            this.gorevDataGridViewTextBoxColumn.DataPropertyName = "Gorev";
            this.gorevDataGridViewTextBoxColumn.HeaderText = "Gorev";
            this.gorevDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gorevDataGridViewTextBoxColumn.Name = "gorevDataGridViewTextBoxColumn";
            this.gorevDataGridViewTextBoxColumn.Width = 125;
            // 
            // UserControlPersonel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.buttonQuery);
            this.Controls.Add(this.textBoxQuery);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridViewUserList);
            this.Name = "UserControlPersonel";
            this.Size = new System.Drawing.Size(796, 546);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewUserList)).EndInit();
            this.cMenuStripPersonel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.personelBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewUserList;
        private System.Windows.Forms.BindingSource personelBindingSource;
        private System.Windows.Forms.ContextMenuStrip cMenuStripPersonel;
        private System.Windows.Forms.ToolStripMenuItem MenuItemNewUser;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxQuery;
        private System.Windows.Forms.Button buttonQuery;
        private System.Windows.Forms.ToolStripMenuItem MenuEdit;
        private System.Windows.Forms.DataGridViewTextBoxColumn kullaniciAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn adiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn soyadiDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn pasifDataGridViewCheckBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gorevDataGridViewTextBoxColumn;
    }
}
