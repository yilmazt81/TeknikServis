using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer.Model
{
    public class CihazTamirParca
    {

        public CihazTamirParca()
        {

        }

        public CihazTamirParca(DataRow row)
        {
            Id = Convert.ToInt32(row["Id"]);
            TamirTeslimId = Convert.ToInt32(row["TamirTeslimId"]);
            EkleyenPersonel = UserRepository.GetPersonel(Convert.ToInt32(row["EkleyenPersonel"]));
            EklemeTarihi = (DateTime)row["EklemeTarihi"];
            CihazParca = CihazParcaHelper.GetCihazParca(Convert.ToInt32(row["CihazParcaId"]));
            ParcaBekliyor = Convert.ToBoolean(row["ParcaBekliyor"]);

        }
        public int Id { get; set; }
        public int TamirTeslimId { get; set; }
        public CihazParca CihazParca { get; set; }

        public Personel EkleyenPersonel { get; set; }

        public DateTime EklemeTarihi { get; set; }

        public bool ParcaBekliyor { get; set; }




    }
}
