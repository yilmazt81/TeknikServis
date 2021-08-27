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

namespace Kdr.TeknikServis.forms
{
    public partial class FormEditPersonel : Form
    {
        private Personel personel = null;
        public FormEditPersonel()
        {

            InitializeComponent();

            var personelList = UserRepository.GetPersonels();
            personelList.Insert(0,new Personel()
            {
                Id = 0,
                Adi="Seçiniz",
                Soyadi=""
            });
            comboBoxManager.DisplayMember = "Adi";
            comboBoxManager.ValueMember = "Id";
            comboBoxManager.DataSource = personelList;

            comboBoxPermission.Items.Add("Admin");
            comboBoxPermission.Items.Add("Karsilama");
            comboBoxPermission.Items.Add("TeknikPersonel");
            comboBoxPermission.Items.Add("UrunKargo");


            comboBoxPermission.SelectedIndex = 0;

        }

        public Personel PersonelProp
        {
            get
            {
                if (personel == null)
                {
                    personel = new Personel();
                }

                personel.Adi = textBoxName.Text;
                personel.Soyadi = textBoxLastName.Text;
                personel.Gorev = comboBoxPermission.Text;
                personel.KullaniciAdi = textBoxUserName.Text;
                personel.Pasif = checkBoxDisable.Checked;
                personel.Sifre = textBoxPassword.Text;
                personel.UstPersonelId = (comboBoxManager.SelectedItem == null ? 0 : ((Personel)comboBoxManager.SelectedItem).Id);

                return personel;
            }
            set
            {
                personel = value;
                textBoxName.Text = personel.Adi;
                comboBoxPermission.Text = personel.Gorev;
                textBoxUserName.Text = personel.KullaniciAdi;
                checkBoxDisable.Checked = personel.Pasif.Value;
                textBoxPassword.Text = personel.Sifre;
                textBoxLastName.Text = personel.Soyadi;
                comboBoxManager.SelectedValue = personel.UstPersonelId;

            }
        }


        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (textBoxUserName.Text == string.Empty)
            {
                MessageBoxHelper.ShowInfo("Kullanıcı adı girmediniz");
                return;
            }

            if (textBoxPassword.Text == string.Empty)
            {
                MessageBoxHelper.ShowInfo("Şifre girmediniz");
                return;
            }

            if (textBoxName.Text == string.Empty)
            {
                MessageBoxHelper.ShowInfo("Ad girmediniz");
                return;
            }

            DialogResult = DialogResult.OK;
        }
    }
}
