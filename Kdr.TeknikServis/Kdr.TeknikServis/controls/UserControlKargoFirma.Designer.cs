
namespace Kdr.TeknikServis.controls
{
    partial class UserControlKargoFirma
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
            this.dataGridViewKargo = new System.Windows.Forms.DataGridView();
            this.cMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.MenuItemNew = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItemEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.firmaAdiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kargoFirmaBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewKargo)).BeginInit();
            this.cMenuStrip.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kargoFirmaBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewKargo
            // 
            this.dataGridViewKargo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewKargo.AutoGenerateColumns = false;
            this.dataGridViewKargo.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewKargo.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.firmaAdiDataGridViewTextBoxColumn});
            this.dataGridViewKargo.ContextMenuStrip = this.cMenuStrip;
            this.dataGridViewKargo.DataSource = this.kargoFirmaBindingSource;
            this.dataGridViewKargo.Location = new System.Drawing.Point(13, 3);
            this.dataGridViewKargo.Name = "dataGridViewKargo";
            this.dataGridViewKargo.RowHeadersWidth = 51;
            this.dataGridViewKargo.RowTemplate.Height = 24;
            this.dataGridViewKargo.Size = new System.Drawing.Size(828, 472);
            this.dataGridViewKargo.TabIndex = 0;
            // 
            // cMenuStrip
            // 
            this.cMenuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemNew,
            this.MenuItemEdit});
            this.cMenuStrip.Name = "cMenuStrip";
            this.cMenuStrip.Size = new System.Drawing.Size(215, 84);
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
            this.MenuItemEdit.Size = new System.Drawing.Size(214, 26);
            this.MenuItemEdit.Text = "Değiştir";
            this.MenuItemEdit.Click += new System.EventHandler(this.MenuItemEdit_Click);
            // 
            // firmaAdiDataGridViewTextBoxColumn
            // 
            this.firmaAdiDataGridViewTextBoxColumn.DataPropertyName = "FirmaAdi";
            this.firmaAdiDataGridViewTextBoxColumn.HeaderText = "FirmaAdi";
            this.firmaAdiDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.firmaAdiDataGridViewTextBoxColumn.Name = "firmaAdiDataGridViewTextBoxColumn";
            this.firmaAdiDataGridViewTextBoxColumn.Width = 125;
            // 
            // kargoFirmaBindingSource
            // 
            this.kargoFirmaBindingSource.DataSource = typeof(Kdr.DBLayer.KargoFirma);
            // 
            // UserControlKargoFirma
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataGridViewKargo);
            this.Name = "UserControlKargoFirma";
            this.Size = new System.Drawing.Size(857, 492);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewKargo)).EndInit();
            this.cMenuStrip.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.kargoFirmaBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewKargo;
        private System.Windows.Forms.DataGridViewTextBoxColumn firmaAdiDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource kargoFirmaBindingSource;
        private System.Windows.Forms.ContextMenuStrip cMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem MenuItemNew;
        private System.Windows.Forms.ToolStripMenuItem MenuItemEdit;
    }
}
