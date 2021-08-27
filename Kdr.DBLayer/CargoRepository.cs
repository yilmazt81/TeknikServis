using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Kdr.DBLayer
{
    public static class CargoRepository
    {

        public static List<KargoFirma> GetKargoFirmas()
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.KargoFirma.ToList();
            }


        }

        public static List<KargoSube> GetKargoSubes(int kargoFirmaId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.KargoSube.Where(s => s.KargoFirmaId == kargoFirmaId).ToList();
            }
        }

        public static void Save(this KargoFirma kargoFirma)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                if (kargoFirma.Id == 0)
                {
                    teknikProje.KargoFirma.Add(kargoFirma);
                }
                else
                {
                    var dbFirma = teknikProje.KargoFirma.FirstOrDefault(s => s.Id == kargoFirma.Id);
                    dbFirma.FirmaAdi = kargoFirma.FirmaAdi;
                }

                teknikProje.SaveChanges();
            }
        }

        public static CihazKargoGonderim GetCihazKargoGonderim(int cihazTamirId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                var kargoGonderim = teknikProje.CihazKargoGonderim.FirstOrDefault(s => s.Id == cihazTamirId);
                if (kargoGonderim == null)
                {
                    var cihazTamir = teknikProje.TamirTeslim.FirstOrDefault(s => s.Id == cihazTamirId);

                    kargoGonderim = new CihazKargoGonderim()
                    {
                        IlceId = cihazTamir.Musteri.IlceId.Value,
                        IlId = cihazTamir.Musteri.IlId.Value,
                        MusteriAdi = cihazTamir.Musteri.TamAdi,
                        GsmNo = cihazTamir.Musteri.GsmNo,
                        Adres = cihazTamir.Musteri.Adres,
                        TamirTeslimId = cihazTamirId,
                        GondermeTarihi = DateTime.Now,
                        GonderenPersonelId = DBHelper.LoginPersonel.Id,
                    };
                }

                return kargoGonderim;
            }
        }

        public static void Save(this CihazKargoGonderim cihazKargo)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                if (cihazKargo.Id == 0)
                {
                    teknikProje.CihazKargoGonderim.Add(cihazKargo);
                }
                else
                {
                    var dbKargoGonderim = teknikProje.CihazKargoGonderim.FirstOrDefault(s => s.Id == cihazKargo.Id);

                    dbKargoGonderim.KargoFirmaId = cihazKargo.KargoFirmaId;
                    dbKargoGonderim.GonderiNumarasi = cihazKargo.GonderiNumarasi;
                    dbKargoGonderim.Adres = cihazKargo.Adres;
                }

                teknikProje.SaveChanges();
            }
        }

        public static CihazKargoGonderim GetKargoGonderim(int id)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                var dbKargoGonderim = teknikProje.CihazKargoGonderim.FirstOrDefault(s => s.Id == id);

                return dbKargoGonderim;
            }
        }

        public static List<CihazGonderimKargo> GetLastCihazGonderim()
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.CihazKargoGonderim.Take(20).Select(s => new CihazGonderimKargo()
                {
                    Adres = s.Adres,
                    GonderiNo = s.GonderiNumarasi,
                    IlAdi = s.Il.IlAdi,
                    IlceAdi = s.Ilce.IlceAdi,
                    KargoAdi = s.KargoFirma.FirmaAdi,
                    MusteriAdi = s.MusteriAdi,
                    Id = s.Id
                }).ToList();
            }
        }

        public static void Save(this KargoSube kargoSube)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                if (kargoSube.Id == 0)
                {
                    teknikProje.KargoSube.Add(kargoSube);
                }
                else
                {
                    var dbSube = teknikProje.KargoSube.FirstOrDefault(s => s.Id == kargoSube.Id);
                    dbSube.SubeAdi = kargoSube.SubeAdi;
                    dbSube.TelefonNo = kargoSube.TelefonNo;

                }
                teknikProje.SaveChanges();
            }
        }
    }
}
