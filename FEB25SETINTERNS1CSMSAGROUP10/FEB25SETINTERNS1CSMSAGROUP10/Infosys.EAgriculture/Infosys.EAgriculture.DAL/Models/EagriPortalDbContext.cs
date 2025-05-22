using System;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using System.Linq;
using Infosys.EAgriculture.DAL.CustomDataTransferObjectClass;

namespace Infosys.EAgriculture.DAL.Models;

public partial class EagriPortalDbContext : DbContext
{
    public EagriPortalDbContext()
    {
    }

    public EagriPortalDbContext(DbContextOptions<EagriPortalDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Announcement> Announcements { get; set; }

    public virtual DbSet<CropAvailabilityDetail> CropAvailabilityDetails { get; set; }

    public virtual DbSet<DiscussionForum> DiscussionForums { get; set; }

    public virtual DbSet<ExpertGuide> ExpertGuides { get; set; }

    public virtual DbSet<FarmerProfile> FarmerProfiles { get; set; }

    public virtual DbSet<FarmerReview> FarmerReviews { get; set; }

    public virtual DbSet<GovernmentScheme> GovernmentSchemes { get; set; }

    public virtual DbSet<GuideReview> GuideReviews { get; set; }

    public virtual DbSet<HarvestingReminder> HarvestingReminders { get; set; }

    public virtual DbSet<Policy> Policies { get; set; }

    public virtual DbSet<SchemeAlert> SchemeAlerts { get; set; }

    public virtual DbSet<ShipmentTracking> ShipmentTrackings { get; set; }

    public virtual DbSet<TraderCropPreference> TraderCropPreferences { get; set; }

    public virtual DbSet<TraderFavorite> TraderFavorites { get; set; }

    public virtual DbSet<TraderProfile> TraderProfiles { get; set; }

    public virtual DbSet<TraderReview> TraderReviews { get; set; }

    public virtual DbSet<Transaction> Transactions { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<WeatherAlert> WeatherAlerts { get; set; }

    public virtual DbSet<WeatherDatum> WeatherData { get; set; } 

    public  DbSet<ShipmentTrackingDetailOfTrader> ShipmentTrackingDetailOfTraders { get; set; }

    public DbSet<FarmerTransactionHistory> FarmerTransactionHistories { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer(
        new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json")
            .Build()
            .GetConnectionString("QuickKartDBConnectionString"));
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Announcement>(entity =>
        {
            entity.HasKey(e => e.AnnouncementId).HasName("PK__Announce__9DE44554BFF77DF3");

            entity.Property(e => e.AnnouncementId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("AnnouncementID");
            entity.Property(e => e.AdminId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("AdminID");
            entity.Property(e => e.Content)
                .IsRequired()
                .HasMaxLength(1000);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Title)
                .IsRequired()
                .HasMaxLength(200);

            entity.HasOne(d => d.Admin).WithMany(p => p.Announcements)
                .HasForeignKey(d => d.AdminId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Announcem__Admin__01142BA1");
        });

        modelBuilder.Entity<CropAvailabilityDetail>(entity =>
        {
            entity.HasKey(e => e.ListingId).HasName("PK__CropAvai__BF3EBEF018C38F66");

            entity.Property(e => e.ListingId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ListingID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CropName)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.Location)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.PricePerUnit).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Quantity).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasMaxLength(20);
            entity.Property(e => e.Unit)
                .IsRequired()
                .HasMaxLength(20);
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");

            entity.HasOne(d => d.Farmer).WithMany(p => p.CropAvailabilityDetails)
                .HasForeignKey(d => d.FarmerId)
                .HasConstraintName("FK__CropAvail__Farme__35BCFE0A");
        });

        modelBuilder.Entity<DiscussionForum>(entity =>
        {
            entity.HasKey(e => e.ThreadId).HasName("PK__Discussi__688356E424E1A316");

            entity.Property(e => e.ThreadId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ThreadID");
            entity.Property(e => e.Category)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.InitialMessage)
                .IsRequired()
                .HasMaxLength(1000);
            entity.Property(e => e.Title)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");

            entity.HasOne(d => d.Farmer).WithMany(p => p.DiscussionForums)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Discussio__Farme__6EF57B66");
        });

        modelBuilder.Entity<ExpertGuide>(entity =>
        {
            entity.HasKey(e => e.GuideId).HasName("PK__ExpertGu__E77EE03E1C1FBF6A");

            entity.Property(e => e.GuideId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("GuideID");
            entity.Property(e => e.Author)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.Content).IsRequired();
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Summary)
                .IsRequired()
                .HasMaxLength(500);
            entity.Property(e => e.Title)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Topic).HasMaxLength(100);
        });

