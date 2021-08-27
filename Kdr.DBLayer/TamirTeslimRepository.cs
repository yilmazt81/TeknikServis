using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Kdr.DBLayer
{
    public static class TamirTeslimRepository
    {

        public static List<vTamirTeslim> GetVTamirTeslims()
        {

            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.vTamirTeslim.OrderBy(s => s.Id).ToList();
            }


        }

        public static string[] GetMarkaList()
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.TamirTeslim.Select(s => s.Marka).Distinct().ToArray();
            }
        }

        public static TamirTeslim GetTamirTeslim(int id)
        {

            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {


                return teknikProje.TamirTeslim.FirstOrDefault(s => s.Id == id);
            }


        }

        public static List<vTamirTeslim> GetVTamirTeslimsByState(int tamirState)
        {

            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                if (tamirState == 0)
                {

                    return teknikProje.vTamirTeslim.Where(s => (s.TamirDurumId == tamirState || s.TamirDurumId == 1)).ToList();
                }
                else if (tamirState == 3)
                {
                    return teknikProje.vTamirTeslim.Where(s => s.TamirDurumId == tamirState && s.PersonelUstId == DBHelper.LoginPersonel.Id).ToList();
                }
                else
                {
                    return teknikProje.vTamirTeslim.Where(s => s.TamirDurumId == tamirState).ToList();

                }

            }

        }
        public static List<vTamirTeslim> GetCargoSendList()
        {

            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.vTamirTeslim.Where(s => s.TamirDurumId == 4 && s.KargoIleGonderilecek.Value).ToList();

            }

        }

        public static List<vTamirTeslim> GetVTamirTeslimsByBarcode(string barcode)
        {

            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.vTamirTeslim.Where(s => s.Barcode == barcode).ToList();
            }

        }

        public static List<vTamirTeslim> GetVTamirTeslimsByName(string name)
        {

            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.vTamirTeslim.Where(s => s.MusteriAdi.Contains(name) || s.GsmNo == name).ToList();
            }

        }

        public static List<CihazParca> GetTamirCihazParcaWait(int tamirTeslimId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.CihazTamirParca.Where(s => s.TamirTeslimId == tamirTeslimId && s.ParcaBekliyor.Value).Select(s => s.CihazParca).ToList();
            }

        }
        public static void Save(this TamirTeslim tamirTeslim)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                if (tamirTeslim.Id == 0)
                {
                    teknikProje.TamirTeslim.Add(tamirTeslim);
                }
                else
                {
                    var dbTamirTeslim = teknikProje.TamirTeslim.FirstOrDefault(s => s.Id == tamirTeslim.Id);
                    dbTamirTeslim.TamirDurumId = tamirTeslim.TamirDurumId;
                    dbTamirTeslim.TamirEdenPersonelId = tamirTeslim.TamirEdenPersonelId;
                    dbTamirTeslim.TamirTarihi = tamirTeslim.TamirTarihi;
                    dbTamirTeslim.TamirFiyat = tamirTeslim.TamirFiyat;
                    dbTamirTeslim.TeknikPersonelAciklama = tamirTeslim.TeknikPersonelAciklama;
                    dbTamirTeslim.IadeEdenPersonelId = tamirTeslim.IadeEdenPersonelId;
                    dbTamirTeslim.IadeTarihi = tamirTeslim.IadeTarihi;
                    dbTamirTeslim.MusteriSorunAciklama = tamirTeslim.MusteriSorunAciklama;
                    dbTamirTeslim.TeslimAlinanAksesuar = tamirTeslim.TeslimAlinanAksesuar;
                    dbTamirTeslim.KargoIleGeldi = tamirTeslim.KargoIleGeldi;
                    dbTamirTeslim.KargoIleGonderilecek = tamirTeslim.KargoIleGonderilecek;
                    dbTamirTeslim.TeslimAlan = tamirTeslim.TeslimAlan;

                }

                teknikProje.SaveChanges();
            }
        }
    }
}
