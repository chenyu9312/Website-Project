//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProgramInformationApplication
{
    using System;
    using System.Collections.Generic;
    
    public partial class SchoolInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SchoolInfo()
        {
            this.DeanInfoes = new HashSet<DeanInfo>();
            this.DepartmentInfoes = new HashSet<DepartmentInfo>();
        }
    
        public string SchoolAbbrev { get; set; }
        public string SchoolName { get; set; }
        public string SchoolDescription { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeanInfo> DeanInfoes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DepartmentInfo> DepartmentInfoes { get; set; }
    }
}
