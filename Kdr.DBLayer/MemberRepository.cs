using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Kdr.DBLayer
{
    public static class MemberRepository
    {

        public static List<Musteri> GetMusteris(string musteriAdi)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                return teknikProje.Musteri.Where(s => s.TamAdi.Contains(musteriAdi)).ToList();
            } 
        }

        public static Musteri GetMusteri(int musteriId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.Musteri.FirstOrDefault(s => s.Id == musteriId);
            }
        }

        public static void SaveMusteri(this Musteri musteri)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                if (musteri.Id == 0)
                {
                    teknikProje.Musteri.Add(musteri);
                }
                else
                {
                    var dbcustomer = teknikProje.Musteri.FirstOrDefault(s => s.Id == musteri.Id);

                    dbcustomer.GsmNo = musteri.GsmNo;
                    dbcustomer.IlceId = musteri.IlceId;
                    dbcustomer.IlId = musteri.IlId;
                    dbcustomer.TamAdi = musteri.TamAdi;
                    dbcustomer.Adres = musteri.Adres;

                }

                teknikProje.SaveChanges();
            }
        }
    }
}