        modelBuilder.Entity<FarmerProfile>(entity =>
        {
            entity.HasKey(e => e.FarmerProfileId).HasName("PK__FarmerPr__688AB34D08F37026");

            entity.Property(e => e.FarmerProfileId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerProfileID");
            entity.Property(e => e.FarmName).HasMaxLength(100);
            entity.Property(e => e.FarmSize).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.FarmingType).HasMaxLength(50);
            entity.Property(e => e.LanguagesSpoken).HasMaxLength(200);
            entity.Property(e => e.Location).HasMaxLength(200);

            entity.HasOne(d => d.FarmerProfileNavigation).WithOne(p => p.FarmerProfile)
                .HasForeignKey<FarmerProfile>(d => d.FarmerProfileId)
                .HasConstraintName("FK__FarmerPro__Farme__2B3F6F97");
        });

        modelBuilder.Entity<FarmerReview>(entity =>
        {
            entity.HasKey(e => e.ReviewId).HasName("PK__FarmerRe__74BC79AEF4DCCDCD");

            entity.HasIndex(e => new { e.TransactionId, e.FarmerId, e.TraderId }, "UQ__FarmerRe__21D35AD98BD4AA85").IsUnique();

            entity.Property(e => e.ReviewId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ReviewID");
            entity.Property(e => e.Comment).HasMaxLength(500);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.TraderId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TraderID");
            entity.Property(e => e.TransactionId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TransactionID");

            entity.HasOne(d => d.Farmer).WithMany(p => p.FarmerReviewFarmers)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__FarmerRev__Farme__440B1D61");

            entity.HasOne(d => d.Trader).WithMany(p => p.FarmerReviewTraders)
                .HasForeignKey(d => d.TraderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__FarmerRev__Trade__44FF419A");

            entity.HasOne(d => d.Transaction).WithMany(p => p.FarmerReviews)
                .HasForeignKey(d => d.TransactionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__FarmerRev__Trans__4316F928");
        });

        modelBuilder.Entity<GovernmentScheme>(entity =>
        {
            entity.HasKey(e => e.SchemeId).HasName("PK__Governme__DB7E1A42FC6EE3C9");

            entity.Property(e => e.SchemeId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("SchemeID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .IsRequired()
                .HasMaxLength(1000);
            entity.Property(e => e.Eligibility).HasMaxLength(500);
            entity.Property(e => e.TargetLocation)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Title)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");
        });

        modelBuilder.Entity<GuideReview>(entity =>
        {
            entity.HasKey(e => e.ReviewId).HasName("PK__GuideRev__74BC79AE81A50F10");

            entity.HasIndex(e => new { e.GuideId, e.FarmerId }, "UQ__GuideRev__704F58B11414F0F8").IsUnique();

            entity.Property(e => e.ReviewId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ReviewID");
            entity.Property(e => e.Comment).HasMaxLength(500);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.GuideId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("GuideID");

            entity.HasOne(d => d.Farmer).WithMany(p => p.GuideReviews)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__GuideRevi__Farme__6B24EA82");

            entity.HasOne(d => d.Guide).WithMany(p => p.GuideReviews)
                .HasForeignKey(d => d.GuideId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__GuideRevi__Guide__6A30C649");
        });

        modelBuilder.Entity<HarvestingReminder>(entity =>
        {
            entity.HasKey(e => e.ReminderId).HasName("PK__Harvesti__01A830A7C8480998");

            entity.HasIndex(e => new { e.FarmerId, e.CropName, e.HarvestDate, e.ReminderTime }, "UQ__Harvesti__2A0EE7CF810A0DE3").IsUnique();

            entity.Property(e => e.ReminderId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ReminderID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CropName)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.ReminderMessage).HasMaxLength(500);
            entity.Property(e => e.Status)
                .IsRequired()
                .HasMaxLength(20);
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");

            entity.HasOne(d => d.Farmer).WithMany(p => p.HarvestingReminders)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Harvestin__Farme__619B8048");
        });

        modelBuilder.Entity<Policy>(entity =>
        {
            entity.HasKey(e => e.PolicyId).HasName("PK__Policies__2E13394472E93010");

            entity.Property(e => e.PolicyId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("PolicyID");
            entity.Property(e => e.AdminId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("AdminID");
            entity.Property(e => e.Content).IsRequired();
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Title)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");

            entity.HasOne(d => d.Admin).WithMany(p => p.Policies)
                .HasForeignKey(d => d.AdminId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Policies__AdminI__04E4BC85");
        });

        modelBuilder.Entity<SchemeAlert>(entity =>
        {
            entity.HasKey(e => e.AlertId).HasName("PK__SchemeAl__EBB16AEDCA6F71FE");

            entity.Property(e => e.AlertId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("AlertID");
            entity.Property(e => e.AlertMessage)
                .IsRequired()
                .HasMaxLength(500);
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.SchemeId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("SchemeID");
            entity.Property(e => e.SentAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Farmer).WithMany(p => p.SchemeAlerts)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__SchemeAle__Farme__5AEE82B9");

            entity.HasOne(d => d.Scheme).WithMany(p => p.SchemeAlerts)
                .HasForeignKey(d => d.SchemeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__SchemeAle__Schem__5BE2A6F2");
        });

        modelBuilder.Entity<ShipmentTracking>(entity =>
        {
            entity.HasKey(e => e.ShipmentId).HasName("PK__Shipment__5CAD378D0FA8BF35");

            entity.ToTable("ShipmentTracking");

            entity.Property(e => e.ShipmentId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ShipmentID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasMaxLength(20);
            entity.Property(e => e.TransactionId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TransactionID");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Transaction).WithMany(p => p.ShipmentTrackings)
                .HasForeignKey(d => d.TransactionId)
                .HasConstraintName("FK__ShipmentT__Trans__7D439ABD");
        });

        modelBuilder.Entity<TraderCropPreference>(entity =>
        {
            entity.HasKey(e => e.PreferenceId).HasName("PK__TraderCr__E228490F75216A73");

            entity.Property(e => e.PreferenceId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("PreferenceID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CropName)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.MaxPrice).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.MaxQuantity).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.MinPrice).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.MinQuantity).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.TraderId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TraderID");

            entity.HasOne(d => d.Trader).WithMany(p => p.TraderCropPreferences)
                .HasForeignKey(d => d.TraderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TraderCro__Trade__787EE5A0");
        });

        modelBuilder.Entity<TraderFavorite>(entity =>
        {
            entity.HasKey(e => e.FavoriteId).HasName("PK__TraderFa__CE74FAF5A8B9A9B5");

            entity.HasIndex(e => new { e.TraderId, e.FarmerId }, "UQ__TraderFa__36E9A56DB71225D8").IsUnique();

            entity.Property(e => e.FavoriteId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FavoriteID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.TraderId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TraderID");

            entity.HasOne(d => d.Farmer).WithMany(p => p.TraderFavoriteFarmers)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TraderFav__Farme__74AE54BC");

            entity.HasOne(d => d.Trader).WithMany(p => p.TraderFavoriteTraders)
                .HasForeignKey(d => d.TraderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TraderFav__Trade__73BA3083");
        });

        modelBuilder.Entity<TraderProfile>(entity =>
        {
            entity.HasKey(e => e.TraderProfileId).HasName("PK__TraderPr__25CEC3613765E8C3");

            entity.HasIndex(e => e.BusinessLicenseNumber, "UQ__TraderPr__DFC8D7111FD8E89B").IsUnique();

            entity.Property(e => e.TraderProfileId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TraderProfileID");
            entity.Property(e => e.BusinessLicenseNumber).HasMaxLength(50);
            entity.Property(e => e.BusinessName)
                .IsRequired()
                .HasMaxLength(100);

            entity.HasOne(d => d.TraderProfileNavigation).WithOne(p => p.TraderProfile)
                .HasForeignKey<TraderProfile>(d => d.TraderProfileId)
                .HasConstraintName("FK__TraderPro__Trade__2F10007B");
        });

        modelBuilder.Entity<TraderReview>(entity =>
        {
            entity.HasKey(e => e.ReviewId).HasName("PK__TraderRe__74BC79AEBFA52EB5");

            entity.HasIndex(e => new { e.TransactionId, e.FarmerId, e.TraderId }, "UQ__TraderRe__21D35AD967996CF3").IsUnique();

            entity.Property(e => e.ReviewId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ReviewID");
            entity.Property(e => e.Comment).HasMaxLength(500);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.TraderId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TraderID");
            entity.Property(e => e.TransactionId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TransactionID");

            entity.HasOne(d => d.Farmer).WithMany(p => p.TraderReviewFarmers)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TraderRev__Farme__4BAC3F29");

            entity.HasOne(d => d.Trader).WithMany(p => p.TraderReviewTraders)
                .HasForeignKey(d => d.TraderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TraderRev__Trade__4CA06362");

            entity.HasOne(d => d.Transaction).WithMany(p => p.TraderReviews)
                .HasForeignKey(d => d.TransactionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TraderRev__Trans__4AB81AF0");
        });

        modelBuilder.Entity<Transaction>(entity =>
        {
            entity.HasKey(e => e.TransactionId).HasName("PK__Transact__55433A4B5DB4A248");

            entity.Property(e => e.TransactionId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TransactionID");
            entity.Property(e => e.CompletedDate).HasColumnType("datetime");
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.ListingId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ListingID");
            entity.Property(e => e.OfferedPrice).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.QuantityRequested).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.RequestDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasMaxLength(20);
            entity.Property(e => e.TraderId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("TraderID");

            entity.HasOne(d => d.Farmer).WithMany(p => p.TransactionFarmers)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Transacti__Farme__3B75D760");

            entity.HasOne(d => d.Listing).WithMany(p => p.Transactions)
                .HasForeignKey(d => d.ListingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Transacti__Listi__3D5E1FD2");

            entity.HasOne(d => d.Trader).WithMany(p => p.TransactionTraders)
                .HasForeignKey(d => d.TraderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Transacti__Trade__3C69FB99");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CCACC62F0B6B");

            entity.HasIndex(e => e.Email, "UQ__Users__A9D1053436E7E7D3").IsUnique();

            entity.Property(e => e.UserId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("UserID");
            entity.Property(e => e.Address)
                .IsRequired()
                .HasMaxLength(500);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Dob).HasColumnName("DOB");
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.FullName)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.IsActive).HasDefaultValue(true);
            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(256);
            entity.Property(e => e.PhoneNumber)
                .IsRequired()
                .HasMaxLength(15);
            entity.Property(e => e.Role)
                .IsRequired()
                .HasMaxLength(20);
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");
        });

        modelBuilder.Entity<WeatherAlert>(entity =>
        {
            entity.HasKey(e => e.AlertId).HasName("PK__WeatherA__EBB16AED35944DB5");

            entity.Property(e => e.AlertId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("AlertID");
            entity.Property(e => e.AlertMessage)
                .IsRequired()
                .HasMaxLength(500);
            entity.Property(e => e.FarmerId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("FarmerID");
            entity.Property(e => e.SentAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.WeatherId)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("WeatherID");

            entity.HasOne(d => d.Farmer).WithMany(p => p.WeatherAlerts)
                .HasForeignKey(d => d.FarmerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__WeatherAl__Farme__534D60F1");

            entity.HasOne(d => d.Weather).WithMany(p => p.WeatherAlerts)
                .HasForeignKey(d => d.WeatherId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__WeatherAl__Weath__5441852A");
        });

        modelBuilder.Entity<WeatherDatum>(entity =>
        {
            entity.HasKey(e => e.WeatherId).HasName("PK__WeatherD__0BF97BD5BA912B05");

            entity.Property(e => e.WeatherId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("WeatherID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.EventDate).HasColumnType("datetime");
            entity.Property(e => e.Region)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.WeatherType)
                .IsRequired()
                .HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }
   
   
    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    [DbFunction("ufn_GetTransactionID", "dbo")]
    public static string GetTransactionID(string shipmentID)
    {
        return null;
    }
    [DbFunction("ufn_GetLastPreferencID","dbo")]
    public static string GetLastPreferenceID()
    {
        return null;
    }
}
