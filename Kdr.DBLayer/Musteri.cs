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
    
    public partial class Musteri
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Musteri()
        {
            this.TamirTeslim = new HashSet<TamirTeslim>();
        }
    
        public int Id { get; set; }
        public string TamAdi { get; set; }
        public string GsmNo { get; set; }
        public string Eposta { get; set; }
        public Nullable<int> IlId { get; set; }
        public Nullable<int> IlceId { get; set; }
        public string Adres { get; set; }
    
        public virtual Il Il { get; set; }
        public virtual Ilce Ilce { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TamirTeslim> TamirTeslim { get; set; }
    }
}
