using Kdr.DBLayer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Kdr.TeknikServis.forms
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (textBoxUserName.Text == string.Empty)
            {
                MessageBoxHelper.ShowInfo("Kullanıcı adı giriniz");
                return;
            }
            if (textBoxPassword.Text == string.Empty)
            {
                MessageBoxHelper.ShowInfo("Şifre giriniz");
                return;
            }

            try
            {
                bool loginUser = UserRepository.LoginUser(textBoxUserName.Text, textBoxPassword.Text);
                if (!loginUser)
                {
                    MessageBoxHelper.ShowInfo("Kullanıcı adı veya Şifre yanlış");
                    return;
                }

                var computerName = System.Environment.MachineName;

                var openSession = SessionRepository.GetPersonelOpenSession(DBHelper.LoginPersonel.Id);
                if (openSession != null)
                {
                    if (openSession.BilgisayarAdi != computerName)
                    {
                        MessageBoxHelper.ShowInfo($"Uygulama sizin kullanıcı adınızla  {openSession.BilgisayarAdi} Makinesinden açılmıştır\nOturumunuz kapatılacaktır");
                        DialogResult = DialogResult.Cancel;
                    }
                }
                else
                {
                    SessionRepository.OpenSession(DBHelper.LoginPersonel.Id, computerName);
                }
                DialogResult = DialogResult.OK;
            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }

        }
    }
}
