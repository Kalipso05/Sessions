namespace DataCenter.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TherapeuticDiagnosticMesuares
    {
        public int ID { get; set; }

        public int? IDPatient { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateOfMesuares { get; set; }

        public int? IDUser { get; set; }

        public int? IDTypeMesuares { get; set; }

        [StringLength(50)]
        public string NameMesuares { get; set; }

        public int? IDResultMesuares { get; set; }

        [StringLength(50)]
        public string Recomendation { get; set; }

        public virtual Patient Patient { get; set; }

        public virtual ResultMesuares ResultMesuares { get; set; }

        public virtual TypeMesuares TypeMesuares { get; set; }

        public virtual Users Users { get; set; }
    }
}
