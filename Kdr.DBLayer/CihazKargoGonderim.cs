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
    
    public partial class CihazKargoGonderim
    {
        public int Id { get; set; }
        public int TamirTeslimId { get; set; }
        public int GonderenPersonelId { get; set; }
        public System.DateTime GondermeTarihi { get; set; }
        public int KargoFirmaId { get; set; }
        public string GonderiNumarasi { get; set; }
        public int IlId { get; set; }
        public int IlceId { get; set; }
        public string Adres { get; set; }
        public string MusteriAdi { get; set; }
        public string GsmNo { get; set; }
    
        public virtual Il Il { get; set; }
        public virtual Ilce Ilce { get; set; }
        public virtual KargoFirma KargoFirma { get; set; }
        public virtual Personel Personel { get; set; }
        public virtual TamirTeslim TamirTeslim { get; set; }
    }
}
