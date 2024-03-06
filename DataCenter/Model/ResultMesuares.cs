namespace DataCenter.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ResultMesuares
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ResultMesuares()
        {
            TherapeuticDiagnosticMesuares = new HashSet<TherapeuticDiagnosticMesuares>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string ValueAnalysis { get; set; }

        [Required]
        [StringLength(255)]
        public string DescriptionChanged { get; set; }

        [Required]
        [StringLength(50)]
        public string PrescribedMedications { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TherapeuticDiagnosticMesuares> TherapeuticDiagnosticMesuares { get; set; }
    }
}
