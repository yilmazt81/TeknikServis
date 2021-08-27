using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer
{
    public class CihazTamirAddCihazPersonelInfo
    {

        public int Id { get; set; }

        public int ParcaId { get; set; }
        public string PersonelName { get; set; }

        public DateTime AddDate { get; set; }

        public string ParcaAdi { get; set; }

        public bool ParcaBekliyor { get; set; }

        public decimal ParcaFiyat { get; set; }



    }
}
