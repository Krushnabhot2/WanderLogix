using System;
using System.Collections.Generic;

namespace TravelManagement.Models
{
    public partial class User
    {
        public User()
        {
            TourMembers = new HashSet<TourMember>();
            TourPackageGuides = new HashSet<TourPackage>();
            TourPackageMgrs = new HashSet<TourPackage>();
            TourTransactions = new HashSet<TourTransaction>();
        }

        public int UserId { get; set; }
        public string Fname { get; set; } = null!;
        public string Lname { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string PhoneNo { get; set; } = null!;
        public string? Address { get; set; }
        public string AadharNo { get; set; } = null!;
        public int? RoleId { get; set; }

        public virtual Role? Role { get; set; }
        public virtual ICollection<TourMember> ? TourMembers { get; set; }
        public virtual ICollection<TourPackage> ? TourPackageGuides { get; set; }
        public virtual ICollection<TourPackage> ? TourPackageMgrs { get; set; }
        public virtual ICollection<TourTransaction> ? TourTransactions { get; set; }
    }
}
