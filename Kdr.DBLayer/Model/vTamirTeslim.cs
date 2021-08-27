using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer.Model
{
    public class vTamirTeslim
    {
        public vTamirTeslim()
        {

        }
        public vTamirTeslim(DataRow datarow)
        {
            Id = Convert.ToInt32(datarow["Id"]);
            MusteriAdi = datarow["MusteriAdi"].ToString();
            GsmNo = datarow["GsmNo"].ToString();
            Eposta = datarow["Eposta"].ToString();
            IlAdi = datarow["IlAdi"].ToString();
            IlceAdi = datarow["IlceAdi"].ToString();
            Marka = datarow["Marka"].ToString();
            Model = datarow["Model"].ToString();
            SeriNo = datarow["SeriNo"].ToString();
            TeslimTarihi = (DateTime)datarow["TeslimTarihi"];
            Barcode = datarow["Barcode"].ToString();
            TamirDurum = datarow["TamirDurum"].ToString();
            TamirDurumId = Convert.ToInt32(datarow["TamirDurumId"]);
        }
        public int Id { get; set; }

        public string MusteriAdi { get; set; }

        public string GsmNo { get; set; }

        public string Eposta { get; set; }
        public string IlAdi { get; set; }

        public string IlceAdi { get; set; }

        public string Marka { get; set; }

        public string Model { get; set; }

        public string SeriNo { get; set; }

        public DateTime TeslimTarihi { get; set; }

        public string Barcode { get; set; }

        public string TamirDurum { get; set; }

        public int TamirDurumId { get; set; }



    }
}
