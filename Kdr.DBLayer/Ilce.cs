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
    
    public partial class Ilce
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ilce()
        {
            this.Musteri = new HashSet<Musteri>();
            this.CihazKargoGonderim = new HashSet<CihazKargoGonderim>();
        }
    
        public int Id { get; set; }
        public int IlId { get; set; }
        public string IlceAdi { get; set; }
    
        public virtual Il Il { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Musteri> Musteri { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CihazKargoGonderim> CihazKargoGonderim { get; set; }
    }
}
