using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TravelManagement.Models
{
    public partial class projectContext : DbContext
    {
        public projectContext()
        {
        }

        public projectContext(DbContextOptions<projectContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<TourImage> TourImages { get; set; } = null!;
        public virtual DbSet<TourMember> TourMembers { get; set; } = null!;
        public virtual DbSet<TourPackage> TourPackages { get; set; } = null!;
        public virtual DbSet<TourPayment> TourPayments { get; set; } = null!;
        public virtual DbSet<TourTransaction> TourTransactions { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySql("server=localhost;port=3306;user=root;password=krushna;database=project", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.2.0-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("utf8mb4_0900_ai_ci")
                .HasCharSet("utf8mb4");

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("role");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(30)
                    .HasColumnName("role_name");
            });

            modelBuilder.Entity<TourImage>(entity =>
            {
                entity.HasKey(e => e.ImageId)
                    .HasName("PRIMARY");

                entity.ToTable("tour_image");

                entity.HasIndex(e => e.TpId, "tp_id");

                entity.Property(e => e.ImageId).HasColumnName("image_id");

                entity.Property(e => e.ImageUrl)
                    .HasColumnType("mediumtext")
                    .HasColumnName("image_url");

                entity.Property(e => e.TpId).HasColumnName("tp_id");

                entity.HasOne(d => d.Tp)
                    .WithMany(p => p.TourImages)
                    .HasForeignKey(d => d.TpId)
                    .HasConstraintName("tour_image_ibfk_1");
            });

            modelBuilder.Entity<TourMember>(entity =>
            {
                entity.HasKey(e => e.MemberId)
                    .HasName("PRIMARY");

                entity.ToTable("tour_member");

                entity.HasIndex(e => e.AadharNo, "aadhar_no_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.TtId, "tt_id");

                entity.HasIndex(e => e.UserId, "user_id");

                entity.Property(e => e.MemberId).HasColumnName("member_id");

                entity.Property(e => e.AadharNo)
                    .HasMaxLength(15)
                    .HasColumnName("aadhar_no");

                entity.Property(e => e.Fname)
                    .HasMaxLength(15)
                    .HasColumnName("fname");

                entity.Property(e => e.Lname)
                    .HasMaxLength(15)
                    .HasColumnName("lname");

                entity.Property(e => e.TtId).HasColumnName("tt_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Tt)
                    .WithMany(p => p.TourMembers)
                    .HasForeignKey(d => d.TtId)
                    .HasConstraintName("tour_member_ibfk_2");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.TourMembers)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("tour_member_ibfk_1");
            });

            modelBuilder.Entity<TourPackage>(entity =>
            {
                entity.ToTable("tour_package");

                entity.HasIndex(e => e.GuideId, "guide_id");

                entity.HasIndex(e => e.MgrId, "mgr_id");

                entity.Property(e => e.TourPackageId).HasColumnName("tour_package_id");

                entity.Property(e => e.Description)
                    .HasMaxLength(250)
                    .HasColumnName("description");

                entity.Property(e => e.Duration).HasColumnName("duration");

                entity.Property(e => e.EndDate).HasColumnName("end_date");

                entity.Property(e => e.GuideId).HasColumnName("guide_id");

                entity.Property(e => e.MgrId).HasColumnName("mgr_id");

                entity.Property(e => e.NoOfSeats).HasColumnName("no_of_seats");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.StartDate).HasColumnName("start_date");

                entity.Property(e => e.Status)
                    .HasMaxLength(20)
                    .HasColumnName("status");

                entity.Property(e => e.TourName)
                    .HasMaxLength(30)
                    .HasColumnName("tour_name");

                entity.HasOne(d => d.Guide)
                    .WithMany(p => p.TourPackageGuides)
                    .HasForeignKey(d => d.GuideId)
                    .HasConstraintName("tour_package_ibfk_2");

                entity.HasOne(d => d.Mgr)
                    .WithMany(p => p.TourPackageMgrs)
                    .HasForeignKey(d => d.MgrId)
                    .HasConstraintName("tour_package_ibfk_1");
            });

            modelBuilder.Entity<TourPayment>(entity =>
            {
                entity.HasKey(e => e.PaymentId)
                    .HasName("PRIMARY");

                entity.ToTable("tour_payment");

                entity.HasIndex(e => e.TourTransactionId, "tour_transaction_id");

                entity.Property(e => e.PaymentId).HasColumnName("payment_id");

                entity.Property(e => e.Amount).HasColumnName("amount");

                entity.Property(e => e.PaymentDate).HasColumnName("payment_date");

                entity.Property(e => e.PaymentMode)
                    .HasMaxLength(15)
                    .HasColumnName("payment_mode");

                entity.Property(e => e.TourTransactionId).HasColumnName("tour_transaction_id");

                entity.HasOne(d => d.TourTransaction)
                    .WithMany(p => p.TourPayments)
                    .HasForeignKey(d => d.TourTransactionId)
                    .HasConstraintName("tour_payment_ibfk_1");
            });

            modelBuilder.Entity<TourTransaction>(entity =>
            {
                entity.ToTable("tour_transaction");

                entity.HasIndex(e => e.TourPackageId, "tour_package_id");

                entity.HasIndex(e => e.UserId, "user_id");

                entity.Property(e => e.TourTransactionId).HasColumnName("tour_transaction_id");

                entity.Property(e => e.BookingDate).HasColumnName("booking_date");

                entity.Property(e => e.Status)
                    .HasMaxLength(30)
                    .HasColumnName("status");

                entity.Property(e => e.TourPackageId).HasColumnName("tour_package_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.TourPackage)
                    .WithMany(p => p.TourTransactions)
                    .HasForeignKey(d => d.TourPackageId)
                    .HasConstraintName("tour_transaction_ibfk_2");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.TourTransactions)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("tour_transaction_ibfk_1");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");

                entity.HasIndex(e => e.AadharNo, "aadhar_no_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.Email, "email")
                    .IsUnique();

                entity.HasIndex(e => e.PhoneNo, "phone_no")
                    .IsUnique();

                entity.HasIndex(e => e.RoleId, "role_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.AadharNo)
                    .HasMaxLength(12)
                    .HasColumnName("aadhar_no");

                entity.Property(e => e.Address)
                    .HasMaxLength(50)
                    .HasColumnName("address");

                entity.Property(e => e.Email)
                    .HasMaxLength(30)
                    .HasColumnName("email");

                entity.Property(e => e.Fname)
                    .HasMaxLength(15)
                    .HasColumnName("fname");

                entity.Property(e => e.Lname)
                    .HasMaxLength(15)
                    .HasColumnName("lname");

                entity.Property(e => e.Password)
                    .HasMaxLength(400)
                    .HasColumnName("password");

                entity.Property(e => e.PhoneNo)
                    .HasMaxLength(15)
                    .HasColumnName("phone_no");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("user_ibfk_1");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
