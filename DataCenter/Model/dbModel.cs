using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DataCenter.Model
{
    public partial class dbModel : DbContext
    {
        public dbModel()
            : base("name=dbModel")
        {
        }

        public virtual DbSet<CodeHospitalization> CodeHospitalization { get; set; }
        public virtual DbSet<DiseaseHistory> DiseaseHistory { get; set; }
        public virtual DbSet<Gender> Gender { get; set; }
        public virtual DbSet<Hospitalization> Hospitalization { get; set; }
        public virtual DbSet<InsuranseCompany> InsuranseCompany { get; set; }
        public virtual DbSet<InsuransePolicy> InsuransePolicy { get; set; }
        public virtual DbSet<MedicalCard> MedicalCard { get; set; }
        public virtual DbSet<Passport> Passport { get; set; }
        public virtual DbSet<Patient> Patient { get; set; }
        public virtual DbSet<ResultMesuares> ResultMesuares { get; set; }
        public virtual DbSet<SecurityAccessLog> SecurityAccessLog { get; set; }
        public virtual DbSet<Speciality> Speciality { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TherapeuticDiagnosticMesuares> TherapeuticDiagnosticMesuares { get; set; }
        public virtual DbSet<TypeHospitalization> TypeHospitalization { get; set; }
        public virtual DbSet<TypeMesuares> TypeMesuares { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CodeHospitalization>()
                .HasMany(e => e.Hospitalization)
                .WithRequired(e => e.CodeHospitalization)
                .HasForeignKey(e => e.IDCodeHospitalization)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DiseaseHistory>()
                .HasMany(e => e.Patient)
                .WithOptional(e => e.DiseaseHistory)
                .HasForeignKey(e => e.IDDiseaseHistory);

            modelBuilder.Entity<Gender>()
                .HasMany(e => e.Patient)
                .WithOptional(e => e.Gender)
                .HasForeignKey(e => e.IDGender);

            modelBuilder.Entity<Gender>()
                .HasMany(e => e.Users)
                .WithRequired(e => e.Gender)
                .HasForeignKey(e => e.IDGender)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<InsuranseCompany>()
                .HasMany(e => e.Patient)
                .WithRequired(e => e.InsuranseCompany)
                .HasForeignKey(e => e.IDInsuranseCompany)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<InsuransePolicy>()
                .HasMany(e => e.Patient)
                .WithRequired(e => e.InsuransePolicy)
                .HasForeignKey(e => e.IDInsuransePolicy)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MedicalCard>()
                .HasMany(e => e.Patient)
                .WithRequired(e => e.MedicalCard)
                .HasForeignKey(e => e.IDMedicalCard)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Passport>()
                .HasMany(e => e.Patient)
                .WithRequired(e => e.Passport)
                .HasForeignKey(e => e.IDPassport)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Patient>()
                .HasMany(e => e.Hospitalization)
                .WithRequired(e => e.Patient)
                .HasForeignKey(e => e.IDPatient)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Patient>()
                .HasMany(e => e.TherapeuticDiagnosticMesuares)
                .WithOptional(e => e.Patient)
                .HasForeignKey(e => e.IDPatient);

            modelBuilder.Entity<ResultMesuares>()
                .HasMany(e => e.TherapeuticDiagnosticMesuares)
                .WithOptional(e => e.ResultMesuares)
                .HasForeignKey(e => e.IDResultMesuares);

            modelBuilder.Entity<Speciality>()
                .HasMany(e => e.Users)
                .WithRequired(e => e.Speciality)
                .HasForeignKey(e => e.IDSpeciality)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TypeHospitalization>()
                .HasMany(e => e.CodeHospitalization)
                .WithRequired(e => e.TypeHospitalization)
                .HasForeignKey(e => e.IDTypeHospitalization)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TypeMesuares>()
                .HasMany(e => e.TherapeuticDiagnosticMesuares)
                .WithOptional(e => e.TypeMesuares)
                .HasForeignKey(e => e.IDTypeMesuares);

            modelBuilder.Entity<Users>()
                .HasMany(e => e.TherapeuticDiagnosticMesuares)
                .WithOptional(e => e.Users)
                .HasForeignKey(e => e.IDUser);
        }
    }
}
