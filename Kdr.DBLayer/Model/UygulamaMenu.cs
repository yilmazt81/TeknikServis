using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer.Model
{
    public class UygulamaMenu
    {

        public int Id { get; set; }
        public string MenuName { get; set; }
        public int UstMenuId { get; set; }
        public string MenuClass { get; set; }
        public int IconIndex { get; set; }

    }
}
