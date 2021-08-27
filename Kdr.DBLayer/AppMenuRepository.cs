using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Kdr.DBLayer
{
    public static class AppMenuRepository
    {
        static List<UygulamaMenu> applicationMenuList = new List<UygulamaMenu>();
        static AppMenuRepository()
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                applicationMenuList = teknikProje.UygulamaMenu.ToList();
            }
        }
        public static UygulamaMenu[] GetUygulamaMenus()
        {
            return applicationMenuList.ToArray();
        }

        public static UygulamaMenu[] GetUygulamaMenuByPermission(string yetkiAdi)
        { 
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                return teknikProje.UygulamaMenuYetki.Where(s => s.YetkiAdi == yetkiAdi).Select(s => s.UygulamaMenu).ToArray();

            } 
        }
    }
}
