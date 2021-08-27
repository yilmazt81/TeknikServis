using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer
{
    public class SessionRepository
    {
        private static int LastSesionId = 0;
        public static PersonelLoginSession GetPersonelOpenSession(int userId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                var openSession = teknikProje.PersonelLoginSession.FirstOrDefault(s => s.PersonelId == userId && !s.CikisTarihi.HasValue);

                LastSesionId = (openSession != null ? openSession.Id : 0);

                return openSession;
            }
        }

        public static void CloseSession()
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                var dbSession = teknikProje.PersonelLoginSession.FirstOrDefault(s => s.Id == LastSesionId);
                dbSession.CikisTarihi = DateTime.Now;

                teknikProje.SaveChanges();
            }
        }
        public static void OpenSession(int userId, string computerName)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                var session = new PersonelLoginSession()
                {
                    BilgisayarAdi = computerName,
                    PersonelId = userId,
                    GirisTarihi = DateTime.Now
                };

                teknikProje.PersonelLoginSession.Add(session);

                teknikProje.SaveChanges();

                LastSesionId = session.Id;

            }
        }

    }
}
