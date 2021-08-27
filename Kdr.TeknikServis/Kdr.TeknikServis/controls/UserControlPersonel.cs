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


namespace Kdr.TeknikServis.controls
{
    public partial class UserControlPersonel : UserControl
    {
        public UserControlPersonel()
        {
            InitializeComponent();
            Refresh();
        }

        private void MenuItemNewUser_Click(object sender, EventArgs e)
        {
            forms.FormEditPersonel formEditPersonel = new forms.FormEditPersonel();
            if (formEditPersonel.ShowDialog() == DialogResult.OK)
            {
                var personel = formEditPersonel.PersonelProp;
                personel.SavePersonel();
                Refresh();
            }
        }

        private void buttonQuery_Click(object sender, EventArgs e)
        {
            Refresh();
        }

        private void Refresh()
        {

            var personelList = UserRepository.GetPersonels(textBoxQuery.Text);
            dataGridViewUserList.DataSource = personelList;

        }

        private void MenuEdit_Click(object sender, EventArgs e)
        {
            try
            {
                var personel = (Personel)dataGridViewUserList.CurrentRow.DataBoundItem;

                forms.FormEditPersonel formEditPersonel = new forms.FormEditPersonel();
                formEditPersonel.PersonelProp = personel;
                if (formEditPersonel.ShowDialog() == DialogResult.OK)
                {
                    personel = formEditPersonel.PersonelProp;
                    personel.SavePersonel();
                    Refresh();
                }
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }
    }
}
