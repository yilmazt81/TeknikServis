using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer
{
    public static class CihazParcaHelper
    {


        public static List<CihazParca> GetCihazParcas()
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                return teknikProje.CihazParca.ToList();

            }

        }

        public static CihazParca GetCihazParca(int id)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.CihazParca.FirstOrDefault(s => s.Id == id);
            }

        }
        public static List<CihazParca> GetCihazParcaByBarcode(string barcode)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.CihazParca.Where(s => s.Barkod == barcode).ToList();
            }

        }

        public static List<CihazParca> GetCihazParcaByName(string parcaAdi)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.CihazParca.Where(s => s.ParcaAdi.Contains(parcaAdi)).ToList();
            }
        }
        public static List<CihazParca> GetCihazParcaByBrandModel(string brand, string model)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.CihazParca.Where(s => s.Marka == brand && s.Model == model).ToList();
            }
        }

        public static List<CihazTamirAddCihazPersonelInfo> GetCihazTamirParcas(int tamirTeslimId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                var parcaListe = teknikProje.CihazTamirParca.Where(s => s.TamirTeslimId == tamirTeslimId).ToList();

                var infoList = parcaListe.Select(s => new CihazTamirAddCihazPersonelInfo()
                {
                    Id = s.Id,
                    ParcaId = s.CihazParcaId,
                    AddDate = s.EklemeTarihi.Value,
                    PersonelName = s.Personel.Adi + " " + s.Personel.Soyadi,
                    ParcaAdi = s.CihazParca.ParcaAdi,
                    ParcaBekliyor = (s.ParcaBekliyor.HasValue ? s.ParcaBekliyor.Value : false),
                    ParcaFiyat = (s.CihazParca.Fiyat.Value + s.CihazParca.MontajUcreti.Value)


                }).ToList();

                return infoList;
            }
        }
        public static void Save(this CihazParca cihazParca)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                if (cihazParca.Id == 0)
                {
                    teknikProje.CihazParca.Add(cihazParca);
                }
                else
                {
                    var dbCihazParca = teknikProje.CihazParca.FirstOrDefault(s => s.Id == cihazParca.Id);
                    dbCihazParca.Fiyat = cihazParca.Fiyat;
                    dbCihazParca.ParcaAdi = cihazParca.ParcaAdi;
                    dbCihazParca.MontajUcreti = cihazParca.MontajUcreti;
                    dbCihazParca.StokAdet = cihazParca.StokAdet;
                    dbCihazParca.Marka = cihazParca.Marka;
                    dbCihazParca.Model = cihazParca.Model;
                 
                }

                teknikProje.SaveChanges();
            }
        }

        public static void Delete(this CihazTamirAddCihazPersonelInfo cihazParca)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                var dbParca = teknikProje.CihazTamirParca.FirstOrDefault(s => s.Id == cihazParca.Id);
                teknikProje.CihazTamirParca.Remove(dbParca);
                teknikProje.SaveChanges();
            }
        }

        public static void Save(this CihazTamirParca cihazParca)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                if (cihazParca.Id == 0)
                {
                    teknikProje.CihazTamirParca.Add(cihazParca);
                    if (!cihazParca.ParcaBekliyor.Value)
                    {   //Stok Cihaz Düzelt
                        var cihaz = teknikProje.CihazParca.FirstOrDefault(s => s.Id == cihazParca.CihazParcaId);
                        cihaz.StokAdet--;
                    }
                }
                else
                {
                    var dtCihazTamir = teknikProje.CihazTamirParca.FirstOrDefault(s => s.Id == cihazParca.Id);
                    dtCihazTamir.ParcaBekliyor = cihazParca.ParcaBekliyor;
                }
                teknikProje.SaveChanges();
            }
        }
    }
}
