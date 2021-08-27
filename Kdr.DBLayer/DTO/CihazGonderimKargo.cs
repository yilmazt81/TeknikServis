using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer
{
    public class CihazGonderimKargo
    {
        public int Id { get; set; }


        public string MusteriAdi { get; set; }

        public string IlAdi { get; set; }
        public string IlceAdi { get; set; }

        public string Adres { get; set; }

        public string KargoAdi { get; set; }
        public string GonderiNo { get; set; }


    }
}
