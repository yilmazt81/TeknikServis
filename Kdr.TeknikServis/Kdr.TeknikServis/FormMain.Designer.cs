
namespace Kdr.TeknikServis
{
    partial class FormMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormMain));
            this.statusStripMain = new System.Windows.Forms.StatusStrip();
            this.splitContainerMain = new System.Windows.Forms.SplitContainer();
            this.treeViewMenu = new System.Windows.Forms.TreeView();
            this.imageListTree = new System.Windows.Forms.ImageList(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerMain)).BeginInit();
            this.splitContainerMain.Panel1.SuspendLayout();
            this.splitContainerMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // statusStripMain
            // 
            this.statusStripMain.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStripMain.Location = new System.Drawing.Point(0, 452);
            this.statusStripMain.Name = "statusStripMain";
            this.statusStripMain.Size = new System.Drawing.Size(823, 22);
            this.statusStripMain.TabIndex = 0;
            this.statusStripMain.Text = "statusStrip1";
            // 
            // splitContainerMain
            // 
            this.splitContainerMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerMain.Location = new System.Drawing.Point(0, 0);
            this.splitContainerMain.Name = "splitContainerMain";
            // 
            // splitContainerMain.Panel1
            // 
            this.splitContainerMain.Panel1.Controls.Add(this.treeViewMenu);
            this.splitContainerMain.Size = new System.Drawing.Size(823, 452);
            this.splitContainerMain.SplitterDistance = 274;
            this.splitContainerMain.TabIndex = 1;
            // 
            // treeViewMenu
            // 
            this.treeViewMenu.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeViewMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.treeViewMenu.ImageIndex = 0;
            this.treeViewMenu.ImageList = this.imageListTree;
            this.treeViewMenu.Location = new System.Drawing.Point(0, 0);
            this.treeViewMenu.Name = "treeViewMenu";
            this.treeViewMenu.SelectedImageIndex = 0;
            this.treeViewMenu.Size = new System.Drawing.Size(274, 452);
            this.treeViewMenu.TabIndex = 0;
            this.treeViewMenu.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeViewMenu_AfterSelect);
            // 
            // imageListTree
            // 
            this.imageListTree.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageListTree.ImageStream")));
            this.imageListTree.TransparentColor = System.Drawing.Color.Transparent;
            this.imageListTree.Images.SetKeyName(0, "home04.png");
            this.imageListTree.Images.SetKeyName(1, "man_brown.png");
            this.imageListTree.Images.SetKeyName(2, "search04.png");
            this.imageListTree.Images.SetKeyName(3, "settings.png");
            this.imageListTree.Images.SetKeyName(4, "play04.png");
            this.imageListTree.Images.SetKeyName(5, "clock04.png");
            this.imageListTree.Images.SetKeyName(6, "ftprush_install.png");
            this.imageListTree.Images.SetKeyName(7, "users_2.png");
            this.imageListTree.Images.SetKeyName(8, "delivery.png");
            this.imageListTree.Images.SetKeyName(9, "diagram_v2_14.png");
            this.imageListTree.Images.SetKeyName(10, "graph04.png");
            this.imageListTree.Images.SetKeyName(11, "symbol04.png");
            this.imageListTree.Images.SetKeyName(12, "exit.png");
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(823, 474);
            this.Controls.Add(this.splitContainerMain);
            this.Controls.Add(this.statusStripMain);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FormMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultBounds;
            this.Text = "Teknik Servis Takip";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.splitContainerMain.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerMain)).EndInit();
            this.splitContainerMain.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.StatusStrip statusStripMain;
        private System.Windows.Forms.SplitContainer splitContainerMain;
        private System.Windows.Forms.TreeView treeViewMenu;
        private System.Windows.Forms.ImageList imageListTree;
    }
}

