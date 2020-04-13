using DTS_API.Models;
using Microsoft.EntityFrameworkCore;

namespace DTS_API.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }
        public DbSet<User> Users { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Permission> Permissions { get; set; }
        public DbSet<Record> Records { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<Team> Teams { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Status> Status { get; set; }
        public DbSet<Notifications> Notifications { get; set; }
        public DbSet<NotificationDetail> NotificationDetails { get; set; }
        public DbSet<Language> Language { get; set; }
        public DbSet<ColorCode> ColorCodes { get; set; }
        public DbSet<DepartmentManger> DepartmentMangers { get; set; }
        public DbSet<PermissionDetail> PermissionDetails { get; set; }
        public DbSet<RoleUser> RoleUsers { get; set; }

        public DbSet<CategoryLang> CategoryLangs { get; set; }
        public DbSet<SubCategoryLang> SubCategoryLangs { get; set; }
        public DbSet<DepartmentLang> DepartmentLangs { get; set; }
        public DbSet<LocationLang> LocationLangs { get; set; }
        public DbSet<StatusLang> StatusLangs { get; set; }
        public DbSet<TeamLang> TeamLangs { get; set; }
        public DbSet<Menu> Menus { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Category>()
           .HasMany(p => p.CategoryLangs)
           .WithOne(t => t.Category)
           .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Team>()
            .HasMany(p => p.TeamLangs)
            .WithOne(t => t.Team)
            .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Department>()
              .HasMany(p => p.DepartmentLangs)
              .WithOne(t => t.Department)
              .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<SubCategory>()
             .HasMany(p => p.SubCategoryLangs)
             .WithOne(t => t.SubCategory)
             .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Location>()
             .HasMany(p => p.LocationLangs)
             .WithOne(t => t.Location)
             .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Status>()
           .HasMany(p => p.StatusLangs)
           .WithOne(t => t.Status)
           .OnDelete(DeleteBehavior.Cascade);
        }
    }
}