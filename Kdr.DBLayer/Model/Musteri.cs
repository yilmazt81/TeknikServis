using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer.Model
{
    public class Musteri
    {
        public int Id { get; set; }
        public string TamAdi { get; set; }
        public string GsmNo { get; set; }
        public string Eposta { get; set; }
        public int IlId { get; set; }

        public int IlceId { get; set; }

        public string Adres { get; set; }


    }
}
