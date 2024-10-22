using System;
using System.Collections.Generic;

namespace TravelManagement.Models
{
    public partial class TourTransaction
    {
        public TourTransaction()
        {
            TourMembers = new HashSet<TourMember>();
            TourPayments = new HashSet<TourPayment>();
        }

        public int TourTransactionId { get; set; }
        public string Status { get; set; } = null!;
        public DateOnly BookingDate { get; set; }
        public int? UserId { get; set; }
        public int? TourPackageId { get; set; }

        public virtual TourPackage? TourPackage { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<TourMember> ? TourMembers { get; set; }
        public virtual ICollection<TourPayment> ? TourPayments { get; set; }
    }
}
