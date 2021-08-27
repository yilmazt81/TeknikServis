using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Kdr.DBLayer
{
    public class AdressRepository
    {
        private static List<Il> cityList = null;
        //Singleton desing Pattern
        static AdressRepository()
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                cityList = teknikProje.Il.ToList();
            }
        }
        public static List<Il> GetCity()
        {
            return cityList;

        }
        public static Il GetCity(int cityId)
        {

            return cityList.FirstOrDefault(s => s.Id == cityId);

        }

        public static List<Ilce> GetCityDistrict(int cityId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {
                return teknikProje.Ilce.Where(s => s.IlId == cityId).ToList();
            }
        }

        public static Ilce GetDistrict(int districtId)
        {
            using (TeknikProjeEntities teknikProje = new TeknikProjeEntities())
            {

                return teknikProje.Ilce.FirstOrDefault(s => s.Id == districtId);
            }
        }
    }
}
