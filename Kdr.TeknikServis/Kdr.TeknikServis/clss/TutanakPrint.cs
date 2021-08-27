using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.TeknikServis
{
    public class TutanakPrint
    {

        public byte[] Barcode { get; set; }

        public byte[] Logo { get; set; }


        public string BarcodeValue { get; set; }

        public string MusteriAdi { get; set; }

        public string MusteriTelefon { get; set; }

        public string MusteriAdres { get; set; }

        public string Tarih { get; set; }


        public string Marka { get; set; }
        public string Model { get; set; }

        public string SeriNo { get; set; }

        public string ArizaAciklama { get; set; }

        public string Aksesuarlar { get; set; }

        public string GonderiNo { get; set; }

    }
}
