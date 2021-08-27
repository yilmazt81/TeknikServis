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
using System.IO;

namespace Kdr.TeknikServis.forms
{
    public partial class FormCargo : Form
    {
        private KargoFirma kargoFirma = null;
        public FormCargo()
        {
            InitializeComponent();
        }

        public KargoFirma KargoFirmaProp
        {
            get
            {
                if (kargoFirma == null)
                {
                    kargoFirma = new KargoFirma();
                }
                kargoFirma.FirmaAdi = textBoxCargoName.Text;
                return kargoFirma;
            }
            set
            {
                kargoFirma = value;

                textBoxCargoName.Text = kargoFirma.FirmaAdi;
                if (kargoFirma.Id != 0)
                {
                    LoadBranch();
                }

            }
        }

        private void LoadBranch()
        {
            kargoSubeBindingSource.DataSource = CargoRepository.GetKargoSubes(KargoFirmaProp.Id);

        }

        private void buttonImport_Click(object sender, EventArgs e)
        {
            try
            {
                if (KargoFirmaProp.Id == 0)
                {
                    KargoFirmaProp.Save();
                }
                OpenFileDialog openFileDialog = new OpenFileDialog()
                {
                    Filter = "*.txt|Txt Files"
                };
                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    var allLines = File.ReadAllLines(openFileDialog.FileName, Encoding.UTF8);

                    foreach (var oneLine in allLines)
                    {
                        var fileSplit = oneLine.Split(';');
                        KargoSube kargoSube = new KargoSube()
                        {
                            KargoFirmaId = this.KargoFirmaProp.Id,
                            SubeAdi = fileSplit[0],
                            TelefonNo = fileSplit[1]
                        };

                        kargoSube.Save();
                    }

                    LoadBranch();
                }

            }
            catch (Exception ex)
            {

                MessageBoxHelper.ShowException(ex);
            }
        }

        private void buttonAddSube_Click(object sender, EventArgs e)
        {
            if (textBoxBranchName.Text == string.Empty)
                return;

            try
            {
                if (KargoFirmaProp.Id == 0)
                {
                    KargoFirmaProp.Save();
                }

                KargoSube kargoSube = new KargoSube()
                {
                    KargoFirmaId=this.KargoFirmaProp.Id,
                    SubeAdi=textBoxBranchName.Text,
                    TelefonNo=textBoxPhone.Text
                };

                kargoSube.Save();
                LoadBranch();

                textBoxBranchName.Text = string.Empty;
                textBoxPhone.Text = string.Empty;

                textBoxBranchName.Focus();

            }
            catch (Exception ex)
            {
                MessageBoxHelper.ShowException(ex);
            }
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textBoxCargoName.Text))
            {
                MessageBoxHelper.ShowInfo("Firma Adı girmediniz");
                return;
            }

            DialogResult = DialogResult.OK;
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }
    }
}
