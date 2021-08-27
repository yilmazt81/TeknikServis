using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer
{
    public class PerformansReportView
    {

        public DateTime ReportDate { get; set; }

        public string PersonelFullName { get; set; }
        public int CihazAdet { get; set; }
        public int TamirFiyat { get; set; }

    }
}
