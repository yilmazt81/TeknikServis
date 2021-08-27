using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer.Model
{
    public class TamirTeslim
    {
        public TamirTeslim()
        {
            CihazParcaListesi = new List<CihazParca>();
        }

        public TamirTeslim(DataRow datarow)
        {
            CihazParcaListesi = new List<CihazParca>();

            Id = Convert.ToInt32(datarow["Id"]);
            MusteriId = Convert.ToInt32(datarow["MusteriId"]);
            TeslimAlanPersonelId = Convert.ToInt32(datarow["TeslimAlanPersonelId"]);
            IadeEdenPersonelId = (datarow["IadeEdenPersonelId"] == DBNull.Value ? 0 : Convert.ToInt32(datarow["IadeEdenPersonelId"]));
            TamirEdenPersonelId = (datarow["TamirEdenPersonelId"] == DBNull.Value ? 0 : Convert.ToInt32(datarow["TamirEdenPersonelId"]));
            KargoIleGeldi = (bool)datarow["KargoIleGeldi"];
            Marka = datarow["Marka"].ToString();
            Model = datarow["Model"].ToString();
            SeriNo = datarow["SeriNo"].ToString();
            TeslimTarihi = (DateTime)datarow["TeslimTarihi"];
            Barcode = datarow["Barcode"].ToString();
            TamirDurumId = Convert.ToInt32(datarow["TamirDurumId"]);

            MusteriSorunAciklama = datarow["MusteriSorunAciklama"].ToString();
            TeknikPersonelAciklama = datarow["TeknikPersonelAciklama"].ToString();
            IadeTarihi = (datarow["IadeTarihi"] == DBNull.Value ? null : (DateTime?)datarow["TeslimTarihi"]);
            TamirTarihi = (datarow["TamirTarihi"] == DBNull.Value ? null : (DateTime?)datarow["TamirTarihi"]);

            TeslimAlinanAksesuar = datarow["TeslimAlinanAksesuar"].ToString();
            TamirFiyat = (decimal)datarow["TamirFiyat"];


        }
        public int Id { get; set; }
        public int MusteriId { get; set; }
        public int TeslimAlanPersonelId { get; set; }
        public int IadeEdenPersonelId { get; set; }

        public int TamirEdenPersonelId { get; set; }

        public bool KargoIleGeldi { get; set; }

        public string Barcode { get; set; }

        public string Marka { get; set; }
        public string Model { get; set; }
        public string SeriNo { get; set; }
        public string MusteriSorunAciklama { get; set; }
        public string TeknikPersonelAciklama { get; set; }

        public DateTime TeslimTarihi { get; set; }
        public DateTime? IadeTarihi { get; set; }
        public string TeslimAlinanAksesuar { get; set; }

        public DateTime? TamirTarihi { get; set; }

        public decimal TamirFiyat { get; set; }
        public List<CihazParca> CihazParcaListesi { get; set; }

        public int TamirDurumId { get; set; }
    }
}
