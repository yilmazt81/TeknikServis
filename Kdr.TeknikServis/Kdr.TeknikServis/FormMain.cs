using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Kdr.DBLayer;


namespace Kdr.TeknikServis
{
    public partial class FormMain : Form
    {
        private List<UserControl> _lControls = new List<UserControl>();

        public FormMain()
        {
            InitializeComponent();

            if (DBHelper.LoginPersonel.Gorev == "Admin")
            {
                var adminMenus = AppMenuRepository.GetUygulamaMenus();
                CreateUserMenu(adminMenus);
            }
            else
            {
                var permissionMenu = AppMenuRepository.GetUygulamaMenuByPermission(DBHelper.LoginPersonel.Gorev);
                CreateUserMenu(permissionMenu);
            }
        }
        private void CreateUserMenu(UygulamaMenu[] uygulamaMenus)
        {
            var mainMenus = uygulamaMenus.Where(s => s.UstMenuId == 0);
            foreach (var mainMenu in mainMenus)
            {
                TreeNode treeNode = new TreeNode()
                {
                    Text = mainMenu.MenuName,
                    Tag = mainMenu,
                    ImageIndex = mainMenu.IconIndex.Value,
                    SelectedImageIndex = mainMenu.IconIndex.Value
                };

                foreach (var subMenu in uygulamaMenus.Where(s => s.UstMenuId == mainMenu.Id))
                {
                    treeNode.Nodes.Add(new TreeNode()
                    {

                        Text = subMenu.MenuName,
                        Tag = subMenu,
                        ImageIndex = subMenu.IconIndex.Value,
                        SelectedImageIndex = subMenu.IconIndex.Value
                    });
                }

                treeViewMenu.Nodes.Add(treeNode);
            }

            TreeNode treeNodeExit = new TreeNode()
            {
                Text = "Çıkış",
                Tag = new UygulamaMenu() {MenuName="Exit" },
                ImageIndex =12,
                SelectedImageIndex = 12
            };
            treeViewMenu.Nodes.Add(treeNodeExit);
        }

        private void treeViewMenu_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if (e.Node.Tag == null)
                return;
            var uygulamaMenu = (UygulamaMenu)e.Node.Tag;

            if (uygulamaMenu.MenuName=="Exit")
            {
                if (MessageBoxHelper.ShowQuestion("Uygulamadan Çıkmak istediğinize Emin misiniz ? ") == DialogResult.Yes)
                {
                    SessionRepository.CloseSession();
                   Application.Exit();
                }
            }
            splitContainerMain.Panel2.Controls.Clear();

            try
            {
                if (string.IsNullOrEmpty(uygulamaMenu.MenuClass))
                    return;
                string newControlName = "UserControl" + uygulamaMenu.Id;
                var control = _lControls.FirstOrDefault(u => u.Name == newControlName);
                if (control != null)
                {
                    splitContainerMain.Panel2.Controls.Add(control);
                    control.Dock = DockStyle.Fill;
                }
                else
                {
                    Type newcontrolType = Type.GetType(uygulamaMenu.MenuClass);

                    if (newcontrolType != null)
                    {
                        var newControl = (UserControl)Activator.CreateInstance(newcontrolType);
                        newControl.Name = newControlName;
                        _lControls.Add(newControl);
                        splitContainerMain.Panel2.Controls.Add(newControl);
                        newControl.Dock = DockStyle.Fill;
                    }
                }
            }
            catch (Exception ex)
            {

                MessageBoxHelper.ShowException(ex);
            }
        }
    }
}
