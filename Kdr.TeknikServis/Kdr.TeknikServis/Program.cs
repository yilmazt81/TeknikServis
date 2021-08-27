using Kdr.DBLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Kdr.TeknikServis
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            try
            {

                
                 
                
                forms.FormLogin formLogin = new forms.FormLogin();
                if (formLogin.ShowDialog() == DialogResult.OK)
                {
                    Application.Run(new FormMain());

                }
                else
                {
                    Application.Exit();
                }
            }
            catch (Exception ex)
            {               
                MessageBoxHelper.ShowException(ex);
            }
        }
    }
}
