using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer.Model
{
    public class Personel
    {
        public int Id { get; set; }
        public string KullaniciAdi { get; set; }

        public string TamAd { get {return Adi + " " + Soyadi; } }
        public string Sifre { get; set; }
        public string Adi { get; set; }
        public string Soyadi { get; set; }
        public bool Pasif { get; set; }
        public int UstPersonelId { get; set; }
        public string Gorev { get; set; }

        public override string ToString()
        {
            return TamAd;
        }


    }
}
