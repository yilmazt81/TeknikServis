﻿
namespace Kdr.TeknikServis.forms
{
    partial class FormGiveBackCustomer
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormGiveBackCustomer));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.buttonOk = new System.Windows.Forms.Button();
            this.textBoxCustomerName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxTamirUcret = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxTeslimAlinanAksesuar = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.textBoxSeriesId = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.textBoxModel = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.textBoxBrand = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.textBoxGivePersonName = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(15, 15);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(4);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(175, 232);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // buttonCancel
            // 
            this.buttonCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonCancel.Image = global::Kdr.TeknikServis.Properties.Resources._50;
            this.buttonCancel.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonCancel.Location = new System.Drawing.Point(713, 261);
            this.buttonCancel.Margin = new System.Windows.Forms.Padding(6);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(148, 43);
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
            this.buttonOk.Location = new System.Drawing.Point(886, 261);
            this.buttonOk.Margin = new System.Windows.Forms.Padding(6);
            this.buttonOk.Name = "buttonOk";
            this.buttonOk.Size = new System.Drawing.Size(148, 43);
            this.buttonOk.TabIndex = 7;
            this.buttonOk.Text = "Tamam";
            this.buttonOk.UseVisualStyleBackColor = true;
            this.buttonOk.Click += new System.EventHandler(this.buttonOk_Click);
            // 
            // textBoxCustomerName
            // 
            this.textBoxCustomerName.BackColor = System.Drawing.Color.White;
            this.textBoxCustomerName.Location = new System.Drawing.Point(303, 15);
            this.textBoxCustomerName.Name = "textBoxCustomerName";
            this.textBoxCustomerName.ReadOnly = true;
            this.textBoxCustomerName.Size = new System.Drawing.Size(288, 27);
            this.textBoxCustomerName.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(194, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(94, 20);
            this.label1.TabIndex = 37;
            this.label1.Text = "Müşteri Adı";
            // 
            // textBoxTamirUcret
            // 
            this.textBoxTamirUcret.BackColor = System.Drawing.Color.White;
            this.textBoxTamirUcret.Location = new System.Drawing.Point(303, 184);
            this.textBoxTamirUcret.Name = "textBoxTamirUcret";
            this.textBoxTamirUcret.ReadOnly = true;
            this.textBoxTamirUcret.Size = new System.Drawing.Size(78, 27);
            this.textBoxTamirUcret.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(194, 184);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(102, 20);
            this.label2.TabIndex = 42;
            this.label2.Text = "Tamir Ücreti";
            // 
            // textBoxTeslimAlinanAksesuar
            // 
            this.textBoxTeslimAlinanAksesuar.BackColor = System.Drawing.Color.White;
            this.textBoxTeslimAlinanAksesuar.Location = new System.Drawing.Point(612, 39);
            this.textBoxTeslimAlinanAksesuar.Multiline = true;
            this.textBoxTeslimAlinanAksesuar.Name = "textBoxTeslimAlinanAksesuar";
            this.textBoxTeslimAlinanAksesuar.ReadOnly = true;
            this.textBoxTeslimAlinanAksesuar.Size = new System.Drawing.Size(422, 112);
            this.textBoxTeslimAlinanAksesuar.TabIndex = 6;
            // 
            // label6
            // 
            this.label6.Location = new System.Drawing.Point(612, 13);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(267, 22);
            this.label6.TabIndex = 44;
            this.label6.Text = "Teslim Alınan Aksesuar";
            // 
            // textBoxSeriesId
            // 
            this.textBoxSeriesId.BackColor = System.Drawing.Color.White;
            this.textBoxSeriesId.Location = new System.Drawing.Point(303, 136);
            this.textBoxSeriesId.Name = "textBoxSeriesId";
            this.textBoxSeriesId.ReadOnly = true;
            this.textBoxSeriesId.Size = new System.Drawing.Size(288, 27);
            this.textBoxSeriesId.TabIndex = 3;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(194, 143);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(65, 20);
            this.label4.TabIndex = 50;
            this.label4.Text = "Seri No";
            // 
            // textBoxModel
            // 
            this.textBoxModel.BackColor = System.Drawing.Color.White;
            this.textBoxModel.Location = new System.Drawing.Point(303, 95);
            this.textBoxModel.Name = "textBoxModel";
            this.textBoxModel.ReadOnly = true;
            this.textBoxModel.Size = new System.Drawing.Size(288, 27);
            this.textBoxModel.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(194, 95);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 20);
            this.label3.TabIndex = 48;
            this.label3.Text = "Model";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(194, 48);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(55, 20);
            this.label5.TabIndex = 46;
            this.label5.Text = "Marka";
            // 
            // textBoxBrand
            // 
            this.textBoxBrand.BackColor = System.Drawing.Color.White;
            this.textBoxBrand.Location = new System.Drawing.Point(303, 53);
            this.textBoxBrand.Name = "textBoxBrand";
            this.textBoxBrand.ReadOnly = true;
            this.textBoxBrand.Size = new System.Drawing.Size(288, 27);
            this.textBoxBrand.TabIndex = 1;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(197, 227);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(102, 20);
            this.label7.TabIndex = 53;
            this.label7.Text = "Teslim Alan ";
            // 
            // textBoxGivePersonName
            // 
            this.textBoxGivePersonName.BackColor = System.Drawing.Color.White;
            this.textBoxGivePersonName.Location = new System.Drawing.Point(305, 227);
            this.textBoxGivePersonName.Name = "textBoxGivePersonName";
            this.textBoxGivePersonName.Size = new System.Drawing.Size(288, 27);
            this.textBoxGivePersonName.TabIndex = 5;
            // 
            // FormGiveBackCustomer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1061, 321);
            this.Controls.Add(this.textBoxGivePersonName);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.textBoxBrand);
            this.Controls.Add(this.textBoxSeriesId);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.textBoxModel);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.textBoxTeslimAlinanAksesuar);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.textBoxTamirUcret);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBoxCustomerName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonOk);
            this.Controls.Add(this.pictureBox1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "FormGiveBackCustomer";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Müşteri Ürün Iade";
            this.Load += new System.EventHandler(this.FormGiveBackCustomer_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonOk;
        private System.Windows.Forms.TextBox textBoxCustomerName;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxTamirUcret;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxTeslimAlinanAksesuar;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox textBoxSeriesId;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBoxModel;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBoxBrand;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox textBoxGivePersonName;
    }
}