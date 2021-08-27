using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer
{
    public static class ReportRepository
    {
        static Repository<PerformansRapor> repository = null;
        static ReportRepository()
        {

            repository = new Repository<PerformansRapor>(new TeknikProjeEntities());
        }
        public static PerformansRapor[] GetPerformansRapors()
        {

            return repository.Get().ToArray();
        }


        public static void Save(PerformansRapor performansRapor)
        {
            repository.Add(performansRapor);
            repository.Save();
        }

        public static void Delete(PerformansRapor performansRapor)
        {
            repository.Remove(performansRapor);
            repository.Save();
        }

        public static List<PerformansReportView> GetPerformansReportViews(string reportProcedure, DateTime startDate, DateTime endDate)
        {
            using (TeknikProjeEntities projeEntities = new TeknikProjeEntities())
            {
                
                using (projeEntities.Database.Connection)
                {
                    projeEntities.Database.Connection.Open();
                    DbCommand cmdItems = projeEntities.Database.Connection.CreateCommand();
                    cmdItems.CommandText = reportProcedure;
                    cmdItems.CommandType = CommandType.StoredProcedure;
                    cmdItems.Parameters.Add(new SqlParameter("@DateStart", startDate));
                    cmdItems.Parameters.Add(new SqlParameter("@DateEnd", endDate));

                    List<PerformansReportView> performansReports = new List<PerformansReportView>();
                    using (var reader = cmdItems.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            performansReports.Add(new PerformansReportView()
                            {
                                PersonelFullName=reader["PersonelFullName"].ToString(),
                                CihazAdet=Convert.ToInt32(reader["CihazAdet"]),
                                TamirFiyat=Convert.ToInt32(reader["TamirFiyat"]),
                                ReportDate=(DateTime)reader["ReportDate"]
                            });
                        }
                    }

                    return performansReports;
                }

            }
        }
    }
}
