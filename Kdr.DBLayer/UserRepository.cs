using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Kdr.DBLayer
{
    public static class UserRepository
    {

        public static bool LoginUser(string userName, string password)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                var personel = teknikProje.Personel.FirstOrDefault(s => s.KullaniciAdi == userName && s.Sifre == password);

                if (personel == null)
                    return false;
                else
                {
                    DBHelper.LoginPersonel = personel;

                    return true;
                }
            }
        }

        public static List<Personel> GetPersonels()
        {

            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.Personel.Where(s => !s.Pasif.Value).ToList();
            }

        }

        public static List<Personel> GetPersonels(string userName)
        {
            if (!string.IsNullOrEmpty(userName))
            {
                using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
                {

                    return teknikProje.Personel.Where(s => !s.Pasif.Value && (s.KullaniciAdi.Contains(userName) || s.Adi.Contains(userName))).ToList();
                }
            }
            else
            {
                return GetPersonels();
            }

        }

    

        public static void SavePersonel(this Personel personel)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                if (personel.Id == 0)
                {
                    teknikProje.Personel.Add(personel);
                }
                else
                {
                    var dbPersonel = teknikProje.Personel.FirstOrDefault(s => s.Id == personel.Id);
                    dbPersonel.KullaniciAdi = personel.KullaniciAdi;
                    dbPersonel.Pasif = personel.Pasif;
                    dbPersonel.Sifre = personel.Sifre;
                    dbPersonel.Gorev = personel.Gorev;
                    dbPersonel.Adi = personel.Adi;
                    dbPersonel.Soyadi = personel.Soyadi;
                }

                teknikProje.SaveChanges();
            }
        }

        public static Personel GetPersonel(int personelId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.Personel.FirstOrDefault(s => s.Id == personelId);
            }
        }
    }
}
