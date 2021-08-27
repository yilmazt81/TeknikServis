using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Kdr.TeknikServis
{
    public class MessageBoxHelper
    {
        public static void ShowInfo(string message)
        {
            MessageBox.Show(message, "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        public static DialogResult ShowQuestion(string message)
        {
            return MessageBox.Show(message, "Bilgi", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
        }


        public static void ShowException(Exception exception)
        {

            string message = $"Bir hata Oluştu :{exception.Message} \nHata Detayı : {(exception.InnerException == null ? string.Empty : exception.InnerException.Message)}";
            MessageBox.Show(message, "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);

        }
    }
}
