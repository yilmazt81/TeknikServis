//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Kdr.DBLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class vTamirTeslim
    {
        public int Id { get; set; }
        public string MusteriAdi { get; set; }
        public string GsmNo { get; set; }
        public string Eposta { get; set; }
        public string IlAdi { get; set; }
        public string IlceAdi { get; set; }
        public string Marka { get; set; }
        public string Model { get; set; }
        public string SeriNo { get; set; }
        public Nullable<System.DateTime> TeslimTarihi { get; set; }
        public string Barcode { get; set; }
        public string TamirDurum { get; set; }
        public Nullable<byte> TamirDurumId { get; set; }
        public string TeknikPersonelAciklama { get; set; }
        public string TamirPersonel { get; set; }
        public Nullable<int> PersonelUstId { get; set; }
        public Nullable<bool> KargoIleGonderilecek { get; set; }
    }
}