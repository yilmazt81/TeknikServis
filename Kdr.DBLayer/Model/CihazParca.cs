using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer.Model
{
    public class CihazParca
    {
        public CihazParca()
        {

        }

        public CihazParca(DataRow dataRow)
        {
            Id = Convert.ToInt32(dataRow["Id"]);
            ParcaAdi = dataRow["ParcaAdi"].ToString();
            Barkod = dataRow["Barkod"].ToString();
            Fiyat = (dataRow["Fiyat"] == DBNull.Value ? 0 : (decimal)dataRow["Fiyat"]);
            MontajUcreti = (dataRow["MontajUcreti"] == DBNull.Value ? 0 : (decimal)dataRow["MontajUcreti"]);
            StokAdet = (dataRow["StokAdet"] == DBNull.Value ? 0 : (int)dataRow["StokAdet"]);

            Marka = dataRow["Marka"].ToString();
            Model = dataRow["Model"].ToString();
        }
        public int Id { get; set; }
        public string ParcaAdi { get; set; }
        public string Barkod { get; set; }
        public decimal Fiyat { get; set; }
        public decimal MontajUcreti { get; set; }
        public int StokAdet { get; set; }

        public string Marka { get; set; }
        public string Model { get; set; }

        public override string ToString()
        {
            return ParcaAdi;
        }
    }
}
